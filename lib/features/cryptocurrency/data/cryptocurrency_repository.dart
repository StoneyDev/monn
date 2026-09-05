import 'package:drift/drift.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency_with_transactions.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/shared/domain/payout_report_data.dart';
import 'package:monn/shared/domain/savings.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cryptocurrency_repository.g.dart';

class CryptocurrencyRepository {
  const CryptocurrencyRepository(this._db, this._savingsRepository);

  final AppDatabase _db;
  final SavingsRepository _savingsRepository;

  Stream<List<CryptocurrencyEntry>> watchCryptocurrencies() {
    return (_db.select(
      _db.cryptocurrencyEntries,
    )..where((t) => t.totalCrypto.isBiggerThanValue(0))).watch();
  }

  Future<CryptocurrencyWithTransactions> getCryptocurrency(
    CryptoType type,
  ) async {
    final crypto = await getOrCreateCryptocurrency(type);

    final transactions =
        await (_db.select(_db.cryptocurrencyTransactionEntries)
              ..where((t) => t.cryptocurrencyId.equals(crypto.id))
              ..orderBy([(t) => OrderingTerm.desc(t.date)]))
            .get();

    return CryptocurrencyWithTransactions(
      crypto: crypto,
      transactions: transactions,
    );
  }

  Future<CryptocurrencyEntry> getOrCreateCryptocurrency(CryptoType type) {
    return _getOrCreateCryptocurrency(type);
  }

  Future<void> editCryptocurrency({
    required CryptocurrencyEntriesCompanion crypto,
    double? transactionAmount,
    DateTime? transactionDate,
  }) async {
    await _db.transaction(() async {
      final writtenCrypto = await _upsertCryptocurrencyByType(crypto);

      if (transactionAmount != null && transactionDate != null) {
        await _db
            .into(_db.cryptocurrencyTransactionEntries)
            .insert(
              CryptocurrencyTransactionEntriesCompanion(
                cryptocurrencyId: Value(writtenCrypto.id),
                amount: Value(transactionAmount),
                date: Value(transactionDate),
              ),
            );
      }
    });
  }

  Future<void> recordTransaction({
    required CryptoType type,
    required double cryptoAmount,
    required DateTime date,
    double? investedFiatAmount,
  }) async {
    await _db.transaction(() async {
      final current = await _getOrCreateCryptocurrency(type);
      final writtenCrypto = await _upsertCryptocurrencyByType(
        CryptocurrencyEntriesCompanion(
          type: Value(type.name),
          totalCrypto: Value(current.totalCrypto + cryptoAmount),
          priceMarket: Value(current.priceMarket),
          lastUpdate: Value(current.lastUpdate),
        ),
      );

      await _db
          .into(_db.cryptocurrencyTransactionEntries)
          .insert(
            CryptocurrencyTransactionEntriesCompanion.insert(
              cryptocurrencyId: writtenCrypto.id,
              date: date,
              amount: cryptoAmount,
            ),
          );

      if (cryptoAmount > 0 && investedFiatAmount != null) {
        await _savingsRepository.incrementSavingsStartAmount(
          SavingsType.cryptocurrency,
          investedFiatAmount,
        );
      }
    });
  }

  Future<CryptocurrencyEntry> _getOrCreateCryptocurrency(
    CryptoType type,
  ) async {
    final crypto = await (_db.select(
      _db.cryptocurrencyEntries,
    )..where((t) => t.type.equals(type.name))).getSingleOrNull();

    if (crypto != null) return crypto;

    return _upsertCryptocurrencyByType(
      CryptocurrencyEntriesCompanion.insert(type: type.name),
    );
  }

  Future<CryptocurrencyEntry> _upsertCryptocurrencyByType(
    CryptocurrencyEntriesCompanion crypto,
  ) async {
    final cryptoUpsert = crypto.copyWith(id: const Value.absent());
    final type = cryptoUpsert.type.value;
    final updatedRows = await (_db.update(
      _db.cryptocurrencyEntries,
    )..where((t) => t.type.equals(type))).writeReturning(cryptoUpsert);

    if (updatedRows.isNotEmpty) return updatedRows.single;

    return _db
        .into(_db.cryptocurrencyEntries)
        .insertReturning(
          cryptoUpsert,
          onConflict: DoUpdate(
            (_) => cryptoUpsert,
            target: [_db.cryptocurrencyEntries.type],
          ),
        );
  }
}

@Riverpod(keepAlive: true)
CryptocurrencyRepository cryptocurrencyRepository(Ref ref) {
  return CryptocurrencyRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(savingsRepositoryProvider),
  );
}

@riverpod
Stream<List<CryptocurrencyEntry>> watchCryptocurrencies(Ref ref) {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);
  return repository.watchCryptocurrencies();
}

@riverpod
Future<CryptocurrencyWithTransactions> getCryptocurrency(
  Ref ref,
  CryptoType type,
) {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);
  return repository.getCryptocurrency(type);
}

@riverpod
Stream<PayoutReportData> watchPayoutReportCrypto(Ref ref) async* {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);

  await for (final results in repository.watchCryptocurrencies()) {
    final finalAmount = results.fold<double>(
      0,
      (total, crypto) => total + (crypto.totalCrypto * crypto.priceMarket),
    );

    yield PayoutReportData(
      finalAmount: double.parse(finalAmount.toStringAsFixed(2)),
    );
  }
}

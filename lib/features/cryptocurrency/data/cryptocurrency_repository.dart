import 'dart:math';

import 'package:drift/drift.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency_with_transactions.dart';
import 'package:monn/shared/domain/payout_report_data.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:monn/shared/widgets/charts/chart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cryptocurrency_repository.g.dart';

class CryptocurrencyRepository {
  const CryptocurrencyRepository(this._db);

  final AppDatabase _db;

  Stream<List<CryptocurrencyEntry>> watchCryptocurrencies() {
    return (_db.select(
      _db.cryptocurrencyEntries,
    )..where((t) => t.totalCrypto.isBiggerThanValue(0))).watch();
  }

  Future<CryptocurrencyWithTransactions> getCryptocurrency(
    CryptoType type,
  ) async {
    final crypto = await (_db.select(
      _db.cryptocurrencyEntries,
    )..where((t) => t.type.equals(type.name))).getSingleOrNull();

    if (crypto == null) {
      return CryptocurrencyWithTransactions(
        crypto: CryptocurrencyEntry(
          id: 0,
          type: type.name,
          totalCrypto: 0,
          priceMarket: 0,
        ),
        transactions: [],
      );
    }

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

  Future<void> editCryptocurrency({
    required CryptocurrencyEntriesCompanion crypto,
    double? transactionAmount,
    DateTime? transactionDate,
  }) async {
    await _db.transaction(() async {
      final writtenCrypto = await _db
          .into(_db.cryptocurrencyEntries)
          .insertReturning(crypto, onConflict: DoUpdate((_) => crypto));

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
}

@Riverpod(keepAlive: true)
CryptocurrencyRepository cryptocurrencyRepository(Ref ref) {
  return CryptocurrencyRepository(ref.watch(appDatabaseProvider));
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
Stream<Chart> watchCryptoChart(Ref ref) async* {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);

  await for (final results in repository.watchCryptocurrencies()) {
    final (totalCryptoValue, totalLog) = results.fold<(double, double)>(
      (0, 0),
      (totals, crypto) => (
        totals.$1 + (crypto.totalCrypto * crypto.priceMarket),
        totals.$2 + log((crypto.totalCrypto * crypto.priceMarket) + 1.2),
      ),
    );

    final data = results.map((crypto) {
      final logValue = log(
        (crypto.totalCrypto * crypto.priceMarket) + 1.2,
      );
      final portion = (logValue * 100) / totalLog;

      return ChartData(
        portion: double.parse(portion.toStringAsFixed(2)),
        color: crypto.cryptoType.color,
      );
    }).toList();

    yield Chart(
      totalAmount: double.parse(totalCryptoValue.toStringAsFixed(2)),
      data: data,
    );
  }
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

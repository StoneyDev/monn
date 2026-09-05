import 'package:drift/drift.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/features/reit/domain/reit_with_dividends.dart';
import 'package:monn/shared/domain/payout_report_data.dart';
import 'package:monn/shared/domain/savings.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reit_repository.g.dart';

class ReitRepository {
  const ReitRepository(this._db, this._savingsRepository);

  final AppDatabase _db;
  final SavingsRepository _savingsRepository;

  Stream<List<ReitWithDividends>> watchReits() {
    final query = _db.select(_db.reitEntries).join([
      leftOuterJoin(
        _db.reitDividendEntries,
        _db.reitDividendEntries.reitId.equalsExp(_db.reitEntries.id),
      ),
    ]);

    return query.watch().map((rows) {
      final reits = <int, ReitEntry>{};
      final dividendsByReit = <int, List<ReitDividendEntry>>{};
      for (final row in rows) {
        final reit = row.readTable(_db.reitEntries);
        reits[reit.id] = reit;
        final dividend = row.readTableOrNull(_db.reitDividendEntries);
        if (dividend != null) {
          dividendsByReit.putIfAbsent(reit.id, () => []).add(dividend);
        }
      }
      return [
        for (final reit in reits.values)
          ReitWithDividends(
            reit: reit,
            dividends: List.unmodifiable(dividendsByReit[reit.id] ?? const []),
          ),
      ];
    });
  }

  Future<void> addReit(ReitEntriesCompanion reit) async {
    await _db.transaction(() async {
      final inserted = await _db.into(_db.reitEntries).insertReturning(reit);
      await _savingsRepository.incrementSavingsStartAmount(
        SavingsType.reit,
        inserted.price * inserted.shares,
      );
    });
  }

  Future<void> addDividend(ReitDividendEntriesCompanion dividend) {
    return _db.into(_db.reitDividendEntries).insert(dividend);
  }

  Future<void> deleteReit(int id) async {
    await _db.transaction(() async {
      final reit = await (_db.select(
        _db.reitEntries,
      )..where((row) => row.id.equals(id))).getSingleOrNull();

      if (reit == null) return;

      await (_db.delete(
        _db.reitEntries,
      )..where((row) => row.id.equals(id))).go();
      await _savingsRepository.incrementSavingsStartAmount(
        SavingsType.reit,
        -(reit.price * reit.shares),
      );
    });
  }
}

@Riverpod(keepAlive: true)
ReitRepository reitRepository(Ref ref) {
  return ReitRepository(
    ref.watch(appDatabaseProvider),
    ref.watch(savingsRepositoryProvider),
  );
}

@riverpod
Stream<List<ReitWithDividends>> watchReits(Ref ref) {
  final repository = ref.watch(reitRepositoryProvider);
  return repository.watchReits();
}

@riverpod
Future<void> deleteReit(Ref ref, int id) {
  final repository = ref.watch(reitRepositoryProvider);
  return repository.deleteReit(id);
}

@riverpod
Stream<PayoutReportData> watchPayoutReportReit(Ref ref) async* {
  final repository = ref.watch(reitRepositoryProvider);
  final startAmount = await ref.watch(
    getSavingsProvider(type: SavingsType.reit).selectAsync(
      (savings) => savings?.startAmount ?? 0,
    ),
  );

  await for (final results in repository.watchReits()) {
    final totalDividends = results.fold<double>(
      0,
      (total, e) {
        final dividends = e.dividends.fold<double>(
          0,
          (total, dividend) => total + dividend.amount,
        );

        return total + dividends;
      },
    );

    final finalAmount = totalDividends + startAmount;

    yield PayoutReportData(finalAmount: finalAmount);
  }
}

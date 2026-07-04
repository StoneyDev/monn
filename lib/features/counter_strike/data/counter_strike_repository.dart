import 'package:drift/drift.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_strike_repository.g.dart';

class CounterStrikeRepository {
  const CounterStrikeRepository(this._db);

  final AppDatabase _db;

  Stream<List<CounterStrikeEntry>> watchCounterStrikes() {
    final query = _db.select(_db.counterStrikeEntries)
      ..orderBy([(t) => OrderingTerm.desc(t.purchaseValue)]);
    return query.watch();
  }

  Future<void> editCounterStrike(
    CounterStrikeEntriesCompanion newCounterStrike,
  ) {
    return _db
        .into(_db.counterStrikeEntries)
        .insertOnConflictUpdate(newCounterStrike);
  }
}

@Riverpod(keepAlive: true)
CounterStrikeRepository counterStrikeRepository(Ref ref) {
  return CounterStrikeRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<List<CounterStrikeEntry>> watchCounterStrikes(Ref ref) {
  final repository = ref.watch(counterStrikeRepositoryProvider);
  return repository.watchCounterStrikes();
}

@riverpod
Stream<PayoutReportData> watchPayoutReportCounterStrike(Ref ref) async* {
  final repository = ref.watch(counterStrikeRepositoryProvider);

  await for (final results in repository.watchCounterStrikes()) {
    final (totalValue, totalPurchase) = results.fold<(double, double)>(
      (0, 0),
      (totals, e) => (
        totals.$1 + (e.currentValue * e.quantity),
        totals.$2 + (e.purchaseValue * e.quantity),
      ),
    );

    yield PayoutReportData(
      finalAmount: double.parse(totalValue.toStringAsFixed(2)),
      totalNetProfit: double.parse(totalPurchase.toStringAsFixed(2)),
    );
  }
}

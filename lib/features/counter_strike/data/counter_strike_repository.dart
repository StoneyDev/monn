import 'package:isar/isar.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_strike_repository.g.dart';

class CounterStrikeRepository {
  const CounterStrikeRepository(this._localDB);

  final Isar _localDB;

  Stream<List<CounterStrike>> watchCounterStrikes() {
    final query = _localDB.counterStrikes.where().build();
    return query.watch(fireImmediately: true);
  }

  Future<void> editCounterStrike(CounterStrike newCounterStrike) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.counterStrikes.put(newCounterStrike);
    });
  }
}

@Riverpod(keepAlive: true)
CounterStrikeRepository counterStrikeRepository(
  CounterStrikeRepositoryRef ref,
) {
  return CounterStrikeRepository(LocalDatabase().database);
}

@riverpod
Stream<List<CounterStrike>> watchCounterStrikes(
  WatchCounterStrikesRef ref,
) {
  final repository = ref.watch(counterStrikeRepositoryProvider);
  return repository.watchCounterStrikes();
}

@riverpod
Stream<PayoutReportData> watchPayoutReportCounterStrike(
  WatchPayoutReportCounterStrikeRef ref,
) async* {
  final repository = ref.watch(counterStrikeRepositoryProvider);

  await for (final results in repository.watchCounterStrikes()) {
    final (totalValue, totalPurchase) = results.fold<(double, double)>(
      (0, 0),
      (totals, e) => (
        totals.$1 + (e.currentValue * e.quantity),
        totals.$2 + (e.purchaseValue * e.quantity)
      ),
    );

    yield PayoutReportData(
      finalAmount: double.parse(totalValue.toStringAsFixed(2)),
      totalNetProfit: double.parse(totalPurchase.toStringAsFixed(2)),
    );
  }
}

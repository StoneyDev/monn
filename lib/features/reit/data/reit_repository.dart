import 'package:isar/isar.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reit_repository.g.dart';

class ReitRepository {
  const ReitRepository(this._localDB);

  final Isar _localDB;

  Stream<List<Reit>> watchReits() {
    final query = _localDB.reits.where().build();
    return query.watch(fireImmediately: true);
  }

  Future<void> addReit(Reit reit) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.reits.put(reit);
    });
  }

  Future<void> editReit({
    required Reit reit,
    required ReitDividend dividend,
  }) async {
    reit.dividends.add(dividend);

    return _localDB.writeTxn<void>(() async {
      await _localDB.reits.put(reit);
      await _localDB.reitDividends.put(dividend);
      await reit.dividends.save();
    });
  }
}

@Riverpod(keepAlive: true)
ReitRepository reitRepository(ReitRepositoryRef ref) {
  return ReitRepository(LocalDatabase().database);
}

@riverpod
Stream<List<Reit>> watchReits(WatchReitsRef ref) {
  final repository = ref.watch(reitRepositoryProvider);
  return repository.watchReits();
}

@riverpod
Stream<PayoutReportData> watchPayoutReportReit(
  WatchPayoutReportReitRef ref,
) async* {
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

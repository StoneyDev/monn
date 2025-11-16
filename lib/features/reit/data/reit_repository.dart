import 'package:isar_community/isar.dart';
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

  Future<void> deleteReit(Reit reit) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.reits.delete(reit.id!);
      if (reit.dividends.isNotEmpty) {
        await _localDB.reitDividends.deleteAll(
          reit.dividends.map((e) => e.id!).toList(),
        );
      }
    });
  }
}

@Riverpod(keepAlive: true)
ReitRepository reitRepository(Ref ref) {
  return ReitRepository(LocalDatabase().database);
}

@riverpod
Stream<List<Reit>> watchReits(Ref ref) {
  final repository = ref.watch(reitRepositoryProvider);
  return repository.watchReits();
}

@riverpod
Future<void> deleteReit(Ref ref, Reit reit) {
  final repository = ref.watch(reitRepositoryProvider);
  return repository.deleteReit(reit);
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

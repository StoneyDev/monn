import 'package:isar_community/isar.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crowdfunding_repository.g.dart';

class CrowdfundingRepository {
  const CrowdfundingRepository(this._localDB);

  final Isar _localDB;

  Stream<List<Crowdfunding>> watchCrowdfundings() {
    final query = _localDB.crowdfundings.where().build();
    return query.watch(fireImmediately: true);
  }

  Future<void> editCrowdfunding(Crowdfunding newCrowdfunding) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.crowdfundings.put(newCrowdfunding);
    });
  }
}

@Riverpod(keepAlive: true)
CrowdfundingRepository crowdfundingRepository(Ref ref) {
  return CrowdfundingRepository(LocalDatabase().database);
}

@riverpod
Stream<List<Crowdfunding>> watchCrowdfundings(Ref ref) async* {
  final repository = ref.watch(crowdfundingRepositoryProvider);

  await for (final results in repository.watchCrowdfundings()) {
    results.sort((a, b) {
      final dateCompare = b.receivedAt!.compareTo(a.receivedAt!);
      if (dateCompare != 0) return dateCompare;
      return b.id.compareTo(a.id);
    });
    yield results;
  }
}

@riverpod
Stream<PayoutReportData> watchPayoutReportCrowdfunding(Ref ref) async* {
  final repository = ref.watch(crowdfundingRepositoryProvider);
  final startAmount = await ref.watch(
    getSavingsProvider(type: SavingsType.crowdfunding).selectAsync(
      (data) => data?.startAmount ?? 0,
    ),
  );

  await for (final results in repository.watchCrowdfundings()) {
    final (totalNetProfit, totalTaxProfit, totalLoss) = results
        .fold<(double, double, double)>(
          (0, 0, 0),
          (totals, e) => (
            totals.$1 + (e.netProfit ?? 0),
            totals.$2 + (e.taxProfit ?? 0),
            totals.$3 + (e.brutProfit.isNegative ? e.brutProfit : 0),
          ),
        );

    final totalAmount = startAmount + totalNetProfit;
    final finalAmount = totalAmount - totalLoss.abs();

    yield PayoutReportData(
      totalNetProfit: double.parse(totalNetProfit.toStringAsFixed(2)),
      totalTaxProfit: double.parse(totalTaxProfit.toStringAsFixed(2)),
      totalLoss: double.parse(totalLoss.toStringAsFixed(2)),
      finalAmount: double.parse(finalAmount.toStringAsFixed(2)),
    );
  }
}

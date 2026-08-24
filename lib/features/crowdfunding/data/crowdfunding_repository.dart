import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/shared/domain/payout_report_data.dart';
import 'package:monn/shared/domain/savings.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crowdfunding_repository.g.dart';

class CrowdfundingRepository {
  const CrowdfundingRepository(this._db);

  final AppDatabase _db;

  Stream<List<CrowdfundingEntry>> watchCrowdfundings() {
    return _db.select(_db.crowdfundingEntries).watch();
  }

  Future<void> editCrowdfunding(CrowdfundingEntriesCompanion newCrowdfunding) {
    return _db
        .into(_db.crowdfundingEntries)
        .insertOnConflictUpdate(newCrowdfunding);
  }
}

@Riverpod(keepAlive: true)
CrowdfundingRepository crowdfundingRepository(Ref ref) {
  return CrowdfundingRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<List<CrowdfundingEntry>> watchCrowdfundings(Ref ref) async* {
  final repository = ref.watch(crowdfundingRepositoryProvider);

  await for (final results in repository.watchCrowdfundings()) {
    results.sort((a, b) {
      final dateCompare = b.receivedAt.compareTo(a.receivedAt);
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

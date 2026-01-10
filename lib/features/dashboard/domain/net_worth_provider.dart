import 'package:monn/features/cash/data/cash_repository.dart';
import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/life_insurance/data/life_insurance_repository.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/per/data/per_repository.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'net_worth_provider.g.dart';

@riverpod
double getFinalAmount(Ref ref, SavingsType type) => switch (type) {
  SavingsType.savingsBook =>
    ref.watch(watchPayoutReportSavingsBookProvider).value?.finalAmount ?? 0,
  SavingsType.crowdfunding =>
    ref.watch(watchPayoutReportCrowdfundingProvider).value?.finalAmount ?? 0,
  SavingsType.cryptocurrency =>
    ref.watch(watchPayoutReportCryptoProvider).value?.finalAmount ?? 0,
  SavingsType.csKnives =>
    ref.watch(watchPayoutReportCounterStrikeProvider).value?.finalAmount ?? 0,
  SavingsType.cash =>
    ref.watch(watchPayoutReportCashProvider).value?.finalAmount ?? 0,
  SavingsType.lifeInsurance =>
    ref.watch(watchPayoutReportLifeInsuranceProvider).value?.finalAmount ?? 0,
  SavingsType.pea =>
    ref.watch(getPayoutReportPeaProvider).value?.finalAmount ?? 0,
  SavingsType.per =>
    ref.watch(watchPayoutReportPerProvider).value?.finalAmount ?? 0,
  SavingsType.reit =>
    ref.watch(watchPayoutReportReitProvider).value?.finalAmount ?? 0,
};

@riverpod
double watchTotalNetWorth(Ref ref) => SavingsType.values
    .map((type) => ref.watch(getFinalAmountProvider(type)))
    .fold<double>(0, (a, b) => a + b);

@riverpod
List<Savings> watchSortedSavings(
  Ref ref, {
  required SavingsFilter filter,
}) {
  final savingsAsync = ref.watch(watchSavingsProvider());
  final savingsFromDb = savingsAsync.value ?? <Savings>[];

  // Create a map of existing savings by type
  final savingsMap = {for (final s in savingsFromDb) s.type: s};

  // Ensure all SavingsType have an entry
  final allSavings = SavingsType.values
      .map((type) => savingsMap[type] ?? (Savings()..type = type))
      .toList();

  // Sort based on filter
  switch (filter) {
    case SavingsFilter.sortByStartAmountDesc:
      allSavings.sort(
        (Savings a, Savings b) =>
            (b.startAmount ?? 0).compareTo(a.startAmount ?? 0),
      );
    case SavingsFilter.sortByStartAmountAsc:
      allSavings.sort(
        (Savings a, Savings b) =>
            (a.startAmount ?? 0).compareTo(b.startAmount ?? 0),
      );
    case SavingsFilter.sortByFinalAmountDesc:
      allSavings.sort(
        (Savings a, Savings b) => ref
            .watch(getFinalAmountProvider(b.type))
            .compareTo(ref.watch(getFinalAmountProvider(a.type))),
      );
    case SavingsFilter.sortByFinalAmountAsc:
      allSavings.sort(
        (Savings a, Savings b) => ref
            .watch(getFinalAmountProvider(a.type))
            .compareTo(ref.watch(getFinalAmountProvider(b.type))),
      );
  }

  return allSavings;
}

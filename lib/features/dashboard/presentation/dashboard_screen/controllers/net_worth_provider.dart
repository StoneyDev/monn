import 'package:monn/features/cash/data/cash_repository.dart';
import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/life_insurance/data/life_insurance_repository.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/per/data/per_repository.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/shared/domain/savings.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/savings_entry_extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'net_worth_provider.g.dart';

enum SavingsFilter {
  sortByStartAmountDesc,
  sortByStartAmountAsc,
  sortByFinalAmountDesc,
  sortByFinalAmountAsc,
}

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
List<SavingsEntry> watchSortedSavings(
  Ref ref, {
  required SavingsFilter filter,
}) {
  final savingsAsync = ref.watch(watchSavingsProvider);
  final savingsFromDb = savingsAsync.value ?? <SavingsEntry>[];

  final savingsMap = {
    for (final s in savingsFromDb) s.savingsType: s,
  };

  final allSavings = SavingsType.values
      .map(
        (type) => savingsMap[type] ?? SavingsEntry(id: 0, type: type.name),
      )
      .toList();

  switch (filter) {
    case SavingsFilter.sortByStartAmountDesc:
      allSavings.sort(
        (SavingsEntry a, SavingsEntry b) =>
            (b.startAmount ?? 0).compareTo(a.startAmount ?? 0),
      );
    case SavingsFilter.sortByStartAmountAsc:
      allSavings.sort(
        (SavingsEntry a, SavingsEntry b) =>
            (a.startAmount ?? 0).compareTo(b.startAmount ?? 0),
      );
    case SavingsFilter.sortByFinalAmountDesc:
      allSavings.sort(
        (SavingsEntry a, SavingsEntry b) => ref
            .watch(getFinalAmountProvider(b.savingsType))
            .compareTo(ref.watch(getFinalAmountProvider(a.savingsType))),
      );
    case SavingsFilter.sortByFinalAmountAsc:
      allSavings.sort(
        (SavingsEntry a, SavingsEntry b) => ref
            .watch(getFinalAmountProvider(a.savingsType))
            .compareTo(ref.watch(getFinalAmountProvider(b.savingsType))),
      );
  }

  return allSavings;
}

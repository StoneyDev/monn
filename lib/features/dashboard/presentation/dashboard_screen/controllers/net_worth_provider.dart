import 'package:monn/features/cash/data/cash_repository.dart';
import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/life_insurance/data/life_insurance_repository.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/per/data/per_repository.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
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

typedef SortedSaving = ({
  SavingsType type,
  double? startAmount,
  double finalAmount,
});

@riverpod
Future<double> getFinalAmount(Ref ref, SavingsType type) async {
  final report = await switch (type) {
    SavingsType.savingsBook => ref.watch(
      watchPayoutReportSavingsBookProvider.future,
    ),
    SavingsType.crowdfunding => ref.watch(
      watchPayoutReportCrowdfundingProvider.future,
    ),
    SavingsType.cryptocurrency => ref.watch(
      watchPayoutReportCryptoProvider.future,
    ),
    SavingsType.csKnives => ref.watch(
      watchPayoutReportCounterStrikeProvider.future,
    ),
    SavingsType.cash => ref.watch(watchPayoutReportCashProvider.future),
    SavingsType.lifeInsurance => ref.watch(
      watchPayoutReportLifeInsuranceProvider.future,
    ),
    SavingsType.pea => ref.watch(getPayoutReportPeaProvider.future),
    SavingsType.per => ref.watch(watchPayoutReportPerProvider.future),
    SavingsType.reit => ref.watch(watchPayoutReportReitProvider.future),
  };

  return report.finalAmount;
}

@riverpod
Future<double> watchTotalNetWorth(Ref ref) async {
  final amounts = await ref.watch(watchFinalAmountsProvider.future);

  return amounts.values.fold<double>(
    0,
    (total, amount) => total + amount,
  );
}

@riverpod
Future<List<SortedSaving>> watchSortedSavings(
  Ref ref, {
  required SavingsFilter filter,
}) async {
  final savingsFuture = ref.watch(watchSavingsProvider.future);
  final finalAmountsFuture = ref.watch(watchFinalAmountsProvider.future);
  final savings = await savingsFuture;
  final finalAmounts = await finalAmountsFuture;

  return _sortSavings(savings, finalAmounts, filter);
}

@riverpod
Future<Map<SavingsType, double>> watchFinalAmounts(Ref ref) async {
  final amounts = await Future.wait(
    SavingsType.values.map(
      (type) => ref.watch(getFinalAmountProvider(type).future),
    ),
  );

  return Map.fromIterables(SavingsType.values, amounts);
}

List<SortedSaving> _sortSavings(
  List<SavingsEntry> savings,
  Map<SavingsType, double> finalAmounts,
  SavingsFilter filter,
) {
  final savingsMap = {
    for (final saving in savings) saving.savingsType: saving.startAmount,
  };

  final allSavings = SavingsType.values
      .map(
        (type) => (
          type: type,
          startAmount: savingsMap[type],
          finalAmount: finalAmounts[type]!,
        ),
      )
      .toList();

  switch (filter) {
    case SavingsFilter.sortByStartAmountDesc:
      allSavings.sort(
        (a, b) => (b.startAmount ?? 0).compareTo(a.startAmount ?? 0),
      );
    case SavingsFilter.sortByStartAmountAsc:
      allSavings.sort(
        (a, b) => (a.startAmount ?? 0).compareTo(b.startAmount ?? 0),
      );
    case SavingsFilter.sortByFinalAmountDesc:
      allSavings.sort(
        (a, b) => b.finalAmount.compareTo(a.finalAmount),
      );
    case SavingsFilter.sortByFinalAmountAsc:
      allSavings.sort(
        (a, b) => a.finalAmount.compareTo(b.finalAmount),
      );
  }

  return allSavings;
}

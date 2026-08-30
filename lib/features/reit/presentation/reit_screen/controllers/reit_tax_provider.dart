import 'package:monn/features/freelance/data/freelance_repository.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit_tax_calculator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reit_tax_provider.g.dart';

@riverpod
ReitTaxResult reitTaxCalculation(Ref ref) {
  final freelance = ref.watch(watchFreelanceProvider).value;
  final reits = ref.watch(watchReitsProvider).value ?? [];
  final currentYear = DateTime.now().year;
  var currentYearDividends = 0.0;

  for (final reit in reits) {
    currentYearDividends += reit.dividends
        .where((dividend) => dividend.receivedAt.year == currentYear)
        .fold<double>(0, (sum, dividend) => sum + dividend.amount);
  }

  return ReitTaxCalculator.calculate(
    freelanceAnnualRevenue: freelance?.annualRevenue ?? 0,
    reitDividends: currentYearDividends,
  );
}

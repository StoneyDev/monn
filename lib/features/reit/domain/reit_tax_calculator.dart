import 'package:freezed_annotation/freezed_annotation.dart';

part 'reit_tax_calculator.freezed.dart';

class ReitTaxCalculator {
  const ReitTaxCalculator._();

  static const double socialChargesRate = 0.172;
  static const double freelanceAbatementRate = 0.34;

  static const List<_TaxBracket> _taxBrackets = [
    _TaxBracket(threshold: 11497, rate: 0),
    _TaxBracket(threshold: 29315, rate: 0.11),
    _TaxBracket(threshold: 83823, rate: 0.30),
    _TaxBracket(threshold: 180294, rate: 0.41),
    _TaxBracket(threshold: double.infinity, rate: 0.45),
  ];

  static const double _decoteThreshold = 1964;
  static const double _decoteCoefficient = 1929.17;

  static double _calculateIncomeTax(double netImposable) {
    if (netImposable <= 0) return 0;

    var totalTax = 0.0;
    var previousThreshold = 0.0;

    for (final bracket in _taxBrackets) {
      if (netImposable <= previousThreshold) break;

      final taxableInBracket =
          (netImposable.clamp(previousThreshold, bracket.threshold) -
                  previousThreshold)
              .clamp(0, double.infinity);

      totalTax += taxableInBracket * bracket.rate;
      previousThreshold = bracket.threshold;
    }

    return _applyDecote(totalTax);
  }

  static double _applyDecote(double grossTax) {
    if (grossTax <= 0) return 0;
    if (grossTax >= _decoteThreshold) return grossTax;

    final decote = _decoteCoefficient - (grossTax * 0.4525);
    final taxAfterDecote = grossTax - decote;

    return taxAfterDecote > 0 ? taxAfterDecote : 0;
  }

  /// Get the marginal tax rate (TMI) for a given taxable income
  static double getTMI(double netImposable) {
    if (netImposable <= 0) return 0;

    for (final bracket in _taxBrackets) {
      if (netImposable <= bracket.threshold) {
        return bracket.rate;
      }
    }
    return _taxBrackets.last.rate;
  }

  /// Calculate SCPI taxes based on freelance income and SCPI dividends
  /// Uses the marginal method: calculates the additional tax from SCPI income
  static ReitTaxResult calculate({
    required double freelanceAnnualRevenue,
    required double reitDividends,
  }) {
    // Freelance net imposable (after 34% abatement)
    final freelanceNetImposable =
        freelanceAnnualRevenue * (1 - freelanceAbatementRate);

    // SCPI dividends are added directly (no abatement in régime réel)
    final totalNetImposable = freelanceNetImposable + reitDividends;

    // Calculate income tax with and without SCPI
    final incomeTaxWithoutReit = _calculateIncomeTax(freelanceNetImposable);
    final incomeTaxWithReit = _calculateIncomeTax(totalNetImposable);

    // Marginal income tax on SCPI dividends
    final reitIncomeTax = incomeTaxWithReit - incomeTaxWithoutReit;

    // Social charges (17.2% on SCPI dividends)
    final reitSocialCharges = reitDividends * socialChargesRate;

    // Total tax on SCPI
    final reitTotalTax = reitIncomeTax + reitSocialCharges;

    // Net after tax
    final reitNetAfterTax = reitDividends - reitTotalTax;

    // Effective tax rate on SCPI
    final effectiveTaxRate = reitDividends > 0
        ? reitTotalTax / reitDividends
        : 0.0;

    // TMI based on total income
    final tmi = getTMI(totalNetImposable);

    return ReitTaxResult(
      reitDividends: reitDividends,
      reitIncomeTax: reitIncomeTax,
      reitSocialCharges: reitSocialCharges,
      reitTotalTax: reitTotalTax,
      reitNetAfterTax: reitNetAfterTax,
      effectiveTaxRate: effectiveTaxRate,
      tmi: tmi,
    );
  }
}

class _TaxBracket {
  const _TaxBracket({required this.threshold, required this.rate});

  final double threshold;
  final double rate;
}

@freezed
abstract class ReitTaxResult with _$ReitTaxResult {
  const factory ReitTaxResult({
    required double reitDividends,
    required double reitIncomeTax,
    required double reitSocialCharges,
    required double reitTotalTax,
    required double reitNetAfterTax,
    required double effectiveTaxRate,
    required double tmi,
  }) = _ReitTaxResult;
}

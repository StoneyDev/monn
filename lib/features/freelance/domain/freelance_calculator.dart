import 'package:freezed_annotation/freezed_annotation.dart';

part 'freelance_calculator.freezed.dart';

class FreelanceCalculator {
  const FreelanceCalculator._();

  static const double abatementRate = 0.34;
  static const double urssafRate = 0.246;

  static const List<_TaxBracket> _taxBrackets = [
    _TaxBracket(threshold: 11497, rate: 0),
    _TaxBracket(threshold: 29315, rate: 0.11),
    _TaxBracket(threshold: 83823, rate: 0.30),
    _TaxBracket(threshold: 180294, rate: 0.41),
    _TaxBracket(threshold: double.infinity, rate: 0.45),
  ];

  static const double _decoteThreshold = 1964;
  static const double _decoteCoefficient = 1929.17;

  static double calculateAbatement(double annualRevenue) =>
      annualRevenue * abatementRate;

  static double calculateNetImposable(double annualRevenue) =>
      annualRevenue * (1 - abatementRate);

  static double calculateUrssaf(double annualRevenue) =>
      annualRevenue * urssafRate;

  static double calculateIncomeTax(double netImposable) {
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

  static double calculateNetAfterAll(double annualRevenue) =>
      annualRevenue -
      calculateUrssaf(annualRevenue) -
      calculateIncomeTax(calculateNetImposable(annualRevenue));

  static FreelanceResult calculate(double annualRevenue) {
    final abatement = calculateAbatement(annualRevenue);
    final netImposable = calculateNetImposable(annualRevenue);
    final urssaf = calculateUrssaf(annualRevenue);
    final incomeTax = calculateIncomeTax(netImposable);
    final totalCharges = urssaf + incomeTax;
    final netAfterAll = annualRevenue - totalCharges;

    return FreelanceResult(
      annualRevenue: annualRevenue,
      abatement: abatement,
      netImposable: netImposable,
      urssaf: urssaf,
      incomeTax: incomeTax,
      totalCharges: totalCharges,
      netAfterAll: netAfterAll,
    );
  }
}

class _TaxBracket {
  const _TaxBracket({required this.threshold, required this.rate});

  final double threshold;
  final double rate;
}

@freezed
abstract class FreelanceResult with _$FreelanceResult {
  const factory FreelanceResult({
    required double annualRevenue,
    required double abatement,
    required double netImposable,
    required double urssaf,
    required double incomeTax,
    required double totalCharges,
    required double netAfterAll,
  }) = _FreelanceResult;
}

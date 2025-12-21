import 'dart:math';

double totalReturnRate({
  required double initialValue,
  required double finalValue,
}) {
  if (initialValue == 0) return 0;
  return ((finalValue - initialValue) / initialValue) * 100;
}

double annualGrowthRate({
  required double initialValue,
  required double finalValue,
  required double duration,
}) {
  if (initialValue <= 0 || finalValue <= 0 || duration <= 0) return 0;
  return (pow(finalValue / initialValue, 1 / duration) - 1) * 100;
}

/// Calculate payback metrics for an investment
({
  bool isProfitable,
  double progress,
  double annualYield,
  double? paybackYears,
  double remaining,
})
paybackMetrics({
  required double investedAmount,
  required double totalReturns,
  required DateTime? firstReturnDate,
}) {
  if (investedAmount <= 0) {
    return (
      isProfitable: false,
      progress: 0,
      annualYield: 0,
      paybackYears: null,
      remaining: 0,
    );
  }

  final isProfitable = totalReturns >= investedAmount;
  final progress = (totalReturns / investedAmount).clamp(0.0, 1.0);

  // Years since first return
  final now = DateTime.now();
  final yearsHeld = firstReturnDate != null
      ? now.difference(firstReturnDate).inDays / 365.0
      : 0.0;

  // Average annual returns
  final avgAnnualReturns = yearsHeld >= 1
      ? totalReturns / yearsHeld
      : totalReturns;
  final annualYield = (avgAnnualReturns / investedAmount) * 100;

  // Payback calculation (only if not profitable)
  final remaining = isProfitable ? 0.0 : investedAmount - totalReturns;
  final paybackYears = isProfitable || avgAnnualReturns <= 0
      ? null
      : remaining / avgAnnualReturns;

  return (
    isProfitable: isProfitable,
    progress: progress,
    annualYield: annualYield,
    paybackYears: paybackYears,
    remaining: remaining,
  );
}

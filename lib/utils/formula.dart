import 'dart:math';

double totalReturnRate({
  required double initialValue,
  required double finalValue,
}) {
  if (initialValue == 0) return 0;
  return ((finalValue - initialValue) / initialValue) * 100;
}

double compoundAnnualGrowthRate({
  required double initialValue,
  required double finalValue,
  required double duration,
}) {
  if (initialValue <= 0 || finalValue <= 0 || duration <= 0) return 0;
  return (pow(finalValue / initialValue, 1 / duration) - 1) * 100;
}

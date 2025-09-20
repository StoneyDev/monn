import 'dart:math';

double totalReturnRate({
  required double initialValue,
  required double finalValue,
}) {
  return ((initialValue - finalValue) / initialValue) * 100;
}

double compoundAnnualGrowthRate({
  required double initialValue,
  required double finalValue,
  required double duration,
}) {
  return pow(finalValue - initialValue, 1 / duration) - 1;
}

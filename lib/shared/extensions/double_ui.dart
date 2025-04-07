import 'package:easy_localization/easy_localization.dart';

extension DoubleUI on double {
  String simpleCurrency(String locale) {
    final format = NumberFormat.simpleCurrency(locale: locale).format(this);
    return format.replaceAll(RegExp('[.,]00'), '');
  }

  String toDecimal(String locale) =>
      NumberFormat.decimalPattern(locale).format(this);
}

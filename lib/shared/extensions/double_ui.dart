import 'package:easy_localization/easy_localization.dart';

extension DoubleUI on double {
  String simpleCurrency(String locale) {
    final format = NumberFormat.simpleCurrency(locale: locale).format(this);
    return format.replaceAll(RegExp(r'[.,]00(?!\d)'), '');
  }

  String toDecimal({required String locale, int? digit}) =>
      NumberFormat.decimalPatternDigits(
        locale: locale,
        decimalDigits: digit,
      ).format(this);
}

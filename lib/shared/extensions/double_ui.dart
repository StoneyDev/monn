import 'package:intl/intl.dart';

extension DoubleUI on double {
  String simpleCurrency() {
    final currency = NumberFormat.simpleCurrency();
    return currency.format(this);
  }
}

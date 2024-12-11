import 'package:intl/intl.dart';

extension DoubleUI on double {
  String simpleCurrency() {
    final format = NumberFormat.simpleCurrency().format(this);
    return format.replaceAll(RegExp(r'.00$'), '');
  }
}

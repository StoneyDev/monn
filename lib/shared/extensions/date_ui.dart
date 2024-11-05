import 'package:intl/intl.dart';

extension DateUI on DateTime {
  String slashFormat() => DateFormat.yMd().format(this);
}

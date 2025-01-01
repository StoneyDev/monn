import 'package:easy_localization/easy_localization.dart';

extension DateUI on DateTime {
  String slashFormat(String locale) => DateFormat.yMd(locale).format(this);
}

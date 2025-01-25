import 'package:easy_localization/easy_localization.dart';

extension DateUI on DateTime {
  /// Returns 24/09/2024 in french for example
  String slashFormat(String locale, {bool withHour = false}) => withHour
      ? DateFormat.yMd(locale).add_jm().format(this)
      : DateFormat.yMd(locale).format(this);

  /// Returns the number by year
  double numberYears() {
    final now = DateTime.now();
    final diff = now.difference(this);

    return double.parse((diff.inDays / 365).toStringAsFixed(2));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension DoubleUI on double {
  String simpleCurrency(BuildContext context) {
    final format =
        NumberFormat.simpleCurrency(locale: context.locale.toString())
            .format(this);
    return format.replaceAll(RegExp('[.,]00'), '');
  }
}

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

extension ContextUi on BuildContext {
  bool isDarkTheme(ThemeMode? theme) {
    final platformBrightness = MediaQuery.platformBrightnessOf(this);
    final isDark = theme == ThemeMode.dark ||
        (theme == ThemeMode.system && platformBrightness == ui.Brightness.dark);

    return isDark;
  }
}

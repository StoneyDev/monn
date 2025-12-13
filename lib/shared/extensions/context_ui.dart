import 'dart:ui' as ui;

import 'package:flutter/material.dart';

extension ContextUi on BuildContext {
  bool isDarkTheme(ThemeMode? theme) {
    final platformBrightness = MediaQuery.platformBrightnessOf(this);
    final isDark =
        theme == ThemeMode.dark ||
        (theme == ThemeMode.system && platformBrightness == ui.Brightness.dark);

    return isDark;
  }

  Future<void> push(Widget page, {bool fullscreenDialog = false}) {
    return Navigator.push(
      this,
      MaterialPageRoute<void>(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;
}

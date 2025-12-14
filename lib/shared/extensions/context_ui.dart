import 'package:flutter/material.dart';

extension ContextUi on BuildContext {
  bool get isDarkTheme => Theme.brightnessOf(this) == Brightness.dark;

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

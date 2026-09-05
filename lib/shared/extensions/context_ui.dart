import 'package:flutter/material.dart';

extension ContextUi on BuildContext {
  bool get isDarkTheme => Theme.brightnessOf(this) == Brightness.dark;

  Future<T?> push<T>(Widget page, {bool fullscreenDialog = false}) async {
    final route = MaterialPageRoute<T>(
      builder: (_) => page,
      fullscreenDialog: fullscreenDialog,
    );
    final result = await Navigator.push(this, route);
    await route.completed;
    return result;
  }

  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;
}

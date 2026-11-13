import 'package:flutter/material.dart';
import 'package:monn/utils/app_colors.dart';

extension ContextUi on BuildContext {
  bool get isDarkTheme => Theme.brightnessOf(this) == Brightness.dark;

  Color get positiveColor =>
      isDarkTheme ? AppColors.greenDark : AppColors.green;

  Color get negativeColor => isDarkTheme ? AppColors.redDark : AppColors.red;

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

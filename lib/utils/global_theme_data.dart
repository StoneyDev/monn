import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monn/utils/app_colors.dart';

class GlobalThemeData {
  const GlobalThemeData._();

  static ThemeData light = themeData(lightColorScheme);
  static ThemeData dark = themeData(darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) => ThemeData(
        fontFamily: 'DMSans',
        useMaterial3: true,
        colorScheme: colorScheme,
        canvasColor: colorScheme.surface,
        scaffoldBackgroundColor: colorScheme.surface,
      );

  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: AppColors.darkGray,
    onPrimary: Colors.black,
    secondary: AppColors.extraExtraLightGray,
    onSecondary: AppColors.lightGray,
    error: AppColors.error,
    onSurface: AppColors.lightGray,
  );

  // TODO: darkMode
  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: AppColors.white,
    secondary: AppColors.white,
    surface: AppColors.white,
    error: AppColors.white,
    onError: AppColors.white,
    onPrimary: AppColors.white,
    onSecondary: AppColors.white,
  );

  static const SystemUiOverlayStyle systemUi = SystemUiOverlayStyle(
    // Android
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
    // iOS
    statusBarBrightness: Brightness.dark,
  );
}

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
    onPrimary: AppColors.extraExtraLightGray,
    secondary: AppColors.extraExtraLightGray,
    tertiary: AppColors.darkGray,
    error: AppColors.error,
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: AppColors.extraExtraLightGray,
    onPrimary: AppColors.darkGray,
    secondary: AppColors.lightGray,
    tertiary: AppColors.lightGray,
    error: AppColors.error,
    surface: AppColors.darkBackground,
  );

  static const SystemUiOverlayStyle lightSystemUi = SystemUiOverlayStyle(
    // Android
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.darkBackground,
    systemNavigationBarIconBrightness: Brightness.light,
    // iOS
    statusBarBrightness: Brightness.dark,
  );

  static const SystemUiOverlayStyle darkSystemUi = SystemUiOverlayStyle(
    // Android
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
    // iOS
    statusBarBrightness: Brightness.light,
  );
}

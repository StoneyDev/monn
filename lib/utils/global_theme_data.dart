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
    primary: AppColors.gray700,
    onPrimary: AppColors.white500,
    primaryContainer: AppColors.gray300,
    onPrimaryContainer: AppColors.white500,
    secondary: AppColors.blue,
    tertiary: AppColors.gray700,
    tertiaryContainer: AppColors.gray700,
    onTertiaryContainer: AppColors.white,
    error: AppColors.red,
    surface: AppColors.white500,
    onSurface: AppColors.gray700,
    surfaceContainerHighest: AppColors.white,
    onSurfaceVariant: AppColors.gray300,
    outline: AppColors.white600,
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: AppColors.white500,
    onPrimary: AppColors.gray700,
    primaryContainer: AppColors.white500,
    onPrimaryContainer: AppColors.gray300,
    secondary: AppColors.blue,
    tertiary: AppColors.white500,
    tertiaryContainer: AppColors.white500,
    onTertiaryContainer: AppColors.gray700,
    error: AppColors.red,
    surface: AppColors.gray,
    onSurface: AppColors.white500,
    surfaceContainerHighest: AppColors.gray700,
    onSurfaceVariant: AppColors.white500,
    outline: AppColors.gray300,
  );

  static const SystemUiOverlayStyle lightSystemUi = SystemUiOverlayStyle(
    // Android
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.gray,
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

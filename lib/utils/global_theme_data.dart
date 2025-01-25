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
      );

  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: AppColors.gray700,
    onPrimary: AppColors.white500,
    primaryContainer: AppColors.gray300,
    onPrimaryContainer: AppColors.white,
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

  static const List<BoxShadow> shadow = [
    BoxShadow(
      color: Color(0x1A0C0C0D),
      offset: Offset(0, 1),
      blurRadius: 4,
    ),
    BoxShadow(
      color: Color(0x0D0C0C0D),
      offset: Offset(0, 1),
      blurRadius: 4,
    ),
  ];

  static InputDecoration inputDecoration(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.outline,
        width: 2,
      ),
    );

    final inputBorderError = inputBorder.copyWith(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: 2,
      ),
    );

    return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).colorScheme.onPrimaryContainer,
      focusedBorder: inputBorder,
      enabledBorder: inputBorder,
      disabledBorder: inputBorder,
      focusedErrorBorder: inputBorderError,
      errorBorder: inputBorderError,
    );
  }
}

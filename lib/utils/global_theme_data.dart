import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class GlobalThemeData {
  const GlobalThemeData._();

  static ThemeData light = themeData(lightColorScheme);
  static ThemeData dark = themeData(darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    final theme = ThemeData(
      fontFamily: 'DMSans',
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {TargetPlatform.iOS: CupertinoPageTransitionsBuilder()},
      ),
    );
    final textTheme = theme.textTheme.copyWith(
      headlineLarge: theme.textTheme.headlineLarge?.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w800,
        letterSpacing: -1.5,
      ),
      titleLarge: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: -.6,
      ),
      titleMedium: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -.3,
      ),
    );
    return theme.copyWith(
      textTheme: textTheme,
      dividerTheme: DividerThemeData(
        color: colorScheme.outline,
        thickness: 1,
        space: 1,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled) ||
              states.contains(WidgetState.selected)) {
            return null;
          }
          return colorScheme.onSurfaceVariant;
        }),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 0,
        shape: const CircleBorder(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.surfaceContainerHighest,
          disabledForegroundColor: colorScheme.onSurfaceVariant,
          minimumSize: const Size(48, 52),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
          shape: const StadiumBorder(),
          textStyle: textTheme.titleMedium,
        ).copyWith(elevation: const WidgetStatePropertyAll(0)),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.surfaceContainerHighest,
        contentTextStyle: TextStyle(color: colorScheme.onSurface),
      ),
      tooltipTheme: TooltipThemeData(
        textStyle: TextStyle(color: colorScheme.onSurface),
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      ),
      extensions: [
        WoltModalSheetThemeData(
          backgroundColor: colorScheme.surfaceContainer,
          surfaceTintColor: Colors.transparent,
          modalElevation: 0,
          modalBarrierColor: Colors.black.withValues(alpha: .4),
          topBarElevation: 0,
          dragHandleColor: colorScheme.outline,
          dragHandleSize: const Size(36, 4),
          navBarHeight: 72,
          modalTypeBuilder: (context) => MediaQuery.sizeOf(context).width < 524
              ? const WoltBottomSheetType(
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(28),
                    ),
                  ),
                )
              : const WoltDialogType(
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(28)),
                  ),
                ),
        ),
      ],
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surfaceContainer,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -.5,
          color: colorScheme.onSurface,
        ),
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
          height: 1.5,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surfaceContainer,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme.light(
    primary: AppColors.gray,
    onPrimary: AppColors.white500,
    primaryContainer: AppColors.gray300,
    onPrimaryContainer: AppColors.white,
    secondary: AppColors.blue,
    onSecondary: AppColors.white,
    tertiary: AppColors.gray700,
    tertiaryContainer: AppColors.gray700,
    onTertiaryContainer: AppColors.white,
    error: AppColors.red,
    surface: AppColors.white500,
    onSurface: AppColors.gray700,
    surfaceContainer: AppColors.white,
    surfaceContainerHighest: AppColors.white600,
    onSurfaceVariant: Color(0xff6E6E6C),
    outline: AppColors.white600,
    outlineVariant: AppColors.white600,
  );

  static const ColorScheme darkColorScheme = ColorScheme.dark(
    primary: AppColors.white,
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
    surfaceContainer: AppColors.gray700,
    surfaceContainerHighest: AppColors.gray300,
    onSurfaceVariant: Color(0xffA0A0A0),
    outline: Color(0xff242424),
    outlineVariant: Color(0xff242424),
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
    systemNavigationBarColor: AppColors.white500,
    systemNavigationBarIconBrightness: Brightness.dark,
    // iOS
    statusBarBrightness: Brightness.light,
  );

  static const List<BoxShadow> shadow = [
    BoxShadow(color: Color(0x1A0C0C0D), offset: Offset(0, 1), blurRadius: 4),
    BoxShadow(color: Color(0x0D0C0C0D), offset: Offset(0, 1), blurRadius: 4),
  ];

  static InputDecoration inputDecoration(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
    );

    final inputBorderError = inputBorder.copyWith(
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: 2,
      ),
    );

    return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).colorScheme.surfaceContainer,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      focusedBorder: inputBorder.copyWith(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      enabledBorder: inputBorder,
      disabledBorder: inputBorder,
      focusedErrorBorder: inputBorderError,
      errorBorder: inputBorderError,
      errorMaxLines: 2,
    );
  }
}

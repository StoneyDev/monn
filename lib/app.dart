import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:monn/features/settings/presentation/settings_screen/controllers/theme_switch_controller.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/utils/global_theme_data.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(
      themeSwitchControllerProvider.select((theme) => theme.valueOrNull),
    );

    return MaterialApp(
      title: 'Monn',
      theme: GlobalThemeData.light,
      darkTheme: GlobalThemeData.dark,
      themeMode: theme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const DashboardScreen(),
      builder: (_, child) => AnnotatedRegion(
        value: context.isDarkTheme(theme)
            ? GlobalThemeData.lightSystemUi
            : GlobalThemeData.darkSystemUi,
        child: child!,
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:monn/utils/global_theme_data.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monn',
      theme: GlobalThemeData.light,
      darkTheme: GlobalThemeData.dark,
      themeMode: ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const DashboardScreen(),
    );
  }
}

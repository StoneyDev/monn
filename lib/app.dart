import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/home/presentation/home_screen.dart';
import 'package:monn/features/settings/presentation/settings_screen/controllers/theme_switch_controller.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:monn/shared/widgets/monn_error.dart';
import 'package:monn/utils/global_theme_data.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(localDatabaseProvider);
    final theme = ref.watch(
      themeSwitchControllerProvider.select((theme) => theme.value),
    );

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Monn',
        theme: GlobalThemeData.light,
        darkTheme: GlobalThemeData.dark,
        themeMode: theme,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: switch (database) {
          AsyncData() => const HomeScreen(),
          AsyncError(:final error) => Scaffold(
            body: Center(
              child: Padding(
                padding: const .all(16),
                child: MonnError(message: '$error'),
              ),
            ),
          ),
          _ => const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          ),
        },
      ),
    );
  }
}

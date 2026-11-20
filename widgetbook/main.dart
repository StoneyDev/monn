import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/generated/codegen_loader.g.dart';
import 'package:monn/utils/global_theme_data.dart';
import 'package:widgetbook/widgetbook.dart';

import 'directories.dart';

// Run with: puro flutter run -t widgetbook/main.dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('fr'), Locale('en')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MonnWidgetbook(),
      ),
    ),
  );
}

class MonnWidgetbook extends StatelessWidget {
  const MonnWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      appBuilder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: Material(child: child),
      ),
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: GlobalThemeData.light),
            WidgetbookTheme(name: 'Dark', data: GlobalThemeData.dark),
          ],
        ),
        BuilderAddon(
          name: 'Layout',
          builder: (_, child) => Center(
            child: Padding(padding: const .all(16), child: child),
          ),
        ),
      ],
    );
  }
}

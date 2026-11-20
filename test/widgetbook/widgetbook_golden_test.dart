import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monn/generated/codegen_loader.g.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/utils/global_theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgetbook/widgetbook.dart';

import '../../widgetbook/directories.dart';

void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      theme: GlobalThemeData.light,
      // No CI: only macOS goldens, rendered with the real fonts.
      ciGoldensConfig: const CiGoldensConfig(enabled: false),
    ),
    run: () {
      for (final component in _components(directories)) {
        // goldenTest registers the test synchronously; nothing to await here.
        unawaited(
          goldenTest(
            component.name,
            fileName: component.name.toSnakeCase(),
            pumpBeforeTest: (tester) async {
              await tester.pumpAndSettle();
              await precacheImages(tester);
            },
            builder: () => _Localized(
              child: GoldenTestGroup(
                columns: 2,
                children: [
                  for (final useCase in component.useCases)
                    for (final (name, theme) in [
                      ('light', GlobalThemeData.light),
                      ('dark', GlobalThemeData.dark),
                    ])
                      GoldenTestScenario(
                        name: '${useCase.name} ($name)',
                        child: SizedBox(
                          width: 390,
                          child: Theme(
                            data: theme,
                            child: Material(
                              color: theme.colorScheme.surface,
                              // Same loose layout as the Widgetbook workbench.
                              child: Padding(
                                padding: const .all(16),
                                child: Center(
                                  child: Builder(builder: useCase.build),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
        );
      }
    },
  );
}

Iterable<WidgetbookComponent> _components(List<WidgetbookNode> nodes) sync* {
  for (final node in nodes) {
    if (node is WidgetbookComponent) {
      yield node;
    } else {
      yield* _components(node.children ?? []);
    }
  }
}

/// Provides the app translations, which Alchemist's own app wrapper lacks.
class _Localized extends StatelessWidget {
  const _Localized({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('fr'), Locale('en')],
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('fr'),
        assetLoader: const CodegenLoader(),
        child: Builder(
          builder: (context) => Localizations(
            locale: context.locale,
            delegates: context.localizationDelegates,
            child: child,
          ),
        ),
      ),
    );
  }
}

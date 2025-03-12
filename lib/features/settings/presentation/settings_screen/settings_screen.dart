import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/settings/presentation/settings_screen/controllers/theme_switch_controller.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(
      themeSwitchControllerProvider.select((theme) => theme.valueOrNull),
    );

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr('settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                WoltModalSheet.show<void>(
                  context: context,
                  pageListBuilder: (context) => [
                    MonnBottomSheet.itemList(
                      context: context,
                      title: context.tr('theme'),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final item = ThemeMode.values[index];

                            return RadioListTile<ThemeMode>(
                              value: item,
                              groupValue: theme,
                              title: Text(
                                context.tr('theme_mode.${item.name}'),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              onChanged: (newTheme) {
                                ref
                                    .read(
                                      themeSwitchControllerProvider.notifier,
                                    )
                                    .toggle(newTheme!);
                                Navigator.pop(context);
                              },
                            );
                          },
                          childCount: ThemeMode.values.length,
                        ),
                      ),
                    ),
                  ],
                );
              },
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 24),
                      child: iconoir.Sparks(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr('theme'),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          context.tr('theme_mode.${theme?.name}'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                WoltModalSheet.show<void>(
                  context: context,
                  pageListBuilder: (context) => [
                    MonnBottomSheet.itemList(
                      context: context,
                      title: context.tr('language'),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final item = context.supportedLocales[index];

                            return RadioListTile<Locale>(
                              value: item,
                              groupValue: context.locale,
                              title: Text(
                                context.tr('languages.$item'),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              onChanged: (newLang) {
                                context.setLocale(newLang!);
                                Navigator.pop(context);
                              },
                            );
                          },
                          childCount: context.supportedLocales.length,
                        ),
                      ),
                    ),
                  ],
                );
              },
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 24),
                      child: iconoir.Language(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr('language'),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          context.tr(
                            'languages.${context.locale.languageCode}',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

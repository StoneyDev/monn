import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/settings/presentation/settings_screen/controllers/theme_switch_controller.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(
      themeSwitchControllerProvider.select((theme) => theme.valueOrNull),
    );

    return Scaffold(
      appBar: const MonnAppBar(
        title: 'Paramètres',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thème',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: SegmentedButton(
                style: SegmentedButton.styleFrom(
                  selectedForegroundColor:
                      Theme.of(context).colorScheme.onPrimary,
                  selectedBackgroundColor:
                      Theme.of(context).colorScheme.primary,
                ),
                segments: const [
                  ButtonSegment(
                    value: ThemeMode.light,
                    label: Text('Clair'),
                  ),
                  ButtonSegment(
                    value: ThemeMode.dark,
                    label: Text('Sombre'),
                  ),
                  ButtonSegment(
                    value: ThemeMode.system,
                    label: Text('Système'),
                  ),
                ],
                selected: {theme},
                onSelectionChanged: (newTheme) {
                  ref
                      .read(themeSwitchControllerProvider.notifier)
                      .toggle(newTheme.first!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

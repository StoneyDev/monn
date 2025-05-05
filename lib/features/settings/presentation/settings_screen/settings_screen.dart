import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/settings/presentation/settings_screen/controllers/backup_controller.dart';
import 'package:monn/features/settings/presentation/settings_screen/controllers/theme_switch_controller.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_snack_bar.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final theme = ref.watch(
      themeSwitchControllerProvider.select((theme) => theme.valueOrNull),
    );
    final backupDate = ref.watch(
      backupControllerProvider.select((theme) => theme.valueOrNull),
    );

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr('common.settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            InkWell(
              onTap: () {
                WoltModalSheet.show<void>(
                  context: context,
                  pageListBuilder: (context) => [
                    MonnBottomSheet.itemList(
                      context: context,
                      title: context.tr('common.theme'),
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
                          context.tr('common.theme'),
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
            InkWell(
              onTap: () {
                WoltModalSheet.show<void>(
                  context: context,
                  pageListBuilder: (context) => [
                    MonnBottomSheet.itemList(
                      context: context,
                      title: context.tr('common.language'),
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
                          context.tr('common.language'),
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
            InkWell(
              onLongPress: () =>
                  ref.read(backupControllerProvider.notifier).createBackup(),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 24),
                      child: iconoir.DatabaseBackup(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr('common.backup'),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          backupDate != null
                              ? DateTime.parse(backupDate).slashFormat(
                                  locale,
                                  withHour: true,
                                )
                              : context.tr('common.no_backup'),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const _BackupAction(),
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

class _BackupAction extends ConsumerWidget {
  const _BackupAction();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastBackupDate = ref.watch(
      backupControllerProvider.select((backup) => backup.valueOrNull),
    );

    return MenuAnchor(
      builder: (_, controller, __) => IconButton(
        onPressed: () =>
            controller.isOpen ? controller.close() : controller.open(),
        icon: const iconoir.MoreVert(color: AppColors.white),
      ),
      menuChildren: [
        // Import button
        MenuItemButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles();
            final filePath = result?.files.single.path;
            // "allowedExtensions" not working with .isar
            final isAllowed = filePath?.contains(RegExp('.isar')) ?? false;

            if (filePath != null && isAllowed) {
              final dbFile = File(filePath);
              final success = await ref
                  .read(backupControllerProvider.notifier)
                  .restoreDB(externalBackup: dbFile);

              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                success
                    ? MonnSnackBar.success(
                        message: context.tr('common.successfully_restored'),
                      )
                    : MonnSnackBar.error(
                        message: context.tr('common.failed_to_restore'),
                      ),
              );
            } else {
              if (!context.mounted) return;
              MonnSnackBar.error(
                message: context.tr('common.import_failed'),
              );
            }
          },
          child: Row(
            spacing: 16,
            children: [
              const iconoir.Import(color: AppColors.white),
              Text(context.tr('common.import')),
            ],
          ),
        ),
        if (lastBackupDate != null) ...[
          // Export button
          MenuItemButton(
            onPressed: () async {
              final backupDir = await getApplicationSupportDirectory();
              await SharePlus.instance.share(
                ShareParams(
                  files: [
                    XFile('${backupDir.path}/backup_$lastBackupDate.isar'),
                  ],
                ),
              );
            },
            child: Row(
              spacing: 16,
              children: [
                const iconoir.ShareIos(color: AppColors.white),
                Text(context.tr('common.export')),
              ],
            ),
          ),
          // Local restore backup button
          MenuItemButton(
            onPressed: () async {
              final success =
                  await ref.read(backupControllerProvider.notifier).restoreDB();

              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                success
                    ? MonnSnackBar.success(
                        message: context.tr('common.successfully_restored'),
                      )
                    : MonnSnackBar.error(
                        message: context.tr('common.failed_to_restore'),
                      ),
              );
            },
            child: Row(
              spacing: 16,
              children: [
                const iconoir.DatabaseRestore(color: AppColors.white),
                Text(context.tr('common.restore')),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

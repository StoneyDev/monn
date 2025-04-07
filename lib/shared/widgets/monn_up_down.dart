import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/settings/presentation/settings_screen/controllers/theme_switch_controller.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/utils/app_colors.dart';

class MonnUpDown extends ConsumerWidget {
  const MonnUpDown({required this.value, super.key});

  final double value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(
      themeSwitchControllerProvider.select((theme) => theme.valueOrNull),
    );

    return CircleAvatar(
      backgroundColor: value.isNegative
          ? AppColors.red50
          : context.isDarkTheme(theme)
              ? AppColors.gray
              : AppColors.white600,
      child: value.isNegative
          ? const iconoir.ArrowUpRight(
              width: 16,
              height: 16,
              color: AppColors.red,
            )
          : iconoir.ArrowDownLeft(
              width: 16,
              height: 16,
              color: context.isDarkTheme(theme)
                  ? AppColors.white
                  : AppColors.lightGray,
            ),
    );
  }
}

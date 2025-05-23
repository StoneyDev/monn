import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/settings/presentation/settings_screen/controllers/theme_switch_controller.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/global_theme_data.dart';

class MonnAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MonnAppBar({this.title, this.actions, super.key});

  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(
      themeSwitchControllerProvider.select((theme) => theme.valueOrNull),
    );

    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      systemOverlayStyle: context.isDarkTheme(theme)
          ? GlobalThemeData.lightSystemUi
          : GlobalThemeData.darkSystemUi,
      automaticallyImplyLeading: false,
      leading: ModalRoute.of(context)?.canPop ?? false
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: IconButton.filled(
                onPressed: () => Navigator.maybePop(context),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.outline,
                ),
                icon: const iconoir.ArrowLeft(color: AppColors.lightGray),
              ),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeight.bold,
                  ),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

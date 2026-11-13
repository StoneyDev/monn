import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/utils/global_theme_data.dart';

class MonnAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MonnAppBar({this.title, this.actions, super.key});

  final String? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      systemOverlayStyle: context.isDarkTheme
          ? GlobalThemeData.lightSystemUi
          : GlobalThemeData.darkSystemUi,
      automaticallyImplyLeading: false,
      leading: ModalRoute.of(context)?.canPop ?? false
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: IconButton.filled(
                onPressed: () => Navigator.maybePop(context),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.surfaceContainer,
                ),
                icon: iconoir.ArrowLeft(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
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

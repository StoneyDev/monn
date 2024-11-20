import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/global_theme_data.dart';

class MonnAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MonnAppBar({required this.title, this.onBack, super.key});

  final String title;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: GlobalThemeData.systemUi,
      leading: IconButton(
        onPressed: () {
          onBack?.call();
          Navigator.maybePop(context);
        },
        icon: const iconoir.ArrowLeft(
          color: AppColors.lightGray,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.lightGray,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

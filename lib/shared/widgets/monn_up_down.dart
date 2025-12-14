import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/utils/app_colors.dart';

class MonnUpDown extends StatelessWidget {
  const MonnUpDown({required this.value, super.key});

  final double value;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: value.isNegative
          ? AppColors.red50
          : context.isDarkTheme
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
              color: context.isDarkTheme
                  ? AppColors.white
                  : AppColors.lightGray,
            ),
    );
  }
}

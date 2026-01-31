import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MonnBottomSheet {
  const MonnBottomSheet._();

  static SliverWoltModalSheetPage itemList({
    required BuildContext context,
    required Widget sliver,
    required String title,
  }) {
    return SliverWoltModalSheetPage(
      surfaceTintColor: AppColors.white,
      topBarTitle: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: IconButton(
          icon: iconoir.Xmark(
            color: Theme.of(context).colorScheme.primary,
          ),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      mainContentSliversBuilder: (_) => [
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 16),
          sliver: sliver,
        ),
      ],
    );
  }

  static SliverWoltModalSheetPage warningDialog({
    required BuildContext context,
    required Widget sliver,
    required String title,
  }) {
    return SliverWoltModalSheetPage(
      surfaceTintColor: AppColors.white,
      topBarTitle: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      isTopBarLayerAlwaysVisible: true,
      mainContentSliversBuilder: (_) => [sliver],
    );
  }
}

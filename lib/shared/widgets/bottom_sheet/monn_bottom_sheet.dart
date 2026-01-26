import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MonnBottomSheet {
  const MonnBottomSheet._();

  static SliverWoltModalSheetPage reitDetails({
    required BuildContext context,
    required Reit reit,
  }) {
    final locale = context.locale.toString();
    final dividends = reit.dividends.toList().sorted((a, b) {
      final dateCompare = b.receivedAt.compareTo(a.receivedAt);
      if (dateCompare != 0) return dateCompare;
      return (b.id ?? 0).compareTo(a.id ?? 0);
    });

    return SliverWoltModalSheetPage(
      surfaceTintColor: AppColors.white,
      isTopBarLayerAlwaysVisible: true,
      topBarTitle: Text(
        // ignore: lines_longer_than_80_chars
        '${context.tr(LocaleKeys.common_dividends)} (${reit.name.toUpperCase()})',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w900,
        ),
      ),
      trailingNavBarWidget: Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: IconButton(
          icon: const iconoir.Xmark(),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.white500,
          ),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      mainContentSliversBuilder: (context) => [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = dividends[index];

              return ListTile(
                title: Text(
                  item.receivedAt.slashFormat(locale),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Text(
                  item.amount.simpleCurrency(locale),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
                ),
              );
            },
            childCount: dividends.length,
          ),
        ),
      ],
    );
  }

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
      mainContentSliversBuilder: (_) => [
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Text(context.tr(LocaleKeys.common_deletion_warning)),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          sliver: sliver,
        ),
      ],
    );
  }
}

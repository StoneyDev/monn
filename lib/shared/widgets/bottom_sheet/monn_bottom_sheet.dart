import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MonnBottomSheet {
  const MonnBottomSheet._();

  static SliverWoltModalSheetPage cryptoDetails({
    required BuildContext context,
    required Cryptocurrency crypto,
  }) {
    final transactions = crypto.transactions.toList().sorted(
          (a, b) => b.boughtOn.compareTo(a.boughtOn),
        );

    return SliverWoltModalSheetPage(
      surfaceTintColor: AppColors.white,
      isTopBarLayerAlwaysVisible: true,
      topBarTitle: Text(
        'Historique (${crypto.type.label})',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
      ),
      trailingNavBarWidget: Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: IconButton(
          icon: const iconoir.Xmark(),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.extraLightGray,
          ),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      mainContentSliversBuilder: (context) => [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = transactions[index];

              return ListTile(
                title: Text(
                  item.fiat.simpleCurrency(context),
                  style: const TextStyle(
                    color: AppColors.darkGray,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                subtitle: Text(item.boughtOn.slashFormat()),
                trailing: Text(
                  '${item.amount} ${crypto.type.symbol}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              );
            },
            childCount: transactions.length,
          ),
        ),
      ],
    );
  }

  static SliverWoltModalSheetPage reitDetails({
    required BuildContext context,
    required Reit reit,
  }) {
    final dividends = reit.dividends.toList().sorted(
          (a, b) => b.receivedAt.compareTo(a.receivedAt),
        );

    return SliverWoltModalSheetPage(
      surfaceTintColor: AppColors.white,
      isTopBarLayerAlwaysVisible: true,
      topBarTitle: Text(
        'Dividandes (${reit.name.toUpperCase()})',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
      ),
      trailingNavBarWidget: Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: IconButton(
          icon: const iconoir.Xmark(),
          style: IconButton.styleFrom(
            backgroundColor: AppColors.extraLightGray,
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
                  item.receivedAt.slashFormat(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Text(
                  item.amount.simpleCurrency(context),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.darkGray,
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
    required SliverChildBuilderDelegate builder,
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
          sliver: SliverList(delegate: builder),
        ),
      ],
    );
  }
}

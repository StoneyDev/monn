import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage reitDividendsBottomSheet({
  required BuildContext context,
  required Reit reit,
}) {
  return SliverWoltModalSheetPage(
    surfaceTintColor: AppColors.white,
    isTopBarLayerAlwaysVisible: true,
    topBarTitle: Text(
      '${context.tr(LocaleKeys.common_dividends)} (${reit.name.toUpperCase()})',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w900,
      ),
    ),
    trailingNavBarWidget: Padding(
      padding: const EdgeInsetsDirectional.only(end: 16),
      child: IconButton(
        icon: const iconoir.Xmark(),
        style: IconButton.styleFrom(backgroundColor: AppColors.white500),
        onPressed: Navigator.of(context).pop,
      ),
    ),
    mainContentSliversBuilder: (context) => [
      _ReitDividendsSliverList(reit: reit),
    ],
  );
}

class _ReitDividendsSliverList extends ConsumerWidget {
  const _ReitDividendsSliverList({required this.reit});

  final Reit reit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final asyncDividends = ref.watch(getReitDividendsProvider(reit));

    return switch (asyncDividends) {
      AsyncData(:final value) => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = value[index];

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
          childCount: value.length,
        ),
      ),
      AsyncError() => const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Center(child: Text('Error loading dividends')),
        ),
      ),
      _ => const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Center(
            child: RepaintBoundary(child: CircularProgressIndicator()),
          ),
        ),
      ),
    };
  }
}

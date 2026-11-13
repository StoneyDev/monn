import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/features/reit/domain/reit_with_dividends.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

SliverWoltModalSheetPage reitDividendsBottomSheet({
  required BuildContext context,
  required ReitWithDividends reitWithDividends,
}) {
  return MonnBottomSheet.itemList(
    context: context,
    title:
        '${context.tr(LocaleKeys.common_dividends)} '
        '(${reitWithDividends.reit.name.toUpperCase()})',
    sliver: _ReitDividendsSliverList(dividends: reitWithDividends.dividends),
  );
}

class _ReitDividendsSliverList extends StatelessWidget {
  const _ReitDividendsSliverList({required this.dividends});

  final List<ReitDividendEntry> dividends;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final sortedDividends = List<ReitDividendEntry>.from(dividends)
      ..sort((a, b) => b.receivedAt.compareTo(a.receivedAt));

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final item = sortedDividends[index];

        return ListTile(
          title: Text(
            item.receivedAt.slashFormat(locale),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Text(
            item.amount.simpleCurrency(locale),
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
        );
      }, childCount: sortedDividends.length),
    );
  }
}

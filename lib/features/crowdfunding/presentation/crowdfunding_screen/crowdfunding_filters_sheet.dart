import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class CrowdfundingFiltersSheet extends StatelessWidget {
  const CrowdfundingFiltersSheet._({
    required this.years,
    required this.selection,
    required this.showMonths,
  });

  final List<int> years;
  final ValueNotifier<({int? year, Set<int> months})> selection;
  final bool showMonths;

  static Future<({int? year, Set<int> months})?> show({
    required BuildContext context,
    required List<int> years,
    required int? year,
    required Set<int> months,
  }) async {
    final selection = ValueNotifier((year: year, months: {...months}));
    try {
      return await WoltModalSheet.show<({int? year, Set<int> months})>(
        context: context,
        pageListBuilder: (context) => [
          for (final showMonths in [false, true])
            MonnBottomSheet.itemList(
              context: context,
              title: context.tr(
                showMonths
                    ? LocaleKeys.filters_month
                    : LocaleKeys.common_filter,
              ),
              sliver: SliverToBoxAdapter(
                child: ValueListenableBuilder(
                  valueListenable: selection,
                  builder: (context, value, child) =>
                      CrowdfundingFiltersSheet._(
                        years: years,
                        selection: selection,
                        showMonths: showMonths,
                      ),
                ),
              ),
            ).copyWith(
              leadingNavBarWidget: showMonths
                  ? BackButton(
                      onPressed: () =>
                          WoltModalSheet.of(context).showPrevious(),
                    )
                  : null,
            ),
        ],
      );
    } finally {
      selection.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final (:year, :months) = selection.value;
    final monthFormat = DateFormat.MMMM(context.locale.toString());
    return Padding(
      padding: const .all(16),
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 16,
        children: [
          if (!showMonths) ...[
            Text(
              context.tr(LocaleKeys.filters_year),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            RadioGroup<int?>(
              groupValue: year,
              onChanged: (value) {
                selection.value = (
                  year: value,
                  months: value == null ? <int>{} : months,
                );
              },
              child: Column(
                children: [
                  RadioListTile<int?>(
                    value: null,
                    title: Text(
                      context.tr(LocaleKeys.filters_all_years),
                    ),
                  ),
                  for (final value in years)
                    RadioListTile<int?>(
                      value: value,
                      title: Text('$value'),
                    ),
                ],
              ),
            ),
            if (year != null)
              ListTile(
                title: Text(context.tr(LocaleKeys.filters_month)),
                subtitle: Text(
                  months.isEmpty
                      ? context.tr(LocaleKeys.filters_all_months)
                      : (months.toList()..sort())
                            .map(
                              (month) =>
                                  monthFormat.format(DateTime(year, month)),
                            )
                            .join(', '),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: WoltModalSheet.of(context).showNext,
              ),
          ],
          if (showMonths)
            ChipTheme(
              data: ChipTheme.of(context).copyWith(
                color: WidgetStateProperty.resolveWith((states) {
                  return states.contains(WidgetState.selected)
                      ? colors.primary
                      : colors.surface;
                }),
                checkmarkColor: colors.onPrimary,
                labelStyle:
                    (ChipTheme.of(context).labelStyle ??
                            Theme.of(context).textTheme.labelLarge)
                        ?.copyWith(
                          color: WidgetStateColor.resolveWith((states) {
                            return states.contains(WidgetState.selected)
                                ? colors.onPrimary
                                : colors.onSurface;
                          }),
                        ),
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilterChip(
                    label: Text(
                      context.tr(LocaleKeys.filters_all_months),
                    ),
                    selected: months.isEmpty,
                    onSelected: (_) =>
                        selection.value = (year: year, months: <int>{}),
                  ),
                  for (var value = 1; value <= 12; value++)
                    FilterChip(
                      label: Text(
                        monthFormat.format(
                          DateTime(year ?? DateTime.now().year, value),
                        ),
                      ),
                      selected: months.contains(value),
                      onSelected: (selected) {
                        final updatedMonths = {...months};
                        if (selected) {
                          updatedMonths.add(value);
                        } else {
                          updatedMonths.remove(value);
                        }
                        selection.value = (year: year, months: updatedMonths);
                      },
                    ),
                ],
              ),
            ),
          MonnButton(
            text: context.tr(LocaleKeys.filters_show_results),
            onPressed: () => Navigator.pop(context, selection.value),
          ),
          TextButton(
            onPressed: () {
              selection.value = (year: null, months: <int>{});
              if (showMonths) WoltModalSheet.of(context).showPrevious();
            },
            child: Text(context.tr(LocaleKeys.filters_reset)),
          ),
        ],
      ),
    );
  }
}

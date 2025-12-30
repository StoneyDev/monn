import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/cryptocurrency/data/coin_market_cap_repository.dart';
import 'package:monn/features/dashboard/domain/net_worth_provider.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/pea/data/etf_repository.dart';
import 'package:monn/features/settings/presentation/settings_screen/settings_screen.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/enum_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final StateProvider<SavingsFilter> _filterProvider =
    StateProvider.autoDispose<SavingsFilter>(
      (_) => SavingsFilter.sortByFinalAmountDesc,
    );

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final filter = ref.watch(_filterProvider);
    final savings = ref.watch(watchSortedSavingsProvider(filter: filter));

    // Refresh market prices on dashboard load
    ref
      ..watch(getCryptoPriceMarketProvider)
      ..watch(getEtfPriceMarketProvider);

    return Scaffold(
      appBar: MonnAppBar(
        actions: [
          IconButton(
            icon: iconoir.FilterList(
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () => WoltModalSheet.show<void>(
              context: context,
              pageListBuilder: (context) => [
                MonnBottomSheet.itemList(
                  context: context,
                  title: context.tr(LocaleKeys.common_filter),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = SavingsFilter.values[index];

                        return Consumer(
                          builder: (context, ref, _) =>
                              RadioListTile<SavingsFilter>(
                                groupValue: ref.watch(_filterProvider),
                                onChanged: (newFilter) =>
                                    ref.read(_filterProvider.notifier).state =
                                        newFilter!,
                                value: item,
                                title: Text(
                                  context.tr(
                                    'filters.${item.name.toSnakeCase()}',
                                  ),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                        );
                      },
                      childCount: SavingsFilter.values.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: iconoir.Settings(
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => context.push(const SettingsScreen()),
            ),
          ),
        ],
      ),
      body: MonnScrollView(
        slivers: [
          const _ResizingHeader(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
            sliver: SliverList.separated(
              itemBuilder: (context, index) {
                final item = savings[index];
                final finalAmount = item.type.getReport(ref);

                return MonnCard(
                  onTap: () => context.push(item.type.route()),
                  child: Row(
                    spacing: 16,
                    children: [
                      Image(
                        image: item.type.icon(),
                        height: 48,
                        width: 48,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.tr(
                                'savings.${item.type.name.toSnakeCase()}',
                              ),
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            Text(
                              finalAmount.simpleCurrency(locale),
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, _) => const SizedBox(height: 16),
              itemCount: savings.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _ResizingHeader extends ConsumerWidget {
  const _ResizingHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final total = ref.watch(watchTotalNetWorthProvider);

    return SliverResizingHeader(
      maxExtentPrototype: SizedBox(
        height: MediaQuery.sizeOf(context).height / 2,
      ),
      minExtentPrototype: const SizedBox(height: 80),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final shrinkFactor = ((constraints.maxHeight - 80) / (200 - 80))
              .clamp(0.0, 1.0);
          final opacity = shrinkFactor > 0.5 ? (shrinkFactor - 0.5) * 2 : 0.0;

          return ColoredBox(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: shrinkFactor > 0 ? (8 + (20 * shrinkFactor)) : 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: opacity,
                    child: Text(
                      context.tr(LocaleKeys.common_net_worth),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightGray,
                      ),
                    ),
                  ),
                ),
                Text(
                  total.simpleCurrency(locale),
                  style: TextStyle.lerp(
                    Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                    Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                    opacity,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

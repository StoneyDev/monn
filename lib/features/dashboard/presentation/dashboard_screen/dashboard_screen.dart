import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/add_savings_screen.dart';
import 'package:monn/features/settings/presentation/settings_screen/settings_screen.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/enum_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/global_theme_data.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final _filterProvider = StateProvider.autoDispose<SavingsFilter>(
  (_) => SavingsFilter.sortByStartAmountDesc,
);

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final filter = ref.watch(_filterProvider);
    final savings = ref.watch(watchSavingsProvider(filter: filter));
    final report = ref.watch(
      watchPayoutReportSavingsProvider.select((data) => data.valueOrNull ?? 0),
    );

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
                  title: context.tr('common.filter'),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = SavingsFilter.values[index];

                        return Consumer(
                          builder: (context, ref, _) {
                            return RadioListTile<SavingsFilter>(
                              value: item,
                              groupValue: ref.watch(_filterProvider),
                              title: Text(
                                context.tr(
                                  'filters.${item.name.toSnakeCase()}',
                                ),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              onChanged: (newFilter) => ref
                                  .read(_filterProvider.notifier)
                                  .state = newFilter!,
                            );
                          },
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
      floatingActionButton: IconButton.filled(
        icon: iconoir.Plus(color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () => context.push(const AddSavingsScreen()),
      ),
      body: MonnScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverHeaderDelegate(
              netWorth: report,
              maxEntent: MediaQuery.sizeOf(context).height / 2,
            ),
          ),
          switch (savings) {
            AsyncData(:final value) => SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
                sliver: SliverList.separated(
                  itemBuilder: (context, index) {
                    final item = value[index];
                    final finalAmount = item.type.getReport(ref);

                    return MonnCard(
                      onTap: () => context.push(item.type.route()),
                      child: Row(
                        children: [
                          Image(
                            image: item.type.icon(),
                            height: 48,
                            width: 48,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.tr(
                                    'savings.${item.type.name.toSnakeCase()}',
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        color: AppColors.lightGray,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  finalAmount.simpleCurrency(locale),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
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
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: value.length,
                ),
              ),
            AsyncError(:final error) => SliverToBoxAdapter(
                child: Text(
                  'Error: $error',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            _ => const SliverFillRemaining(
                child: Center(
                  child: RepaintBoundary(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          },
        ],
      ),
    );
  }
}

class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  const _SliverHeaderDelegate({
    required this.netWorth,
    required this.maxEntent,
  });

  final double netWorth;
  final double maxEntent;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final locale = context.locale.toString();
    final progress = shrinkOffset / maxExtent;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 60),
      decoration: BoxDecoration(
        boxShadow: GlobalThemeData.shadow,
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCrossFade(
            crossFadeState: progress <= 0.3
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: Durations.short4,
            alignment: Alignment.bottomCenter,
            firstChild: Text(
              context.tr('common.net_worth'),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.lightGray,
                  ),
            ),
            secondChild: const SizedBox.shrink(),
          ),
          Text(
            netWorth.simpleCurrency(locale),
            style: TextStyle.lerp(
              Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
              Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
              progress,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxEntent;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate != this;
}

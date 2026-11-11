import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/cryptocurrency/data/coin_market_cap_repository.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen/controllers/net_worth_provider.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen/savings_type_ui.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen/widgets/net_worth_history_chart.dart';
import 'package:monn/features/pea/data/etf_repository.dart';
import 'package:monn/features/settings/presentation/settings_screen/controllers/backup_controller.dart';
import 'package:monn/features/settings/presentation/settings_screen/database_restore_dialog.dart';
import 'package:monn/features/settings/presentation/settings_screen/settings_screen.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:monn/shared/widgets/monn_error.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/utils/global_theme_data.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final StateProvider<SavingsFilter> _filterProvider =
    StateProvider.autoDispose<SavingsFilter>(
      (_) => SavingsFilter.sortByFinalAmountDesc,
    );

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  // Scrubbing the chart only rebuilds the header and the chart.
  final _selection = ValueNotifier<NetWorthSnapshot?>(null);
  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();
    // Refreshing prices also records today's snapshot, which depends on them.
    _lifecycleListener = AppLifecycleListener(
      onResume: () => ref
        ..invalidate(getCryptoPriceMarketProvider)
        ..invalidate(getEtfPriceMarketProvider),
    );
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    _selection.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final locale = context.locale.toString();
    final filter = ref.watch(_filterProvider);
    final savings = ref.watch(watchSortedSavingsProvider(filter: filter));
    final total = ref.watch(watchTotalNetWorthProvider);

    // Refreshes market prices, then records today's snapshot. Watched here
    // because the dashboard stays mounted, unlike the lazily built chart.
    ref.watch(recordNetWorthSnapshotProvider);

    return Scaffold(
      body: MonnScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            backgroundColor: theme.scaffoldBackgroundColor,
            scrolledUnderElevation: 0,
            systemOverlayStyle: context.isDarkTheme
                ? GlobalThemeData.lightSystemUi
                : GlobalThemeData.darkSystemUi,
            expandedHeight: 156,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              expandedTitleScale: 2,
              titlePadding: const EdgeInsets.only(
                left: 24,
                right: 120,
                bottom: 12,
              ),
              title: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: ValueListenableBuilder(
                  valueListenable: _selection,
                  builder: (context, selected, _) => Text(
                    (selected?.total ?? total.value)?.simpleCurrency(locale) ??
                        '—',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -.75,
                      color: colors.onSurface,
                    ),
                  ),
                ),
              ),
              background: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: kToolbarHeight + 20,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: ValueListenableBuilder(
                      valueListenable: _selection,
                      builder: (context, selected, _) => Text(
                        selected == null
                            ? context.tr(LocaleKeys.common_net_worth)
                            : DateFormat.yMMMd(locale).format(selected.day),
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: colors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton.filled(
                tooltip: context.tr(LocaleKeys.common_filter),
                style: IconButton.styleFrom(
                  backgroundColor: colors.surfaceContainer,
                ),
                icon: iconoir.FilterList(color: colors.primary),
                onPressed: () => WoltModalSheet.show<void>(
                  context: context,
                  pageListBuilder: (context) => [
                    MonnBottomSheet.itemList(
                      context: context,
                      title: context.tr(LocaleKeys.common_filter),
                      sliver: Consumer(
                        builder: (context, ref, _) => SliverToBoxAdapter(
                          child: RadioGroup<SavingsFilter>(
                            groupValue: ref.watch(_filterProvider),
                            onChanged: (newFilter) =>
                                ref.read(_filterProvider.notifier).state =
                                    newFilter!,
                            child: Column(
                              children: [
                                for (final item in SavingsFilter.values)
                                  RadioListTile<SavingsFilter>(
                                    value: item,
                                    title: Text(
                                      context.tr(
                                        'filters.${item.name.toSnakeCase()}',
                                      ),
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: IconButton.filled(
                  tooltip: context.tr(LocaleKeys.common_settings),
                  style: IconButton.styleFrom(
                    backgroundColor: colors.surfaceContainer,
                  ),
                  icon: iconoir.Settings(color: colors.primary),
                  onPressed: () async {
                    final request = await context.push<DatabaseRestoreRequest>(
                      const SettingsScreen(),
                    );
                    if (!context.mounted || request == null) return;

                    final backupController = ref.read(
                      backupControllerProvider.notifier,
                    );
                    await showDialog<void>(
                      context: context,
                      barrierDismissible: false,
                      builder: (_) => DatabaseRestoreDialog(
                        request: request,
                        restore: backupController.restoreDB,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: NetWorthHistoryChart(selection: _selection),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
              child: Text(
                context.tr(LocaleKeys.home_savings),
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: 32 + MediaQuery.paddingOf(context).bottom,
            ),
            sliver: switch (savings) {
              AsyncData(:final value) => SliverList.separated(
                itemBuilder: (context, index) {
                  final item = value[index];
                  final savingsKey = 'savings.${item.type.name.toSnakeCase()}';

                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => context.push<void>(item.type.route()),
                      splashFactory: NoSplash.splashFactory,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 20,
                        ),
                        child: Row(
                          spacing: 16,
                          children: [
                            Image(
                              image: item.type.icon(),
                              height: 44,
                              width: 44,
                            ),
                            Expanded(
                              child: Text(
                                context.tr(savingsKey),
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item.finalAmount.simpleCurrency(locale),
                                textAlign: TextAlign.end,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, _) =>
                    const Divider(indent: 24, endIndent: 24),
                itemCount: value.length,
              ),
              AsyncError(:final error) => SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: MonnError(message: error.toString()),
                ),
              ),
              _ => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
            },
          ),
        ],
      ),
    );
  }
}

import 'package:drift/drift.dart' show Value;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/presentation/crowdfunding_screen/crowdfunding_filters_sheet.dart';
import 'package:monn/features/crowdfunding/presentation/crowdfunding_screen/crowdfunding_transaction_card.dart';
import 'package:monn/features/crowdfunding/presentation/edit_crowdfunding_screen/edit_crowdfunding_screen.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/features/portfolio/presentation/controllers/edit_savings_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/domain/savings.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/payout_report.dart';
import 'package:monn/utils/app_colors.dart';

final _startAmountProvider = StateProvider<String?>((ref) {
  final crowdfunding = ref.watch(getSavingsProvider(type: .crowdfunding)).value;
  return (crowdfunding?.startAmount ?? '').toString();
});

class CrowdfundingScreen extends ConsumerStatefulWidget {
  const CrowdfundingScreen({super.key});

  @override
  ConsumerState<CrowdfundingScreen> createState() => _CrowdfundingScreenState();
}

class _CrowdfundingScreenState extends ConsumerState<CrowdfundingScreen> {
  int? _year;
  Set<int> _months = {};

  Future<void> _showFilters(BuildContext context, List<int> years) async {
    final selection = await CrowdfundingFiltersSheet.show(
      context: context,
      years: years,
      year: _year,
      months: _months,
    );
    if (!mounted || selection == null) return;
    setState(() {
      _year = selection.year;
      _months = selection.months;
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final savingsCrowdfunding = ref.watch(
      getSavingsProvider(type: .crowdfunding),
    );
    final crowdfundingData = ref.watch(
      getSavingsProvider(
        type: .crowdfunding,
      ).select((data) => data.value),
    );
    final crowdfundings = ref.watch(watchCrowdfundingsProvider);
    final report = ref.watch(
      watchPayoutReportCrowdfundingProvider.select((data) => data.value),
    );

    final entries = crowdfundings.value ?? <CrowdfundingEntry>[];
    final years = {
      for (final entry in entries) entry.receivedAt.year,
      ?_year,
    }.toList()..sort((a, b) => b.compareTo(a));
    final filterCount = (_year != null ? 1 : 0) + (_months.isNotEmpty ? 1 : 0);
    final filteredEntries = entries.where((entry) {
      return (_year == null || entry.receivedAt.year == _year) &&
          (_months.isEmpty || _months.contains(entry.receivedAt.month));
    }).toList();

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(
          'savings.${SavingsType.crowdfunding.name.toSnakeCase()}',
        ),
      ),
      floatingActionButton: IconButton.filled(
        icon: iconoir.Plus(color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const EditCrowdfundingScreen(),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            (report?.finalAmount ?? 0).simpleCurrency(locale),
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          switch (savingsCrowdfunding) {
            AsyncData(:final value) => Center(
              child: OutlinedButton(
                child: Text(
                  (value?.startAmount ?? 0).simpleCurrency(locale),
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(color: AppColors.lightGray),
                ),
                onPressed: () => context.push<void>(
                  fullscreenDialog: true,
                  AmountScreen(
                    initialValue: crowdfundingData?.startAmount ?? 0,
                    onChanged: (value) =>
                        ref.read(_startAmountProvider.notifier).state = value,
                    onSubmit: () async {
                      final newValue = ref.read(_startAmountProvider);
                      final newSaving = SavingsEntriesCompanion(
                        id: Value(value!.id),
                        type: Value(value.type),
                        startAmount: Value(double.parse(newValue!)),
                      );

                      final success = await ref
                          .read(editSavingsControllerProvider.notifier)
                          .submit(newSaving);
                      if (!context.mounted || !success) return;

                      ref
                        ..invalidate(_startAmountProvider)
                        // Refresh finalAmount
                        ..invalidate(watchPayoutReportCrowdfundingProvider)
                        ..invalidate(
                          getSavingsProvider(type: SavingsType.crowdfunding),
                        );
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
            _ => const SizedBox.shrink(),
          },
          const SizedBox(height: 14),
          PayoutReport(
            netProfit: report?.totalNetProfit ?? 0,
            tax: report?.totalTaxProfit ?? 0,
            loss: report?.totalLoss ?? 0,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Row(
              spacing: 16,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        context.tr(LocaleKeys.filters_transactions),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (_year != null)
                        Text(
                          [
                            '$_year',
                            if (_months.isNotEmpty)
                              (_months.toList()..sort())
                                  .map(
                                    (month) => DateFormat.MMM(
                                      locale,
                                    ).format(DateTime(_year!, month)),
                                  )
                                  .join(', '),
                          ].join(' · '),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ],
                  ),
                ),
                OutlinedButton.icon(
                  icon: const iconoir.FilterList(),
                  label: Text(
                    [
                      context.tr(LocaleKeys.common_filter),
                      if (_year != null) '$filterCount',
                    ].join(' · '),
                  ),
                  onPressed: () => _showFilters(context, years),
                ),
              ],
            ),
          ),
          switch (crowdfundings) {
            AsyncData() when filteredEntries.isEmpty => Expanded(
              child: Center(
                child: Text(context.tr(LocaleKeys.filters_no_results)),
              ),
            ),
            AsyncData() => Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
                itemBuilder: (_, index) =>
                    CrowdfundingTransactionCard(filteredEntries[index]),
                separatorBuilder: (_, _) => const SizedBox(height: 16),
                itemCount: filteredEntries.length,
                cacheExtent: 250,
              ),
            ),
            AsyncError(:final error) => Text(
              'Error: $error',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            _ => const Center(
              child: RepaintBoundary(child: CircularProgressIndicator()),
            ),
          },
        ],
      ),
    );
  }
}

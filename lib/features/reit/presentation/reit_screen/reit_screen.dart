import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/reit_form_step_one_screen.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_financial_info.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/formula.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ReitScreen extends ConsumerWidget {
  const ReitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final savingsReit = ref.watch(
      getSavingsProvider(type: SavingsType.reit).select(
        (value) => value.value,
      ),
    );
    final reits = ref.watch(watchReitsProvider);
    final finalAmount = ref.watch(
      watchPayoutReportReitProvider.select(
        (data) => data.value?.finalAmount ?? 0,
      ),
    );
    final taxResult = ref.watch(reitTaxCalculationProvider);

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(
          'savings.${SavingsType.reit.name.toSnakeCase()}',
        ),
      ),
      floatingActionButton: IconButton.filled(
        icon: iconoir.Plus(color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const ReitFormStepOneScreen(),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            finalAmount.simpleCurrency(locale),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text(
              (savingsReit?.startAmount ?? 0).simpleCurrency(locale),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.lightGray,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MonnFinancialInfo(
                  title: context.tr('common.gross'),
                  data: context.tr(
                    'common.per_year',
                    args: [taxResult.reitDividends.simpleCurrency(locale)],
                  ),
                ),
                MonnFinancialInfo(
                  title: context.tr('common.net'),
                  data: context.tr(
                    'common.per_year',
                    args: [taxResult.reitNetAfterTax.simpleCurrency(locale)],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Divider(
            color: Theme.of(context).colorScheme.outline,
            height: 0,
          ),
          switch (reits) {
            AsyncData(:final value) => Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
                itemBuilder: (_, index) {
                  final item = value[index];
                  final totalDividends = item.dividends.fold<double>(
                    0,
                    (total, div) => total + div.amount,
                  );
                  final investedAmount = item.shares * item.price;
                  final firstDividendDate = item.dividends.isNotEmpty
                      ? item.dividends
                            .reduce(
                              (a, b) =>
                                  a.receivedAt.isBefore(b.receivedAt) ? a : b,
                            )
                            .receivedAt
                      : null;

                  final metrics = paybackMetrics(
                    investedAmount: investedAmount,
                    totalReturns: totalDividends,
                    firstReturnDate: firstDividendDate,
                  );

                  return MonnCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name.toUpperCase(),
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: AppColors.lightGray,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          totalDividends.simpleCurrency(locale),
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                        Row(
                          spacing: 24,
                          children: [
                            MonnFinancialInfo(
                              title: context.tr('common.start_amount'),
                              data: investedAmount,
                            ),
                            MonnFinancialInfo(
                              title: context.tr('common.part'),
                              data: item.shares,
                            ),
                            MonnFinancialInfo(
                              title: context.tr('common.worth'),
                              data: item.price,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          spacing: 24,
                          children: [
                            MonnFinancialInfo(
                              title: context.tr('common.annual_yield'),
                              data:
                                  '${metrics.annualYield.toStringAsFixed(1)}%',
                            ),
                            MonnFinancialInfo(
                              title: context.tr('common.payback'),
                              data: metrics.isProfitable
                                  ? context.tr('common.payback_recovered')
                                  : metrics.paybackYears != null
                                  ? context.tr(
                                      'common.payback_years',
                                      args: [
                                        metrics.paybackYears!
                                            .round()
                                            .toString(),
                                      ],
                                    )
                                  : '-',
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: metrics.progress,
                                  backgroundColor: AppColors.lightGray
                                      .withValues(alpha: 0.3),
                                  color: metrics.isProfitable
                                      ? Colors.green
                                      : Theme.of(context).colorScheme.primary,
                                  minHeight: 8,
                                ),
                              ),
                            ),
                            Text(
                              '${(metrics.progress * 100).toStringAsFixed(0)}%',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          metrics.isProfitable
                              ? context.tr(
                                  'common.profit_amount',
                                  args: [
                                    (totalDividends - investedAmount)
                                        .simpleCurrency(locale),
                                  ],
                                )
                              : context.tr(
                                  'common.remaining',
                                  args: [
                                    metrics.remaining.simpleCurrency(locale),
                                  ],
                                ),
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: metrics.isProfitable
                                    ? Colors.green
                                    : AppColors.lightGray,
                              ),
                        ),
                      ],
                    ),
                    onLongPress: () => WoltModalSheet.show<void>(
                      context: context,
                      modalTypeBuilder: (_) => WoltModalType.alertDialog(),
                      pageListBuilder: (context) => [
                        MonnBottomSheet.warningDialog(
                          context: context,
                          title: item.name.toUpperCase(),
                          sliver: SliverToBoxAdapter(
                            child: Column(
                              spacing: 8,
                              children: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Center(
                                    child: Text(context.tr('button.close')),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await ref.read(
                                      deleteReitProvider(item).future,
                                    );
                                    final success = await ref
                                        .read(
                                          editSavingsControllerProvider
                                              .notifier,
                                        )
                                        .submit(
                                          savingsReit!
                                            ..startAmount =
                                                savingsReit.startAmount! -
                                                investedAmount,
                                        );
                                    if (!context.mounted || !success) return;
                                    ref.invalidate(
                                      getSavingsProvider(
                                        type: SavingsType.reit,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  },
                                  child: Center(
                                    child: Text(context.tr('button.ok')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () => WoltModalSheet.show<void>(
                      context: context,
                      pageListBuilder: (context) => [
                        MonnBottomSheet.reitDetails(
                          context: context,
                          reit: item,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: 16),
                itemCount: value.length,
                cacheExtent: 250,
              ),
            ),
            AsyncError(:final error) => Text('error: $error'),
            _ => const RepaintBoundary(
              child: CircularProgressIndicator(),
            ),
          },
        ],
      ),
    );
  }
}

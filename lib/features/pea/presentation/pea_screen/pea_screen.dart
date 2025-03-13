import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/features/pea/data/google_finance_repository.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/presentation/pea_form_screen/pea_form_screen.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/shared/widgets/monn_line.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/shared/widgets/payout_report.dart';
import 'package:monn/utils/app_colors.dart';

final _startAmountProvider = StateProvider.autoDispose<String?>(
  (ref) {
    final pea =
        ref.refresh(getSavingsProvider(type: SavingsType.pea)).valueOrNull;
    return (pea?.startAmount ?? '').toString();
  },
);

class PeaScreen extends ConsumerWidget {
  const PeaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final openingDate = DateTime(2024, 3, 26);
    final eligibility = openingDate.numberYears() >= 5;
    final peaData = ref.watch(getPeaProvider);
    final etfPrice = ref.watch(getEtfPriceMarketProvider(stock: 'ESE:EPA'));
    final savingsPea = ref.refresh(getSavingsProvider(type: SavingsType.pea));
    final report = ref.watch(getPayoutReportPeaProvider).valueOrNull;

    return Scaffold(
      appBar: MonnAppBar(
        title: SavingsType.pea.label,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Tooltip(
              message: context.tr(
                'opening_account',
                args: [
                  '${openingDate.numberYears()}',
                  if (eligibility) '17,2%' else '30%',
                ],
              ),
              triggerMode: TooltipTriggerMode.tap,
              textStyle: const TextStyle(color: AppColors.blue),
              showDuration: const Duration(seconds: 3),
              decoration: const BoxDecoration(
                color: AppColors.blue50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                spacing: 8,
                children: [
                  Text(
                    context.tr('taxation'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: eligibility ? AppColors.green : AppColors.red,
                    ),
                  ),
                  if (eligibility)
                    const iconoir.CheckCircleSolid(color: AppColors.green)
                  else
                    const iconoir.XmarkCircleSolid(color: AppColors.red),
                ],
              ),
            ),
          ),
        ],
      ),
      body: MonnScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 20),
                Text(
                  (report?.finalAmount ?? 0).simpleCurrency(locale),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                switch (savingsPea) {
                  AsyncData(:final value) => Center(
                      child: OutlinedButton(
                        child: Text(
                          (value?.startAmount ?? 0).simpleCurrency(locale),
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.lightGray,
                                  ),
                        ),
                        onPressed: () => context.push(
                          fullscreenDialog: true,
                          AmountScreen(
                            provider: _startAmountProvider,
                            initialValue: value?.startAmount ?? 0,
                            onChanged: (value) => ref
                                .read(_startAmountProvider.notifier)
                                .state = value,
                            onSubmit: () async {
                              final newValue = ref.read(_startAmountProvider);
                              final newSaving = value?.copyWith(
                                startAmount: double.parse(newValue!),
                              );

                              final success = await ref
                                  .read(
                                    editSavingsControllerProvider.notifier,
                                  )
                                  .submit(newSaving!);
                              if (!context.mounted || !success) return;

                              ref
                                ..invalidate(_startAmountProvider)
                                ..invalidate(
                                  getSavingsProvider(type: SavingsType.pea),
                                );
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                  _ => const SizedBox.shrink(),
                },
                const SizedBox(height: 32),
                PayoutReport(
                  netProfit: report?.totalNetProfit ?? 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: switch (peaData) {
                    AsyncData(:final value) => Column(
                        spacing: 16,
                        children: [
                          MonnLine(
                            title: 'ETF',
                            value: Text(
                              'BNP Paribas Easy S&P 500',
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColors.lightGray),
                            ),
                          ),
                          MonnLine(
                            title: 'ISIN',
                            value: Text(
                              'FR0011550185',
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColors.lightGray),
                            ),
                          ),
                          MonnLine(
                            title: context.tr('number_equities'),
                            value: Text(
                              '${value?.equity ?? 0}',
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColors.lightGray),
                            ),
                          ),
                          MonnLine(
                            title: context.tr('average_purchase_price'),
                            value: Text(
                              (value?.costAverage ?? 0).simpleCurrency(locale),
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColors.lightGray),
                            ),
                          ),
                          MonnLine(
                            title: context.tr('current_price'),
                            value: switch (etfPrice) {
                              AsyncData(:final value) => Text(
                                  value.simpleCurrency(locale),
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: AppColors.lightGray),
                                ),
                              AsyncError() => Text(
                                  'Scraping failed',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              _ => Text(
                                  context.tr('loading'),
                                  textAlign: TextAlign.right,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: AppColors.lightGray),
                                )
                            },
                          ),
                          MonnLine(
                            title: context.tr('last_update'),
                            value: Text(
                              value?.lastUpdate == null
                                  ? etfPrice.isLoading
                                      ? context.tr('loading')
                                      : DateTime.now().slashFormat(
                                          locale,
                                          withHour: true,
                                        )
                                  : value!.lastUpdate!.slashFormat(
                                      locale,
                                      withHour: true,
                                    ),
                              textAlign: TextAlign.right,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: AppColors.lightGray),
                            ),
                          ),
                        ],
                      ),
                    _ => const Center(
                        child: RepaintBoundary(
                          child: CircularProgressIndicator(),
                        ),
                      )
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MonnButton(
            text: context.tr('update_data'),
            onPressed: () => context.push(const PeaFormScreen()),
          ),
        ),
      ),
    );
  }
}

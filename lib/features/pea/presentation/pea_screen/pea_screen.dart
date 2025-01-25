import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/features/pea/data/google_finance_repository.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/presentation/pea_form_screen/controllers/pea_form_controller.dart';
import 'package:monn/features/pea/presentation/pea_form_screen/pea_form_screen.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/dialogs/monn_dialog.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/shared/widgets/monn_line.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/shared/widgets/payout_report.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final _startAmountProvider = StateProvider<String?>((_) => null);

class PeaScreen extends ConsumerWidget {
  const PeaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final formKey = GlobalKey<FormState>();
    final openingDate = DateTime(2024, 3, 26);
    final eligibility = openingDate.numberYears() >= 5;
    final peaData = ref.watch(getPeaProvider);
    final etfPrice = ref.watch(getEtfPriceMarketProvider(stock: 'ESE:EPA'));
    final savingsPea = ref.watch(
      getSavingsProvider(type: SavingsType.pea).select(
        (data) => data.valueOrNull,
      ),
    );
    final report = ref.watch(
      getPayoutReportPeaProvider.select((data) => data.valueOrNull),
    );

    return Scaffold(
      appBar: MonnAppBar(
        title: SavingsType.pea.label,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Tooltip(
              message: context.tr(
                'opening_account',
                args: ['${openingDate.numberYears()}'],
              ),
              triggerMode: TooltipTriggerMode.tap,
              textStyle: const TextStyle(color: AppColors.blue),
              exitDuration: const Duration(seconds: 5),
              decoration: const BoxDecoration(
                color: AppColors.blue50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Text(
                    context.tr('taxation'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: eligibility ? AppColors.green : AppColors.red,
                    ),
                  ),
                  const SizedBox(width: 8),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: MediaQuery.sizeOf(context).width - 32,
        child: MonnButton(
          text: context.tr('update_data'),
          onPressed: peaData.isLoading
              ? null
              : () {
                  final pea = peaData.valueOrNull;
                  ref.read(peaFormControllerProvider.notifier).update(
                        (form) => form.copyWith(
                          equity: pea?.equity,
                          costAverage: pea?.costAverage,
                        ),
                      );
                  context.push(const PeaFormScreen());
                },
        ),
      ),
      body: MonnScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  (report?.finalAmount ?? 0).simpleCurrency(locale),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
                GestureDetector(
                  onTap: () => WoltModalSheet.show<void>(
                    context: context,
                    barrierDismissible: true,
                    modalTypeBuilder: (_) => WoltModalType.dialog(),
                    pageListBuilder: (context) => [
                      MonnDialog.amount(
                        context: context,
                        formKey: formKey,
                        initialValue: savingsPea?.startAmount.toString(),
                        onChanged: (value) {
                          if (value.isEmpty) return;
                          ref.read(_startAmountProvider.notifier).state = value;
                        },
                        onSubmit: () async {
                          final newValue = ref.read(_startAmountProvider);

                          if (formKey.currentState!.validate() &&
                              newValue != null) {
                            final newSaving = savingsPea?.copyWith(
                              startAmount: double.parse(newValue),
                            );

                            final success = await ref
                                .read(editSavingsControllerProvider.notifier)
                                .submit(newSaving!);
                            if (!context.mounted || !success) return;
                          }

                          ref
                            ..invalidate(_startAmountProvider)
                            ..invalidate(
                              getSavingsProvider(type: SavingsType.pea),
                            );
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 4,
                    children: [
                      Text(
                        (savingsPea?.startAmount ?? 0).simpleCurrency(locale),
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.lightGray,
                                ),
                      ),
                      const iconoir.EditPencil(
                        color: AppColors.lightGray,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                PayoutReport(
                  netProfit: report?.totalNetProfit ?? 0,
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              16,
              24,
              16,
              MediaQuery.viewPaddingOf(context).bottom * 2.6,
            ),
            sliver: SliverToBoxAdapter(
              child: switch (peaData) {
                AsyncData(:final value) => Column(
                    spacing: 16,
                    children: [
                      MonnLine(
                        title: 'ETF',
                        value: Text(
                          'BNP Paribas Easy S&P 500',
                          textAlign: TextAlign.right,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.lightGray,
                                  ),
                        ),
                      ),
                      MonnLine(
                        title: 'ISIN',
                        value: Text(
                          'FR0011550185',
                          textAlign: TextAlign.right,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.lightGray,
                                  ),
                        ),
                      ),
                      MonnLine(
                        title: context.tr('number_equities'),
                        value: Text(
                          '${value?.equity ?? 0}',
                          textAlign: TextAlign.right,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.lightGray,
                                  ),
                        ),
                      ),
                      MonnLine(
                        title: context.tr('average_purchase_price'),
                        value: Text(
                          (value?.costAverage ?? 0).simpleCurrency(locale),
                          textAlign: TextAlign.right,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.lightGray,
                                  ),
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
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.lightGray,
                                  ),
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
          ),
        ],
      ),
    );
  }
}

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
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ReitScreen extends ConsumerWidget {
  const ReitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final savingsReit = ref.watch(
      getSavingsProvider(type: SavingsType.reit).select(
        (value) => value.valueOrNull,
      ),
    );
    final reits = ref.watch(watchReitsProvider);
    final finalAmount = ref.watch(
      watchPayoutReportReitProvider.select(
        (data) => data.valueOrNull?.finalAmount ?? 0,
      ),
    );

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
          const SizedBox(height: 32),
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
                    final amount = item.dividends
                        .fold<double>(0, (total, div) => total + div.amount);
                    final startAmount = item.shares * item.price;

                    return MonnCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name.toUpperCase(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  color: AppColors.lightGray,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            amount.simpleCurrency(locale),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.w900),
                          ),
                          Row(
                            spacing: 24,
                            children: [
                              MonnFinancialInfo(
                                title: context.tr('common.start_amount'),
                                data: startAmount,
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
                                            savingsReit!.copyWith(
                                              startAmount:
                                                  savingsReit.startAmount! -
                                                      startAmount,
                                            ),
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
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: value.length,
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

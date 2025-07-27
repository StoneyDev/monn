import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:monn/features/crowdfunding/presentation/edit_crowdfunding_screen/controllers/crowdfunding_form_controller.dart';
import 'package:monn/features/crowdfunding/presentation/edit_crowdfunding_screen/edit_crowdfunding_screen.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_up_down.dart';
import 'package:monn/shared/widgets/payout_report.dart';
import 'package:monn/utils/app_colors.dart';

final _startAmountProvider = StateProvider<String?>((ref) {
  final crowdfunding = ref
      .refresh(getSavingsProvider(type: SavingsType.crowdfunding))
      .valueOrNull;
  return (crowdfunding?.startAmount ?? '').toString();
});

class CrowdfundingScreen extends ConsumerWidget {
  const CrowdfundingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final savingsCrowdfunding =
        ref.refresh(getSavingsProvider(type: SavingsType.crowdfunding));
    final crowdfundingData = ref.watch(
      getSavingsProvider(type: SavingsType.crowdfunding).select(
        (data) => data.valueOrNull,
      ),
    );
    final crowdfundings = ref.watch(watchCrowdfundingsProvider);
    final report = ref.watch(
      watchPayoutReportCrowdfundingProvider.select((data) => data.valueOrNull),
    );

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
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          switch (savingsCrowdfunding) {
            AsyncData(:final value) => Center(
                child: OutlinedButton(
                  child: Text(
                    (value?.startAmount ?? 0).simpleCurrency(locale),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.lightGray,
                        ),
                  ),
                  onPressed: () => context.push(
                    fullscreenDialog: true,
                    AmountScreen(
                      initialValue: crowdfundingData?.startAmount ?? 0,
                      onChanged: (value) =>
                          ref.read(_startAmountProvider.notifier).state = value,
                      onSubmit: () async {
                        final newValue = ref.read(_startAmountProvider);
                        final newSaving = value?.copyWith(
                          startAmount: double.parse(newValue!),
                        );

                        final success = await ref
                            .read(editSavingsControllerProvider.notifier)
                            .submit(newSaving!);
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
          switch (crowdfundings) {
            AsyncData(:final value) => Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
                  itemBuilder: (_, index) => _RefundTransaction(value[index]),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: value.length,
                  cacheExtent: 250,
                ),
              ),
            AsyncError(:final error) => Text(
                'Error: $error',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            _ => const Center(
                child: RepaintBoundary(
                  child: CircularProgressIndicator(),
                ),
              ),
          },
        ],
      ),
    );
  }
}

class _RefundTransaction extends ConsumerWidget {
  const _RefundTransaction(this.crowdfunding);

  final Crowdfunding crowdfunding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final isExempt = (crowdfunding.netProfit ?? 0) != crowdfunding.brutProfit;

    return MonnCard(
      onLongPress: () {
        ref.read(crowdfundingFormControllerProvider.notifier)
          ..id(id: crowdfunding.id)
          ..platformName(platformName: crowdfunding.platformName)
          ..brutProfit(brutProfit: crowdfunding.brutProfit.toString())
          ..receivedAt(receivedAt: crowdfunding.receivedAt!)
          ..taxPercentage(
            taxPercentage: crowdfunding.taxPercentage != null
                ? '${crowdfunding.taxPercentage}'
                : null,
          );
        context.push(EditCrowdfundingScreen(crowdfunding: crowdfunding));
      },
      child: Row(
        children: [
          MonnUpDown(value: crowdfunding.brutProfit),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  crowdfunding.platformName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  crowdfunding.receivedAt!.slashFormat(locale),
                  style: const TextStyle(color: AppColors.lightGray),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          if (crowdfunding.brutProfit.isNegative)
            Text(
              crowdfunding.brutProfit.simpleCurrency(locale),
              style: const TextStyle(
                color: AppColors.red,
                fontWeight: FontWeight.bold,
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  crowdfunding.netProfit!.simpleCurrency(locale),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  isExempt
                      ? '(${crowdfunding.brutProfit})'
                      : context.tr('common.exempt'),
                  style: TextStyle(
                    color: isExempt ? AppColors.lightGray : AppColors.green,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

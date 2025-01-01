import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:monn/features/crowdfunding/presentation/add_crowdfunding_screen/add_crowdfunding_screen.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/dialogs/monn_dialog.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/payout_report.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final _startAmountProvider = StateProvider<String?>((_) => null);

class CrowdfundingScreen extends ConsumerWidget {
  const CrowdfundingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final locale = context.locale.toString();
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
      appBar: MonnAppBar(title: SavingsType.crowdfunding.label),
      floatingActionButton: IconButton.filled(
        icon: iconoir.Plus(color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const AddCrowdfundingScreen(),
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
          GestureDetector(
            onTap: () => WoltModalSheet.show<void>(
              context: context,
              barrierDismissible: true,
              modalTypeBuilder: (_) => WoltModalType.dialog(),
              pageListBuilder: (context) => [
                MonnDialog.amount(
                  context: context,
                  formKey: formKey,
                  initialValue: crowdfundingData?.startAmount.toString(),
                  onChanged: (value) {
                    if (value.isEmpty) return;
                    ref.read(_startAmountProvider.notifier).state = value;
                  },
                  onSubmit: () async {
                    final newValue = ref.read(_startAmountProvider);

                    if (formKey.currentState!.validate() && newValue != null) {
                      final newSaving = crowdfundingData?.copyWith(
                        startAmount: double.parse(newValue),
                      );

                      final success = await ref
                          .read(editSavingsControllerProvider.notifier)
                          .submit(newSaving!);
                      if (!context.mounted || !success) return;
                    }

                    ref
                      ..invalidate(_startAmountProvider)
                      // Refresh finalAmount
                      ..invalidate(watchPayoutReportCrowdfundingProvider);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (crowdfundingData?.startAmount ?? 0).simpleCurrency(locale),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.lightGray,
                      ),
                ),
                const SizedBox(width: 4),
                const iconoir.EditPencil(
                  color: AppColors.lightGray,
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.all(16),
            child: PayoutReport(
              netProfit: report?.totalNetProfit ?? 0,
              tax: report?.totalTaxProfit ?? 0,
              loss: report?.totalLoss ?? 0,
            ),
          ),
          switch (crowdfundings) {
            AsyncData(:final value) => Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  itemBuilder: (_, index) => _RefundTransaction(value[index]),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: value.length,
                ),
              ),
            AsyncError(:final error) => Text('error: $error'),
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

class _RefundTransaction extends StatelessWidget {
  const _RefundTransaction(this.data);

  final Crowdfunding data;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();

    return Row(
      children: [
        const CircleAvatar(
          backgroundColor: AppColors.white,
          child: iconoir.Coins(),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.platformName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: AppColors.gray700,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(data.receivedAt!.slashFormat(locale)),
            ],
          ),
        ),
        const SizedBox(width: 10),
        if (data.brutProfit.isNegative)
          Text(
            data.brutProfit.simpleCurrency(locale),
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
                data.netProfit.simpleCurrency(locale),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.gray700,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '(${data.brutProfit})',
                style: const TextStyle(color: AppColors.lightGray),
              ),
            ],
          ),
      ],
    );
  }
}

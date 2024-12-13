import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/reit_form_step_one_screen.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/bottom_sheet/moon_bottom_sheet.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_financial_info.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class ReitScreen extends ConsumerWidget {
  const ReitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startAmount = ref.watch(
      getSavingsProvider(type: SavingsType.reit).select(
        (value) => value.valueOrNull?.startAmount ?? 0,
      ),
    );
    final reits = ref.watch(watchReitsProvider);
    final finalAmount = ref.watch(
      watchPayoutReportReitProvider.select(
        (data) => data.valueOrNull?.finalAmount ?? 0,
      ),
    );

    return Scaffold(
      appBar: MonnAppBar(title: SavingsType.reit.label),
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
            finalAmount.simpleCurrency(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w900,
                ),
          ),
          Text(
            startAmount.simpleCurrency(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.lightGray,
                ),
          ),
          const SizedBox(height: 16),
          switch (reits) {
            AsyncData(:final value) => Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  itemBuilder: (_, index) {
                    final item = value[index];
                    final amount = item.dividends
                        .fold<double>(0, (total, div) => total + div.amount);

                    return MonnCard(
                      title: Text(
                        item.name.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColors.lightGray,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      amount: Text(
                        amount.simpleCurrency(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      children: [
                        MonnFinancialInfo(
                          title: 'Vers. ini.',
                          data: item.shares * item.price,
                        ),
                        const SizedBox(width: 24),
                        MonnFinancialInfo(
                          title: 'Part',
                          data: item.shares.toStringAsFixed(0),
                        ),
                        const SizedBox(width: 24),
                        MonnFinancialInfo(
                          title: 'Valeur',
                          data: item.price,
                        ),
                      ],
                      onTap: () => WoltModalSheet.show<void>(
                        context: context,
                        pageListBuilder: (context) => [
                          MoonBottomSheet.reitDetails(
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

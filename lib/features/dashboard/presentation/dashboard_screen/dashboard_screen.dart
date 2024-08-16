import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/presentation/add_saving_screen/add_saving_screen.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/moon_card.dart';
import 'package:monn/shared/widgets/moon_financial_info.dart';
import 'package:monn/shared/widgets/payout_report.dart';
import 'package:monn/utils/app_colors.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savings = ref.watch(watchSavingsProvider);

    return Scaffold(
      floatingActionButton: IconButton.filled(
        icon: const iconoir.Plus(color: AppColors.white),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const AddSavingScreen(),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Valeur totale',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.lightGray,
                  ),
            ),
            Text(
              0.0.simpleCurrency(), // TODO
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.darkGray,
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16),
              child: PayoutReport(), // TODO
            ),
            switch (savings) {
              AsyncData(:final value) => Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 32,
                    ),
                    itemBuilder: (context, index) {
                      final item = value[index];

                      return MoonCard(
                        title: item.type.label,
                        totalAmount: 0, // TODO
                        children: [
                          Expanded(
                            child: MoonFinancialInfo(
                              title: 'Vers. ini.',
                              amount: item.startAmount,
                            ),
                          ),
                          Expanded(
                            child: MoonFinancialInfo(
                              title: 'Intérêts totaux',
                              amount: item.income,
                            ),
                          ),
                        ],
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
      ),
    );
  }
}

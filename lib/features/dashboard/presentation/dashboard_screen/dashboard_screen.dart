import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/add_savings_screen.dart';
import 'package:monn/features/settings/presentation/settings_screen/settings_screen.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/savings_type_ui.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/utils/app_colors.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savings = ref.watch(watchSavingsProvider);
    final report = ref.watch(
      watchPayoutReportSavingsProvider.select(
        (data) => data.valueOrNull ?? 0,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: iconoir.Settings(
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const SettingsScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: IconButton.filled(
        icon: iconoir.Plus(color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const AddSavingsScreen(),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              context.tr('net_worth'),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.lightGray,
                  ),
            ),
            Text(
              report.simpleCurrency(context),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            const SizedBox(height: 16),
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
                      final finalAmount = item.type.getReport(ref);

                      return MonnCard(
                        title: Text(
                          item.type.label,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        amount: Text(
                          finalAmount.simpleCurrency(context),
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => item.type.route(),
                          ),
                        ),
                      );
                    },
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
      ),
    );
  }
}

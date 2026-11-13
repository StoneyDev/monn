import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/freelance/data/freelance_repository.dart';
import 'package:monn/features/freelance/domain/freelance_calculator.dart';
import 'package:monn/features/freelance/presentation/freelance_screen/controllers/freelance_form_controller.dart';
import 'package:monn/features/freelance/presentation/freelance_screen/widgets/breakdown_section.dart';
import 'package:monn/features/freelance/presentation/urssaf_calculator_screen/urssaf_calculator_screen.dart';
import 'package:monn/features/freelance/presentation/widgets/revenue_summary.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';

class FreelanceScreen extends ConsumerWidget {
  const FreelanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final freelance = ref.watch(watchFreelanceProvider);

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(LocaleKeys.home_freelance),
        actions: [
          IconButton(
            tooltip: context.tr(LocaleKeys.freelance_urssaf_calculator),
            icon: iconoir.Calculator(
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () => context.push<void>(const UrssafCalculatorScreen()),
          ),
        ],
      ),
      body: MonnScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(
              bottom: 48 + MediaQuery.paddingOf(context).bottom,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                switch (freelance) {
                  AsyncData() => const Column(
                    spacing: 24,
                    children: [
                      _FreelanceHeader(),
                      ChargesBreakdown(),
                      CalculationBreakdown(),
                    ],
                  ),
                  AsyncError(:final error) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Error: $error',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                  _ => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: RepaintBoundary(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                },
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

class _FreelanceHeader extends ConsumerWidget {
  const _FreelanceHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final freelance = ref.watch(watchFreelanceProvider).value;
    final annualRevenue = freelance?.annualRevenue ?? 0;
    final result = ref.watch(freelanceCalculationProvider);

    return RevenueSummary(
      label: context.tr(LocaleKeys.freelance_annual_net),
      amount: result.netAfterAll,
      highlight: result.netAfterAll / 12,
      caption: context.tr(LocaleKeys.freelance_monthly_equivalent),
      revenueLabel: context.tr(LocaleKeys.freelance_annual_revenue),
      revenue: annualRevenue,
      remaining: result.netAfterAll,
      training: annualRevenue * FreelanceCalculator.cfpRate,
      incomeTax: result.incomeTax,
      onEdit: () => _openAmountScreen(
        context: context,
        ref: ref,
        annualRevenue: annualRevenue,
      ),
    );
  }

  void _openAmountScreen({
    required BuildContext context,
    required WidgetRef ref,
    required double annualRevenue,
  }) {
    final formNotifier = ref.read(freelanceFormControllerProvider.notifier);

    unawaited(
      context.push<void>(
        fullscreenDialog: true,
        AmountScreen(
          initialValue: annualRevenue,
          onSubmit: () async {
            final success = await formNotifier.submit();

            if (!context.mounted || !success) return;

            ref.invalidate(freelanceFormControllerProvider);
            Navigator.pop(context);
          },
          onChanged: (newAmount) => formNotifier.set(annualRevenue: newAmount),
        ),
      ),
    );
  }
}

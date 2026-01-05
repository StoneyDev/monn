import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/freelance/data/freelance_repository.dart';
import 'package:monn/features/freelance/presentation/freelance_screen/controllers/freelance_form_controller.dart';
import 'package:monn/features/freelance/presentation/freelance_screen/widgets/breakdown_section.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/utils/app_colors.dart';

class FreelanceScreen extends ConsumerWidget {
  const FreelanceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final freelance = ref.watch(watchFreelanceProvider);

    return Scaffold(
      appBar: MonnAppBar(title: context.tr(LocaleKeys.home_freelance)),
      body: MonnScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 48),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                switch (freelance) {
                  AsyncData() => const Column(
                    spacing: 24,
                    children: [
                      _FreelanceHeader(),
                      _RevenueRecap(),
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
    final locale = context.locale.toString();
    final freelance = ref.watch(watchFreelanceProvider).value;
    final annualRevenue = freelance?.annualRevenue ?? 0;
    final result = ref.watch(freelanceCalculationProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 14),
      child: Column(
        children: [
          Text(
            result.netAfterAll.simpleCurrency(locale),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          OutlinedButton(
            onPressed: () => _openAmountScreen(
              context: context,
              ref: ref,
              annualRevenue: annualRevenue,
            ),
            child: Text(
              annualRevenue.simpleCurrency(locale),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: AppColors.lightGray,
              ),
            ),
          ),
        ],
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
      context.push(
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

class _RevenueRecap extends ConsumerWidget {
  const _RevenueRecap();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final freelance = ref.watch(watchFreelanceProvider).value;
    final annualRevenue = freelance?.annualRevenue ?? 0;
    final result = ref.watch(freelanceCalculationProvider);

    if (annualRevenue == 0) return const SizedBox.shrink();

    final remainingPercent = (result.netAfterAll / annualRevenue * 100).round();
    final deductedPercent = 100 - remainingPercent;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MonnCard(
        child: Column(
          spacing: 16,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 12,
                child: Row(
                  children: [
                    Expanded(
                      flex: remainingPercent,
                      child: const ColoredBox(
                        color: AppColors.green,
                        child: SizedBox.expand(),
                      ),
                    ),
                    Expanded(
                      flex: deductedPercent,
                      child: const ColoredBox(
                        color: AppColors.red,
                        child: SizedBox.expand(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${context.tr(LocaleKeys.freelance_remaining)} '
                      '· $remainingPercent%',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      result.netAfterAll.simpleCurrency(locale),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.green,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${context.tr(LocaleKeys.freelance_deducted)} '
                      '· $deductedPercent%',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      result.totalCharges.simpleCurrency(locale),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

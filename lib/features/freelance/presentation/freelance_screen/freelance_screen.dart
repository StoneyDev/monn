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
import 'package:monn/shared/widgets/monn_scroll_view.dart';

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
    final locale = context.locale.toString();
    final freelance = ref.watch(watchFreelanceProvider).value;
    final annualRevenue = freelance?.annualRevenue ?? 0;
    final result = ref.watch(freelanceCalculationProvider);

    final theme = Theme.of(context);
    final monthlyNet = (result.netAfterAll / 12).simpleCurrency(locale);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 24,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                context.tr(LocaleKeys.freelance_annual_net),
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  result.netAfterAll.simpleCurrency(locale),
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$monthlyNet · ',
                      style: TextStyle(
                        color: context.positiveColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: context.tr(LocaleKeys.freelance_monthly_equivalent),
                    ),
                  ],
                ),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: theme.colorScheme.surfaceContainer,
              foregroundColor: theme.colorScheme.onSurface,
              padding: const EdgeInsets.all(24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            onPressed: () => _openAmountScreen(
              context: context,
              ref: ref,
              annualRevenue: annualRevenue,
            ),
            child: Row(
              spacing: 16,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        context.tr(LocaleKeys.freelance_annual_revenue),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        annualRevenue.simpleCurrency(locale),
                        style: theme.textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.edit_outlined,
                  color: theme.colorScheme.onSurfaceVariant,
                  size: 20,
                ),
              ],
            ),
          ),
          const _RevenueRecap(),
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

class _RevenueRecap extends ConsumerWidget {
  const _RevenueRecap();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final freelance = ref.watch(watchFreelanceProvider).value;
    final annualRevenue = freelance?.annualRevenue ?? 0;
    final result = ref.watch(freelanceCalculationProvider);

    if (annualRevenue == 0) return const SizedBox.shrink();

    final remainingPercent = (result.netAfterAll / annualRevenue * 100).round();
    final deductedPercent = 100 - remainingPercent;

    final theme = Theme.of(context);

    return Column(
      spacing: 12,
      children: [
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '${context.tr(LocaleKeys.freelance_remaining)} '
                '· $remainingPercent%',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: context.positiveColor,
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${context.tr(LocaleKeys.freelance_deducted)} '
                '· $deductedPercent%',
                textAlign: TextAlign.end,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: context.negativeColor,
                ),
              ),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 8,
            child: Row(
              spacing: 3,
              children: [
                Expanded(
                  flex: remainingPercent,
                  child: ColoredBox(
                    color: context.positiveColor,
                    child: const SizedBox.expand(),
                  ),
                ),
                Expanded(
                  flex: deductedPercent,
                  child: ColoredBox(
                    color: context.negativeColor,
                    child: const SizedBox.expand(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

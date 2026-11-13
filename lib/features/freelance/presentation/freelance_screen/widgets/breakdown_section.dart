import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/freelance/data/freelance_repository.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/monn_card.dart';

class CalculationBreakdown extends ConsumerWidget {
  const CalculationBreakdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final freelance = ref.watch(watchFreelanceProvider).value;
    final annualRevenue = freelance?.annualRevenue ?? 0;
    final result = ref.watch(freelanceCalculationProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              context.tr(LocaleKeys.freelance_calculation),
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          MonnCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 16,
              children: [
                _ChargeLineItem(
                  title: context.tr(LocaleKeys.freelance_gross_revenue),
                  subtitle: context.tr(LocaleKeys.freelance_before_abatement),
                  amount: annualRevenue.simpleCurrency(locale),
                  amountColor: Theme.of(context).colorScheme.onSurface,
                ),
                _ChargeLineItem(
                  title: context.tr(LocaleKeys.freelance_abatement_title),
                  subtitle: context.tr(LocaleKeys.freelance_abatement_rate),
                  amount: '-${result.abatement.simpleCurrency(locale)}',
                  amountColor: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                Divider(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  height: 0,
                ),
                _ChargeLineItem(
                  title: context.tr(LocaleKeys.freelance_net_imposable),
                  subtitle: context.tr(LocaleKeys.freelance_after_abatement),
                  amount: result.netImposable.simpleCurrency(locale),
                  amountColor: Theme.of(context).colorScheme.onSurface,
                  isTotal: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChargesBreakdown extends ConsumerWidget {
  const ChargesBreakdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final result = ref.watch(freelanceCalculationProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              context.tr(LocaleKeys.freelance_charges),
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          MonnCard(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 16,
              children: [
                _ChargeLineItem(
                  title: context.tr(LocaleKeys.freelance_urssaf_label),
                  subtitle: context.tr(LocaleKeys.freelance_urssaf_rate),
                  amount: '-${result.urssaf.simpleCurrency(locale)}',
                  amountColor: context.negativeColor,
                ),
                _ChargeLineItem(
                  title: context.tr(LocaleKeys.freelance_income_tax_title),
                  subtitle: context.tr(
                    LocaleKeys.freelance_estimated_deduction,
                  ),
                  amount: '-${result.incomeTax.simpleCurrency(locale)}',
                  amountColor: context.negativeColor,
                ),
                Divider(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  height: 0,
                ),
                _ChargeLineItem(
                  title: context.tr(LocaleKeys.freelance_total_charges),
                  subtitle: context.tr(LocaleKeys.freelance_social_fiscal),
                  amount: '-${result.totalCharges.simpleCurrency(locale)}',
                  amountColor: context.negativeColor,
                  isTotal: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChargeLineItem extends StatelessWidget {
  const _ChargeLineItem({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    this.isTotal = false,
  });

  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      spacing: 16,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                amount,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
                  color: amountColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

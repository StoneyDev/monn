import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/freelance/data/freelance_repository.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/utils/app_colors.dart';

class CalculationBreakdown extends ConsumerWidget {
  const CalculationBreakdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final freelance = ref.watch(watchFreelanceProvider).value;
    final annualRevenue = freelance?.annualRevenue ?? 0;
    final result = ref.watch(freelanceCalculationProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              context.tr(LocaleKeys.freelance_calculation),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MonnCard(
            child: Column(
              spacing: 16,
              children: [
                _ChargeLineItem(
                  title: context.tr(LocaleKeys.freelance_gross_revenue),
                  subtitle: context.tr(LocaleKeys.freelance_before_abatement),
                  amount: annualRevenue.simpleCurrency(locale),
                  barColor: AppColors.green,
                ),
                _ChargeLineItem(
                  title: context.tr(LocaleKeys.freelance_abatement_title),
                  subtitle: context.tr(LocaleKeys.freelance_abatement_rate),
                  amount: '-${result.abatement.simpleCurrency(locale)}',
                  barColor: AppColors.lightGray,
                ),
                Divider(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  height: 0,
                ),
                Row(
                  spacing: 12,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          Icons.receipt_long_rounded,
                          color: Theme.of(context).colorScheme.primary,
                          size: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.tr(LocaleKeys.freelance_net_imposable),
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            context.tr(LocaleKeys.freelance_after_abatement),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      result.netImposable.simpleCurrency(locale),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              context.tr(LocaleKeys.freelance_charges),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MonnCard(
            child: Column(
              spacing: 16,
              children: [
                _ChargeLineItem(
                  title: context.tr(LocaleKeys.freelance_urssaf_label),
                  subtitle: context.tr(LocaleKeys.freelance_urssaf_rate),
                  amount: '-${result.urssaf.simpleCurrency(locale)}',
                  barColor: AppColors.red,
                ),
                _ChargeLineItem(
                  title: context.tr(LocaleKeys.freelance_income_tax_title),
                  subtitle: context.tr(
                    LocaleKeys.freelance_estimated_deduction,
                  ),
                  amount: '-${result.incomeTax.simpleCurrency(locale)}',
                  barColor: AppColors.red,
                ),
                Divider(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  height: 0,
                ),
                Row(
                  spacing: 12,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.red50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.trending_down_rounded,
                          color: AppColors.red,
                          size: 24,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.tr(LocaleKeys.freelance_total_charges),
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            context.tr(LocaleKeys.freelance_social_fiscal),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '-${result.totalCharges.simpleCurrency(locale)}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                      ),
                    ),
                  ],
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
    required this.barColor,
  });

  final String title;
  final String subtitle;
  final String amount;
  final Color barColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        SizedBox(
          width: 4,
          height: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: barColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        Text(
          amount,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: barColor,
          ),
        ),
      ],
    );
  }
}

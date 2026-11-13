import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/utils/app_colors.dart';

class RevenueSummary extends StatelessWidget {
  const RevenueSummary({
    required this.label,
    required this.amount,
    required this.highlight,
    required this.caption,
    required this.revenueLabel,
    required this.revenue,
    required this.remaining,
    required this.onEdit,
    this.training = 0,
    this.incomeTax = 0,
    super.key,
  });

  final String label;
  final double amount;
  final double highlight;
  final String caption;
  final String revenueLabel;
  final double revenue;
  final double remaining;
  final double training;
  final double incomeTax;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final theme = Theme.of(context);

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
                label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  amount.simpleCurrency(locale),
                  style: theme.textTheme.headlineLarge,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${highlight.simpleCurrency(locale)} · ',
                      style: TextStyle(
                        color: context.positiveColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(text: caption),
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
            onPressed: onEdit,
            child: Row(
              spacing: 16,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      Text(
                        revenueLabel,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        revenue.simpleCurrency(locale),
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
          if (revenue != 0)
            _RevenueRecap(
              revenue: revenue,
              remaining: remaining,
              training: training,
              incomeTax: incomeTax,
            ),
        ],
      ),
    );
  }
}

class _RevenueRecap extends StatelessWidget {
  const _RevenueRecap({
    required this.revenue,
    required this.remaining,
    required this.training,
    required this.incomeTax,
  });

  final double revenue;
  final double remaining;
  final double training;
  final double incomeTax;

  @override
  Widget build(BuildContext context) {
    // Tenths of a percent, so the bar keeps integer flex values.
    final remainingTenths = (remaining / revenue * 1000).round().clamp(0, 1000);
    final deductedTenths = 1000 - remainingTenths;
    final trainingTenths = (training / revenue * 1000).round().clamp(
      0,
      deductedTenths,
    );
    final taxTenths = (incomeTax / revenue * 1000).round().clamp(
      0,
      deductedTenths - trainingTenths,
    );
    final mainTenths = deductedTenths - trainingTenths - taxTenths;
    final taxColor = context.isDarkTheme
        ? AppColors.red700Dark
        : AppColors.red700;
    final trainingColor = context.isDarkTheme
        ? AppColors.orangeDark
        : AppColors.orange;
    final locale = context.locale.toString();

    final theme = Theme.of(context);

    return Column(
      spacing: 12,
      children: [
        Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${context.tr(LocaleKeys.freelance_remaining)} '
              '· ${(remainingTenths / 10).toDecimal(locale: locale)}%',
              style: theme.textTheme.labelLarge?.copyWith(
                color: context.positiveColor,
              ),
            ),
            Expanded(
              child: Text.rich(
                TextSpan(
                  text:
                      '${context.tr(LocaleKeys.freelance_deducted)} '
                      '· ${(mainTenths / 10).toDecimal(locale: locale)}%',
                  children: [
                    if (trainingTenths > 0)
                      TextSpan(
                        text:
                            ' + '
                            '${(trainingTenths / 10).toDecimal(locale: locale)}'
                            '%',
                        style: TextStyle(color: trainingColor),
                      ),
                    if (taxTenths > 0)
                      TextSpan(
                        text:
                            ' + '
                            '${(taxTenths / 10).toDecimal(locale: locale)}'
                            '%',
                        style: TextStyle(color: taxColor),
                      ),
                  ],
                ),
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
                if (remainingTenths > 0)
                  Expanded(
                    flex: remainingTenths,
                    child: ColoredBox(
                      color: context.positiveColor,
                      child: const SizedBox.expand(),
                    ),
                  ),
                if (mainTenths > 0)
                  Expanded(
                    flex: mainTenths,
                    child: ColoredBox(
                      color: context.negativeColor,
                      child: const SizedBox.expand(),
                    ),
                  ),
                // Fixed width: a to-scale segment would be under a pixel.
                if (trainingTenths > 0)
                  ColoredBox(
                    color: trainingColor,
                    child: const SizedBox(width: 6, height: double.infinity),
                  ),
                if (taxTenths > 0)
                  Expanded(
                    flex: taxTenths,
                    child: ColoredBox(
                      color: taxColor,
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

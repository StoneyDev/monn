import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';

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
    super.key,
  });

  final String label;
  final double amount;
  final double highlight;
  final String caption;
  final String revenueLabel;
  final double revenue;
  final double remaining;
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
            _RevenueRecap(revenue: revenue, remaining: remaining),
        ],
      ),
    );
  }
}

class _RevenueRecap extends StatelessWidget {
  const _RevenueRecap({required this.revenue, required this.remaining});

  final double revenue;
  final double remaining;

  @override
  Widget build(BuildContext context) {
    final remainingPercent = (remaining / revenue * 100).round().clamp(0, 100);
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
                if (remainingPercent > 0)
                  Expanded(
                    flex: remainingPercent,
                    child: ColoredBox(
                      color: context.positiveColor,
                      child: const SizedBox.expand(),
                    ),
                  ),
                if (deductedPercent > 0)
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

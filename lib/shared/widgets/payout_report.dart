import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monn/utils/app_colors.dart';

class PayoutReport extends StatelessWidget {
  const PayoutReport({
    this.capitalGain = 0,
    this.tax = 0,
    this.loss = 0,
    super.key,
  });

  final double capitalGain;
  final double tax;
  final double loss;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _Card(title: 'Plus-value', value: capitalGain),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _Card(title: 'Taxe', value: -tax),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _Card(title: 'Perte', value: -loss),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.title, required this.value});

  final String title;
  final double value;

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.compactSimpleCurrency(locale: 'fr');

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: AppColors.extraExtraLightGray,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.lightGray,
                ),
          ),
          Text(
            currency.format(value),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: AppColors.darkGray,
                ),
          ),
        ],
      ),
    );
  }
}

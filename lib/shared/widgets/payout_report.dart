import 'package:flutter/material.dart';
import 'package:monn/shared/widgets/moon_financial_info.dart';
import 'package:monn/utils/app_colors.dart';

class PayoutReport extends StatelessWidget {
  const PayoutReport({
    this.netProfit = 0,
    this.tax = 0,
    this.loss = 0,
    super.key,
  });

  final double netProfit;
  final double tax;
  final double loss;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _Card(title: 'Plus-value', amount: netProfit),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _Card(title: 'Taxe', amount: -tax),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _Card(title: 'Perte', amount: loss),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.title, required this.amount});

  final String title;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.extraExtraLightGray,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: MoonFinancialInfo(
          title: title,
          data: amount,
        ),
      ),
    );
  }
}

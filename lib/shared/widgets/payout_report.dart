import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/monn_line.dart';
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
    final locale = context.locale.toString();

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            MonnLine(
              icon: const iconoir.PiggyBank(color: AppColors.green),
              title: context.tr('common.net_profit'),
              value: Text(
                netProfit.simpleCurrency(locale),
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            MonnLine(
              icon: const iconoir.Bank(color: AppColors.blue),
              title: context.tr('common.tax', args: ['']),
              value: Text(
                (-tax).simpleCurrency(locale),
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            MonnLine(
              icon: const iconoir.FireFlame(color: AppColors.red),
              title: context.tr('common.loss'),
              value: Text(
                loss.simpleCurrency(locale),
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

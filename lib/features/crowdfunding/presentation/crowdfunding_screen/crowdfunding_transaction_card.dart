import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/crowdfunding/presentation/edit_crowdfunding_screen/controllers/crowdfunding_form_controller.dart';
import 'package:monn/features/crowdfunding/presentation/edit_crowdfunding_screen/edit_crowdfunding_screen.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_up_down.dart';
import 'package:monn/utils/app_colors.dart';

class CrowdfundingTransactionCard extends ConsumerWidget {
  const CrowdfundingTransactionCard(this.crowdfunding, {super.key});

  final CrowdfundingEntry crowdfunding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final isExempt = (crowdfunding.netProfit ?? 0) != crowdfunding.brutProfit;

    return MonnCard(
      onLongPress: () async {
        ref
            .read(crowdfundingFormControllerProvider.notifier)
            .set(
              id: crowdfunding.id,
              platformName: crowdfunding.platformName,
              brutProfit: crowdfunding.brutProfit.toString(),
              receivedAt: crowdfunding.receivedAt,
              clearTax: crowdfunding.taxPercentage == null,
              taxPercentage: crowdfunding.taxPercentage != null
                  ? '${crowdfunding.taxPercentage}'
                  : null,
            );
        await context.push<void>(
          EditCrowdfundingScreen(crowdfunding: crowdfunding),
        );
      },
      child: Row(
        spacing: 16,
        children: [
          MonnUpDown(value: crowdfunding.brutProfit),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  crowdfunding.platformName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  crowdfunding.receivedAt.slashFormat(locale),
                  style: const TextStyle(color: AppColors.lightGray),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          if (crowdfunding.brutProfit.isNegative)
            Text(
              crowdfunding.brutProfit.simpleCurrency(locale),
              style: const TextStyle(
                color: AppColors.red,
                fontWeight: FontWeight.bold,
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  crowdfunding.netProfit!.simpleCurrency(locale),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  isExempt
                      ? '(${crowdfunding.brutProfit})'
                      : context.tr(LocaleKeys.common_exempt),
                  style: TextStyle(
                    color: isExempt ? AppColors.lightGray : AppColors.green,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/life_insurance/data/life_insurance_repository.dart';
import 'package:monn/features/life_insurance/domain/life_insurance.dart';
import 'package:monn/features/life_insurance/presentation/life_insurance_screen/controllers/life_insurance_form_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/utils/app_colors.dart';

class LifeInsuranceScreen extends ConsumerWidget {
  const LifeInsuranceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final lifeInsurance = ref.watch(watchLifeInsuranceProvider);
    final report = ref.watch(
      watchPayoutReportLifeInsuranceProvider.select((data) => data.value),
    );
    final openingDate = DateTime(2025, 6, 3);
    final yearsOpen = openingDate.numberYears();
    final isFiscallyEligible = yearsOpen >= 8;

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(
          'savings.${SavingsType.lifeInsurance.name.toSnakeCase()}',
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Tooltip(
              message: context.tr(
                LocaleKeys.common_opening_account,
                args: [
                  '$yearsOpen',
                  if (isFiscallyEligible) '24,7%' else '30%',
                ],
              ),
              triggerMode: TooltipTriggerMode.tap,
              textStyle: const TextStyle(color: AppColors.blue),
              showDuration: const Duration(seconds: 3),
              decoration: const BoxDecoration(
                color: AppColors.blue50,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                spacing: 8,
                children: [
                  Text(
                    context.tr(LocaleKeys.common_taxation),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isFiscallyEligible
                          ? AppColors.green
                          : AppColors.red,
                    ),
                  ),
                  if (isFiscallyEligible)
                    const iconoir.CheckCircleSolid(color: AppColors.green)
                  else
                    const iconoir.XmarkCircleSolid(color: AppColors.red),
                ],
              ),
            ),
          ),
        ],
      ),
      body: MonnScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              Text(
                (report?.finalAmount ?? 0).simpleCurrency(locale),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              switch (lifeInsurance) {
                AsyncData(:final value) => Column(
                  spacing: 24,
                  children: [
                    Center(
                      child: OutlinedButton(
                        child: Text(
                          (value?.invested ?? 0).simpleCurrency(locale),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: AppColors.lightGray,
                              ),
                        ),
                        onPressed: () => _openInvestedAmountScreen(
                          context: context,
                          ref: ref,
                          value: value,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: MonnCard(
                        onTap: () => _openInterestsAmountScreen(
                          context: context,
                          ref: ref,
                          value: value,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                context.tr(LocaleKeys.common_interests),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Text(
                              (value?.interests ?? 0).simpleCurrency(locale),
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
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
              const SizedBox(height: 48),
            ]),
          ),
        ],
      ),
    );
  }

  void _openInvestedAmountScreen({
    required BuildContext context,
    required WidgetRef ref,
    required LifeInsurance? value,
  }) {
    final formNotifier = ref.read(lifeInsuranceFormControllerProvider.notifier);

    unawaited(
      context.push(
        fullscreenDialog: true,
        AmountScreen(
          initialValue: value?.invested ?? 0,
          onSubmit: () async {
            final success = await formNotifier.submit();

            if (!context.mounted || !success) return;

            ref.invalidate(lifeInsuranceFormControllerProvider);
            Navigator.pop(context);
          },
          onChanged: (newAmount) {
            formNotifier.set(
              invested: newAmount,
              interests: (value?.interests ?? 0).toString(),
            );
          },
        ),
      ),
    );
  }

  void _openInterestsAmountScreen({
    required BuildContext context,
    required WidgetRef ref,
    required LifeInsurance? value,
  }) {
    final formNotifier = ref.read(lifeInsuranceFormControllerProvider.notifier);

    unawaited(
      context.push(
        fullscreenDialog: true,
        AmountScreen(
          initialValue: value?.interests ?? 0,
          onSubmit: () async {
            final success = await formNotifier.submit();

            if (!context.mounted || !success) return;

            ref.invalidate(lifeInsuranceFormControllerProvider);
            Navigator.pop(context);
          },
          onChanged: (newAmount) {
            formNotifier.set(
              interests: newAmount,
              invested: (value?.invested ?? 0).toString(),
            );
          },
        ),
      ),
    );
  }
}

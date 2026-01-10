import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/expenses/presentation/edit_budget_screen/controllers/budget_form_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/shared/widgets/monn_error.dart';
import 'package:monn/utils/app_colors.dart';

class EditBudgetScreen extends ConsumerStatefulWidget {
  const EditBudgetScreen({super.key});

  @override
  ConsumerState<EditBudgetScreen> createState() => _EditBudgetScreenState();
}

class _EditBudgetScreenState extends ConsumerState<EditBudgetScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(budgetFormControllerProvider);

    return Scaffold(
      appBar: MonnAppBar(title: context.tr(LocaleKeys.expenses_edit_budget)),
      body: switch (formState) {
        AsyncData(:final value) => SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
          child: Form(
            key: formKey,
            child: Builder(
              builder: (context) {
                final notifier = ref.read(
                  budgetFormControllerProvider.notifier,
                );
                final form = value;

                final sectionStyle = Theme.of(context).textTheme.titleSmall
                    ?.copyWith(
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    );

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 24,
                  children: [
                    // Revenue
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        context.tr(LocaleKeys.expenses_revenue).toUpperCase(),
                        style: sectionStyle,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_freelance),
                      initialValue: form.freelanceIncome == 0
                          ? null
                          : form.freelanceIncome.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        freelanceIncome: double.tryParse(v) ?? 0,
                      ),
                    ),

                    // Housing
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        context.tr(LocaleKeys.expenses_housing).toUpperCase(),
                        style: sectionStyle,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_rent),
                      initialValue: form.rent == 0
                          ? null
                          : form.rent.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        rent: double.tryParse(v) ?? 0,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_electricity),
                      initialValue: form.electricity == 0
                          ? null
                          : form.electricity.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        electricity: double.tryParse(v) ?? 0,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_gas),
                      initialValue: form.gas == 0 ? null : form.gas.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        gas: double.tryParse(v) ?? 0,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_water),
                      initialValue: form.water == 0
                          ? null
                          : form.water.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        water: double.tryParse(v) ?? 0,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_internet),
                      initialValue: form.internet == 0
                          ? null
                          : form.internet.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        internet: double.tryParse(v) ?? 0,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_home_insurance),
                      initialValue: form.homeInsurance == 0
                          ? null
                          : form.homeInsurance.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        homeInsurance: double.tryParse(v) ?? 0,
                      ),
                    ),

                    // Transport
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        context.tr(LocaleKeys.expenses_transport).toUpperCase(),
                        style: sectionStyle,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_public_transport),
                      initialValue: form.publicTransport == 0
                          ? null
                          : form.publicTransport.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        publicTransport: double.tryParse(v) ?? 0,
                      ),
                    ),

                    // Food
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        context.tr(LocaleKeys.expenses_food).toUpperCase(),
                        style: sectionStyle,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_groceries),
                      initialValue: form.groceries == 0
                          ? null
                          : form.groceries.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        groceries: double.tryParse(v) ?? 0,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_restaurants),
                      initialValue: form.restaurants == 0
                          ? null
                          : form.restaurants.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        restaurants: double.tryParse(v) ?? 0,
                      ),
                    ),

                    // Health
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        context.tr(LocaleKeys.expenses_health).toUpperCase(),
                        style: sectionStyle,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_health_insurance),
                      initialValue: form.healthInsurance == 0
                          ? null
                          : form.healthInsurance.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        healthInsurance: double.tryParse(v) ?? 0,
                      ),
                    ),

                    // Subscriptions
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        context
                            .tr(LocaleKeys.expenses_subscriptions)
                            .toUpperCase(),
                        style: sectionStyle,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_phone),
                      initialValue: form.phone == 0
                          ? null
                          : form.phone.toString(),
                      suffix: '€',
                      required: true,
                      onChanged: (v) => notifier.set(
                        phone: double.tryParse(v) ?? 0,
                      ),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.expenses_ai),
                      initialValue: form.ai == 0 ? null : form.ai.toString(),
                      suffix: '€',
                      required: true,
                      textInputAction: TextInputAction.done,
                      onChanged: (v) => notifier.set(
                        ai: double.tryParse(v) ?? 0,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        AsyncError(:final error) => Center(
          child: MonnError(message: error.toString()),
        ),
        _ => const Center(child: CircularProgressIndicator()),
      },
      bottomNavigationBar: formState.hasValue
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: MonnButton(
                  text: context.tr(LocaleKeys.button_validate),
                  onPressed: _submit,
                ),
              ),
            )
          : null,
    );
  }

  Future<void> _submit() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final success = await ref
        .read(budgetFormControllerProvider.notifier)
        .submit();

    if (!mounted || !success) return;

    ref.invalidate(budgetFormControllerProvider);
    Navigator.pop(context);
  }
}

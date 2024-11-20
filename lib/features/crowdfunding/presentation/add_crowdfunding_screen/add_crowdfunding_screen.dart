import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/crowdfunding/presentation/add_crowdfunding_screen/controllers/crowdfunding_form_controller.dart';
import 'package:monn/features/crowdfunding/presentation/add_crowdfunding_screen/controllers/submit_crowdfunding_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/fields/monn_field_text.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class AddCrowdfundingScreen extends ConsumerWidget {
  const AddCrowdfundingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: MonnAppBar(
        title: 'Suivi des gains',
        onBack: () => ref.invalidate(crowdfundingFormControllerProvider),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MonnFieldText(
                label: 'Plateforme',
                required: true,
                onChanged: (value) => ref
                    .read(crowdfundingFormControllerProvider.notifier)
                    .edit(platformName: value),
              ),
              const SizedBox(height: 16),
              MonnFieldNumber(
                label: 'Gain',
                suffix: '€',
                required: true,
                onChanged: (value) => ref
                    .read(crowdfundingFormControllerProvider.notifier)
                    .edit(brutProfit: value.isEmpty ? '0' : value),
              ),
              const SizedBox(height: 16),
              Consumer(
                builder: (_, ref, __) {
                  final brutProfit = ref.watch(
                    crowdfundingFormControllerProvider.select(
                      (value) => value.brutProfit,
                    ),
                  );

                  if (brutProfit != null && brutProfit.isNegative) {
                    return const SizedBox.shrink();
                  } else {
                    return Column(
                      children: [
                        MonnFieldNumber(
                          label: 'Taxe',
                          suffix: '%',
                          required: !(brutProfit ?? 0).isNegative,
                          onChanged: (value) => ref
                              .read(crowdfundingFormControllerProvider.notifier)
                              .edit(taxPercentage: value),
                        ),
                        const SizedBox(height: 16),
                      ],
                    );
                  }
                },
              ),
              MonnFieldDate(
                label: 'Reçu le',
                required: true,
                onChanged: (value) => ref
                    .read(crowdfundingFormControllerProvider.notifier)
                    .edit(receivedAt: value),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: MonnButton(
          text: context.tr('button.validate'),
          onPressed: () async {
            if (!formKey.currentState!.validate()) return;

            final success = await ref
                .read(submitCrowdfundingFormControllerProvider.notifier)
                .submit();

            if (!context.mounted || !success) return;

            ref.invalidate(crowdfundingFormControllerProvider);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_dividend_form_controller.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/submit_reit_dividend_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class ReitFormStepTwoScreen extends ConsumerWidget {
  const ReitFormStepTwoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const MonnAppBar(title: 'Suivi des gains'),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              MonnFieldNumber<double>(
                label: 'Dividende',
                suffix: '€',
                required: true,
                provider: reitDividendFormControllerProvider.select(
                  (form) => form.amount,
                ),
                onChanged: (newAmount) => ref
                    .read(reitDividendFormControllerProvider.notifier)
                    .amount(amount: newAmount),
              ),
              MonnFieldDate(
                label: 'Reçu le',
                required: true,
                provider: reitDividendFormControllerProvider.select(
                  (form) => form.receivedAt,
                ),
                onChanged: (newReceivedAt) => ref
                    .read(reitDividendFormControllerProvider.notifier)
                    .receivedAt(receivedAt: newReceivedAt),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MonnButton(
            text: context.tr('button.validate'),
            onPressed: () async {
              if (!(formKey.currentState?.validate() ?? false)) return;

              final success = await ref
                  .read(submitReitDividendFormControllerProvider.notifier)
                  .submit();
              if (!context.mounted || !success) return;

              ref.invalidate(reitDividendFormControllerProvider);
              Navigator.of(context)
                ..pop()
                ..pop();
            },
          ),
        ),
      ),
    );
  }
}

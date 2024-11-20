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
    final formData = ref.read(reitDividendFormControllerProvider);

    return Scaffold(
      appBar: const MonnAppBar(title: 'Suivi des gains'),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              MonnFieldNumber(
                label: 'Dividende',
                suffix: '€',
                initialValue: formData.amount?.toString(),
                required: true,
                onChanged: (value) => ref
                    .read(reitDividendFormControllerProvider.notifier)
                    .edit(amount: value),
              ),
              const SizedBox(height: 16),
              MonnFieldDate(
                label: 'Reçu le',
                required: true,
                initialValue: formData.receivedAt,
                onChanged: (value) => ref
                    .read(reitDividendFormControllerProvider.notifier)
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
    );
  }
}

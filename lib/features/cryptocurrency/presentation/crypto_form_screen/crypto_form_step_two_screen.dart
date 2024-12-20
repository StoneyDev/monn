import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_form_screen/controllers/crypto_form_controller.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_form_screen/controllers/submit_crypto_form_controller.dart';
import 'package:monn/shared/widgets/fields/moon_field_date.dart';
import 'package:monn/shared/widgets/fields/moon_field_number.dart';
import 'package:monn/shared/widgets/moon_app_bar.dart';
import 'package:monn/shared/widgets/moon_button.dart';

class CryptoFormStepTwoScreen extends ConsumerWidget {
  const CryptoFormStepTwoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final formData = ref.read(cryptoFormControllerProvider);

    return Scaffold(
      appBar: const MoonAppBar(title: 'Suivi des gains'),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              MoonFieldNumber(
                label: 'Montant en fiat',
                suffix: '€',
                initialValue: formData.fiat?.toString(),
                required: true,
                onChanged: (value) => ref
                    .read(cryptoFormControllerProvider.notifier)
                    .edit(fiat: value),
              ),
              const SizedBox(height: 16),
              MoonFieldNumber(
                label: 'Montant en crypto',
                suffix: formData.crypto?.type.symbol ?? '',
                initialValue: formData.amount?.toString(),
                required: true,
                onChanged: (value) => ref
                    .read(cryptoFormControllerProvider.notifier)
                    .edit(amount: value),
              ),
              const SizedBox(height: 16),
              MoonFieldDate(
                label: 'Acheté le',
                required: true,
                initialValue: formData.boughtOn,
                onChanged: (value) => ref
                    .read(cryptoFormControllerProvider.notifier)
                    .edit(boughtOn: value),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: MoonButton(
          text: context.tr('button.validate'),
          onPressed: () async {
            if (!formKey.currentState!.validate()) return;

            final success = await ref
                .read(submitCryptoFormControllerProvider.notifier)
                .submit();

            if (!context.mounted || !success) return;

            ref.invalidate(cryptoFormControllerProvider);
            // TODO: Implement code to update start amount

            Navigator.of(context)
              ..pop()
              ..pop();
          },
        ),
      ),
    );
  }
}

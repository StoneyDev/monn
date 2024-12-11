import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_form_screen/controllers/crypto_form_controller.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_form_screen/controllers/submit_crypto_form_controller.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class CryptoFormStepTwoScreen extends ConsumerWidget {
  const CryptoFormStepTwoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final formData = ref.read(cryptoFormControllerProvider);
    final cryptoData = ref.watch(
      getSavingsProvider(type: SavingsType.cryptocurrency).select(
        (data) => data.valueOrNull,
      ),
    );

    return Scaffold(
      appBar: const MonnAppBar(title: 'Suivi des gains'),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              MonnFieldNumber(
                label: 'Montant en fiat',
                suffix: '€',
                initialValue: formData.fiat?.toString(),
                required: true,
                onChanged: (value) => ref
                    .read(cryptoFormControllerProvider.notifier)
                    .edit(fiat: value),
              ),
              const SizedBox(height: 16),
              MonnFieldNumber(
                label: 'Montant en crypto',
                suffix: formData.crypto?.type.symbol ?? '',
                initialValue: formData.amount?.toString(),
                required: true,
                onChanged: (value) => ref
                    .read(cryptoFormControllerProvider.notifier)
                    .edit(amount: value),
              ),
              const SizedBox(height: 16),
              MonnFieldDate(
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
        child: MonnButton(
          text: context.tr('button.validate'),
          onPressed: () async {
            if (!formKey.currentState!.validate()) return;

            final success = await ref
                .read(submitCryptoFormControllerProvider.notifier)
                .submit();

            final formData = ref.read(cryptoFormControllerProvider);

            final newSaving = cryptoData?.copyWith(
              startAmount: cryptoData.startAmount + formData.fiat!,
            );

            final upadated = await ref
                .read(editSavingsControllerProvider.notifier)
                .submit(newSaving!);

            if (!context.mounted || !success || !upadated) return;

            ref.invalidate(cryptoFormControllerProvider);
            Navigator.of(context)
              ..pop()
              ..pop();
          },
        ),
      ),
    );
  }
}

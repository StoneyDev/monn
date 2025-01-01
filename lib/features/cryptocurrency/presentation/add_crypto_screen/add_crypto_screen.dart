import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/controllers/crypto_form_controller.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/controllers/submit_crypto_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class AddCryptoScreen extends ConsumerWidget {
  const AddCryptoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final formKey = GlobalKey<FormState>();
    final formData = ref.read(cryptoFormControllerProvider);

    return Scaffold(
      appBar: MonnAppBar(title: context.tr('tracking_earnings')),
      body: Form(
        onPopInvoked: (_) => ref.invalidate(cryptoFormControllerProvider),
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              MonnFieldNumber(
                label: context.tr('input.label.crypto_amount'),
                suffix: formData.crypto?.type.symbol ?? '',
                required: true,
                onChanged: (value) => ref
                    .read(cryptoFormControllerProvider.notifier)
                    .edit(amount: value),
              ),
              const SizedBox(height: 16),
              Consumer(
                builder: (_, ref, __) {
                  final cryptoAmount = ref.watch(
                    cryptoFormControllerProvider.select(
                      (value) => value.amount ?? 0,
                    ),
                  );

                  return MonnFieldDate(
                    label: context.tr(
                      // ignore: lines_longer_than_80_chars
                      'input.label.${cryptoAmount.isNegative ? 'sold_on' : 'bought_on'}',
                    ),
                    required: true,
                    locale: locale,
                    onChanged: (value) => ref
                        .read(cryptoFormControllerProvider.notifier)
                        .edit(date: value),
                  );
                },
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

            if (!context.mounted || !success) return;

            ref
              ..invalidate(getCryptocurrencyProvider(formData.crypto!.type))
              ..invalidate(cryptoFormControllerProvider);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

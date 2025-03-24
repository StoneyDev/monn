import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cryptocurrency/data/coin_market_cap_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/controllers/crypto_form_controller.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/controllers/submit_crypto_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class AddCryptoScreen extends ConsumerStatefulWidget {
  const AddCryptoScreen({super.key});

  @override
  ConsumerState<AddCryptoScreen> createState() => _AddCryptoScreenState();
}

class _AddCryptoScreenState extends ConsumerState<AddCryptoScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formData = ref.read(cryptoFormControllerProvider);

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr('tracking_earnings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MonnFieldNumber<double>(
                label: context.tr('input.label.crypto_amount'),
                suffix: formData.crypto?.type.symbol ?? '',
                required: true,
                provider: cryptoFormControllerProvider.select(
                  (form) => form.amount,
                ),
                onChanged: (newAmount) => ref
                    .read(cryptoFormControllerProvider.notifier)
                    .amount(amount: newAmount),
              ),
              const SizedBox(height: 16),
              Consumer(
                builder: (_, ref, __) {
                  final cryptoAmount = double.tryParse(
                        ref.watch(
                          cryptoFormControllerProvider.select(
                            (value) => value.amount,
                          ),
                        ),
                      ) ??
                      0;
                  final id = cryptoAmount.isNegative ? 'sold_on' : 'bought_on';

                  return MonnFieldDate(
                    label: context.tr('input.label.$id'),
                    required: true,
                    provider: cryptoFormControllerProvider.select(
                      (form) => form.date,
                    ),
                    onChanged: (newDate) => ref
                        .read(cryptoFormControllerProvider.notifier)
                        .date(date: newDate),
                  );
                },
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
                  .read(submitCryptoFormControllerProvider.notifier)
                  .submit();

              final formData = ref.read(cryptoFormControllerProvider);

              if (!context.mounted || !success) return;

              ref
                ..invalidate(getCryptocurrencyProvider(formData.crypto!.type))
                ..invalidate(getCryptoPriceMarketProvider);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

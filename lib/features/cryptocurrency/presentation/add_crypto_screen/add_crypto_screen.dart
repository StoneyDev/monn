import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cryptocurrency/data/coin_market_cap_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/controllers/crypto_form_controller.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/generated/locale_keys.g.dart';
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
        title: context.tr(LocaleKeys.common_tracking_earnings),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            children: [
              MonnFieldNumber<double>(
                label: context.tr(LocaleKeys.common_crypto_amount),
                suffix: formData.crypto?.type.symbol ?? '',
                required: true,
                onChanged: (newAmount) => ref
                    .read(cryptoFormControllerProvider.notifier)
                    .set(amount: newAmount),
              ),
              Consumer(
                builder: (_, ref, _) {
                  final cryptoAmount =
                      double.tryParse(
                        ref.watch(
                          cryptoFormControllerProvider.select(
                            (value) => value.amount,
                          ),
                        ),
                      ) ??
                      0;
                  final isPurchase = cryptoAmount > 0;

                  return Column(
                    spacing: 16,
                    children: [
                      if (isPurchase)
                        MonnFieldNumber<double>(
                          label: context.tr(LocaleKeys.common_purchase_price),
                          suffix: '€',
                          required: true,
                          onChanged: (newFiatAmount) => ref
                              .read(cryptoFormControllerProvider.notifier)
                              .set(fiatAmount: newFiatAmount),
                        ),
                      MonnFieldDate(
                        label: context.tr(
                          'common.${isPurchase ? 'bought_on' : 'sold_on'}',
                          args: [''],
                        ),
                        required: true,
                        onChanged: (newDate) => ref
                            .read(cryptoFormControllerProvider.notifier)
                            .set(date: newDate),
                      ),
                    ],
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
            text: context.tr(LocaleKeys.button_validate),
            onPressed: () async {
              if (!(formKey.currentState?.validate() ?? false)) return;

              final formData = ref.read(cryptoFormControllerProvider);

              final success = await ref
                  .read(cryptoFormControllerProvider.notifier)
                  .submit();

              if (!context.mounted || !success) return;

              ref
                ..invalidate(cryptoFormControllerProvider)
                ..invalidate(getCryptocurrencyProvider(formData.crypto!.type))
                ..invalidate(getCryptoPriceMarketProvider)
                ..invalidate(
                  getSavingsProvider(type: SavingsType.cryptocurrency),
                );
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

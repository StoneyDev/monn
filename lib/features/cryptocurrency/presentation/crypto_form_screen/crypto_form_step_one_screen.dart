import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_form_screen/controllers/crypto_form_controller.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_form_screen/crypto_form_step_two_screen.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/utils/app_colors.dart';

final _selectedCryptoProvider = StateProvider.autoDispose<CryptoType?>(
  (ref) => ref.read(cryptoFormControllerProvider).crypto?.type,
);

class CryptoFormStepOneScreen extends ConsumerWidget {
  const CryptoFormStepOneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCryptoType = ref.watch(_selectedCryptoProvider);
    final cryptocurrencies =
        ref.watch(watchCryptocurrenciesProvider).valueOrNull?.toList();

    return Scaffold(
      appBar: MonnAppBar(
        title: 'Sélectionnez une crypto',
        onBack: () => ref.invalidate(cryptoFormControllerProvider),
      ),
      body: ListView.builder(
        itemCount: CryptoType.values.length,
        itemBuilder: (context, index) {
          final item = CryptoType.values[index];

          return RadioListTile<CryptoType>(
            value: item,
            groupValue: selectedCryptoType,
            activeColor: item.color,
            title: Text(
              '${item.label} (${item.symbol})',
              style: selectedCryptoType == item
                  ? const TextStyle(
                      color: AppColors.darkGray,
                      fontWeight: FontWeight.w900,
                    )
                  : null,
            ),
            onChanged: (value) =>
                ref.read(_selectedCryptoProvider.notifier).state = value,
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: MonnButton(
          text: context.tr('button.validate'),
          onPressed: selectedCryptoType != null
              ? () {
                  final crypto = cryptocurrencies?.firstWhereOrNull(
                    (crypto) => crypto.type == selectedCryptoType,
                  );

                  ref.read(cryptoFormControllerProvider.notifier).edit(
                        crypto: crypto ?? Cryptocurrency()
                          ..type = selectedCryptoType,
                      );

                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (_) => const CryptoFormStepTwoScreen(),
                    ),
                  );
                }
              : null,
        ),
      ),
    );
  }
}

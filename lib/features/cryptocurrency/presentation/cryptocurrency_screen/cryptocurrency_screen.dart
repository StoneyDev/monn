import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_form_screen/crypto_form_step_one_screen.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/bottom_sheet/moon_bottom_sheet.dart';
import 'package:monn/shared/widgets/charts/moon_donut_chart.dart';
import 'package:monn/shared/widgets/moon_app_bar.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class CryptocurrencyScreen extends ConsumerWidget {
  const CryptocurrencyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptocurrencies = ref.watch(watchCryptocurrenciesProvider);
    final chart = ref.watch(watchCryptoChartProvider);

    return Scaffold(
      appBar: MoonAppBar(title: SavingsType.cryptocurrency.label),
      floatingActionButton: IconButton.filled(
        icon: const iconoir.Plus(color: AppColors.white),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const CryptoFormStepOneScreen(),
          ),
        ),
      ),
      body: Column(
        children: [
          switch (chart) {
            AsyncData(:final value) => MoonDonutChart(chart: value),
            _ => const CircularProgressIndicator(
                color: AppColors.extraLightGray,
              ),
          },
          const SizedBox(height: 20),
          switch (cryptocurrencies) {
            AsyncData(:final value) => Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 4 / 3,
                  ),
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  itemBuilder: (context, index) {
                    final crypto = value[index];

                    return _CryptoCard(
                      crypto: crypto,
                      onTap: () => WoltModalSheet.show<void>(
                        context: context,
                        pageListBuilder: (context) => [
                          MoonBottomSheet.details(
                            context: context,
                            crypto: crypto,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: value.length,
                ),
              ),
            AsyncError(:final error) => Text('error: $error'),
            _ => const RepaintBoundary(
                child: CircularProgressIndicator(),
              ),
          },
        ],
      ),
    );
  }
}

class _CryptoCard extends StatelessWidget {
  const _CryptoCard({
    required this.crypto,
    this.onTap,
  });

  final Cryptocurrency crypto;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.extraLightGray),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.zero,
      child: InkWell(
        highlightColor: AppColors.extraExtraLightGray,
        splashColor: AppColors.extraExtraLightGray,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      crypto.type.symbol,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkGray,
                          ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(crypto.totalFiat.simpleCurrency()),
                ],
              ),
              Text(
                crypto.totalCrypto.toString(),
                maxLines: 1,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkGray,
                    ),
              ),
              const Spacer(),
              Text(
                crypto.type.label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: crypto.type.color,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

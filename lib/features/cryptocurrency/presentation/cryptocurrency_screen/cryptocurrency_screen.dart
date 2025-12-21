// ignore_for_file: lines_longer_than_80_chars

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/cryptocurrency/data/coin_market_cap_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_page_screen/crypto_page_screen.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/enum_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/widgets/charts/monn_doughnut_chart.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_line.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/shared/widgets/monn_snack_bar.dart';
import 'package:monn/shared/widgets/monn_tile.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/formula.dart';

final _startAmountProvider = StateProvider<String>((_) => '');

class CryptocurrencyScreen extends ConsumerWidget {
  const CryptocurrencyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final chart = ref.watch(watchCryptoChartProvider);
    final cryptoData = ref.watch(
      getSavingsProvider(type: SavingsType.cryptocurrency).select(
        (value) => value.value,
      ),
    );
    final cryptocurrencies = ref.watch(getCryptoPriceMarketProvider);

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(
          'savings.${SavingsType.cryptocurrency.name.toSnakeCase()}',
        ),
      ),
      body: MonnScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 24),
                switch (chart) {
                  AsyncData(:final value) => MonnDoughnutChart(
                    chart: value,
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      MonnSnackBar.info(
                        message:
                            '${context.tr('common.total_amount_invested')}: ${cryptoData?.startAmount?.simpleCurrency(locale)}',
                      ),
                    ),
                    onLongPress: () => context.push(
                      fullscreenDialog: true,
                      AmountScreen(
                        initialValue: cryptoData?.startAmount ?? 0,
                        onSubmit: () async {
                          final newValue = ref.read(_startAmountProvider);
                          final newSaving = cryptoData
                            ?..startAmount = double.parse(newValue);

                          final success = await ref
                              .read(editSavingsControllerProvider.notifier)
                              .submit(newSaving!);
                          if (!context.mounted || !success) return;

                          ref
                            ..invalidate(_startAmountProvider)
                            ..invalidate(
                              getSavingsProvider(
                                type: SavingsType.cryptocurrency,
                              ),
                            )
                            ..invalidate(watchCryptoChartProvider);
                          Navigator.pop(context);
                        },
                        onChanged: (newAmount) =>
                            ref.read(_startAmountProvider.notifier).state =
                                newAmount,
                      ),
                    ),
                  ),
                  _ => Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox.square(
                        dimension: 200,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                      Text(
                        context.tr('common.loading'),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                },
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    spacing: 8,
                    children: [
                      MonnLine(
                        title: context.tr('common.rate_of_return'),
                        value: Text(
                          '${totalReturnRate(
                            initialValue: cryptoData?.startAmount ?? 0,
                            finalValue: chart.value?.totalAmount ?? 0,
                          ).abs().toStringAsFixed(2)}%',
                          textAlign: TextAlign.right,
                        ),
                      ),
                      MonnLine(
                        title: context.tr('common.annual_performance'),
                        value: Text(
                          context.tr(
                            'common.per_year',
                            args: [
                              '${annualGrowthRate(
                                initialValue: cryptoData?.startAmount ?? 0,
                                duration: DateTime(2022, 04, 24).numberYears(),
                                finalValue: chart.value?.totalAmount ?? 0,
                              ).toStringAsFixed(2)}%',
                            ],
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Theme.of(context).colorScheme.outline),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
            sliver: switch (cryptocurrencies) {
              AsyncData(:final value) => SliverList.separated(
                separatorBuilder: (_, _) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final crypto = value[index];

                  return _CryptoCard(
                    crypto: crypto,
                    onTap: () => context.push(
                      CryptoPageScreen(type: crypto.type),
                    ),
                  );
                },
                itemCount: value.length,
              ),
              AsyncError(:final error) => SliverToBoxAdapter(
                child: Text(
                  '$error',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              _ => const SliverToBoxAdapter(
                child: Center(
                  child: RepaintBoundary(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            },
          ),
        ],
      ),
    );
  }
}

class _CryptoCard extends ConsumerWidget {
  const _CryptoCard({
    required this.crypto,
    this.onTap,
  });

  final Cryptocurrency crypto;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();

    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.titleMedium,
      child: MonnCard(
        onTap: onTap,
        child: MonnTile(
          icon: Image(
            image: crypto.type.logo(),
            height: 40,
            width: 40,
          ),
          content: Text(
            crypto.type.label,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: crypto.type.color,
            ),
          ),
          subContent: Text(
            crypto.priceMarket.simpleCurrency('en'),
            style: const TextStyle(color: AppColors.lightGray),
          ),
          trailing: Text(
            '${crypto.totalCrypto.toDecimal(locale)} ${crypto.type.symbol}',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          subTrailing: crypto.totalCrypto > 0
              ? Text(
                  (crypto.priceMarket * crypto.totalCrypto).simpleCurrency(
                    'en',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.lightGray),
                )
              : null,
        ),
      ),
    );
  }
}

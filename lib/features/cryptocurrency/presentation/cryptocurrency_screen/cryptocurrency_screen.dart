import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cryptocurrency/data/coin_cap_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/crypto_page_screen/crypto_page_screen.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/enum_ui.dart';
import 'package:monn/shared/widgets/charts/monn_doughnut_chart.dart';
import 'package:monn/shared/widgets/dialogs/monn_dialog.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/shared/widgets/monn_tile.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/monn_tools.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final _startAmountProvider = StateProvider<String?>((_) => null);

class CryptocurrencyScreen extends ConsumerWidget {
  const CryptocurrencyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final formKey = GlobalKey<FormState>();
    final chart = ref.watch(watchCryptoChartProvider);
    final cryptoData = ref.watch(
      getSavingsProvider(type: SavingsType.cryptocurrency).select(
        (data) => data.valueOrNull,
      ),
    );

    return Scaffold(
      appBar: MonnAppBar(title: SavingsType.cryptocurrency.label),
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
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: AppColors.blue50,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          content: RichText(
                            text: TextSpan(
                              text: context.tr('total_amount_invested'),
                              children: [
                                TextSpan(
                                  text:
                                      // ignore: lines_longer_than_80_chars
                                      ': ${cryptoData?.startAmount.simpleCurrency(locale)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                              style: const TextStyle(color: AppColors.blue),
                            ),
                          ),
                        ),
                      ),
                      onLongPress: () => WoltModalSheet.show<void>(
                        modalTypeBuilder: (_) => WoltModalType.dialog(),
                        context: context,
                        pageListBuilder: (context) => [
                          MonnDialog.amount(
                            context: context,
                            formKey: formKey,
                            initialValue: cryptoData?.startAmount.toString(),
                            onChanged: (value) {
                              if (value.isEmpty) return;
                              ref.read(_startAmountProvider.notifier).state =
                                  value;
                            },
                            onSubmit: () async {
                              final newValue = ref.read(_startAmountProvider);
                              final isValid = formKey.currentState!.validate();

                              if (isValid && newValue != null) {
                                final newSaving = cryptoData?.copyWith(
                                  startAmount: double.parse(newValue),
                                );

                                final success = await ref
                                    .read(
                                      editSavingsControllerProvider.notifier,
                                    )
                                    .submit(newSaving!);
                                if (!context.mounted || !success) return;
                              }

                              ref
                                ..invalidate(_startAmountProvider)
                                ..invalidate(
                                  getSavingsProvider(
                                    type: SavingsType.cryptocurrency,
                                  ),
                                );
                              Navigator.pop(context);
                            },
                          ),
                        ],
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
                          context.tr('loading'),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                },
                const SizedBox(height: 24),
                Divider(color: Theme.of(context).colorScheme.outline),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            sliver: SliverList.separated(
              itemBuilder: (context, index) {
                final cryptoType = CryptoType.values[index];

                return _CryptoCard(
                  cryptoType: cryptoType,
                  onTap: () => context.push(
                    CryptoPageScreen(type: cryptoType),
                  ),
                );
              },
              itemCount: CryptoType.values.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
            ),
          ),
        ],
      ),
    );
  }
}

class _CryptoCard extends ConsumerWidget {
  const _CryptoCard({
    required this.cryptoType,
    this.onTap,
  });

  final CryptoType cryptoType;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final cryptocurrency = ref.watch(
      getCryptocurrencyProvider(cryptoType).select(
        (crypto) => crypto.valueOrNull,
      ),
    );
    final priceMarket = ref.watch(
      getCryptoPriceMarketProvider(
        id: MonnTools.toKebabCase(cryptoType.name),
        crypto: cryptocurrency,
      ),
    );

    return DefaultTextStyle.merge(
      style: Theme.of(context).textTheme.titleMedium,
      child: MonnCard(
        onTap: onTap,
        child: MonnTile(
          icon: Image(
            image: cryptoType.logo(),
            height: 40,
            width: 40,
          ),
          content: Text(
            cryptoType.label,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: cryptoType.color,
            ),
          ),
          subContent: switch (priceMarket) {
            AsyncData(:final value) => Text(
                value.simpleCurrency('en'),
                style: const TextStyle(color: AppColors.lightGray),
              ),
            AsyncError(:final error) => Text(
                '$error',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: AppColors.red),
              ),
            _ => Text(
                context.tr('loading'),
                style: const TextStyle(color: AppColors.lightGray),
              )
          },
          trailing: Text(
            // ignore: lines_longer_than_80_chars
            '${cryptocurrency?.totalCrypto.toDecimal(locale)} ${cryptoType.symbol}',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          subTrailing: (cryptocurrency?.totalCrypto ?? 0) > 0
              ? switch (priceMarket) {
                  AsyncData(:final value) => Text(
                      (value * cryptocurrency!.totalCrypto)
                          .simpleCurrency('en'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.lightGray),
                    ),
                  AsyncError(:final error) => Text(
                      '$error',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.red),
                    ),
                  _ => Text(
                      context.tr('loading'),
                      style: const TextStyle(color: AppColors.lightGray),
                    )
                }
              : null,
        ),
      ),
    );
  }
}

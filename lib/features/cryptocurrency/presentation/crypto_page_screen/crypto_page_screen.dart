import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/add_crypto_screen.dart';
import 'package:monn/features/cryptocurrency/presentation/add_crypto_screen/controllers/crypto_form_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/enum_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/shared/widgets/monn_tile.dart';
import 'package:monn/shared/widgets/monn_up_down.dart';
import 'package:monn/utils/app_colors.dart';

class CryptoPageScreen extends ConsumerWidget {
  const CryptoPageScreen({required this.type, super.key});

  final CryptoType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final cryptocurrency = ref.watch(getCryptocurrencyProvider(type));

    return Scaffold(
      appBar: MonnAppBar(
        title: '${type.label} (${type.symbol})',
      ),
      body: cryptocurrency.when(
        data: (crypto) {
          final marketValue = crypto.totalCrypto * crypto.priceMarket;
          final sortByPurchase = crypto.transactions.toList().sorted(
            (a, b) => b.date.compareTo(a.date),
          );

          return MonnScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(top: 32, left: 16, right: 16),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    spacing: 8,
                    children: [
                      Image(
                        image: crypto.type.logo(),
                        height: 40,
                        width: 40,
                      ),
                      Expanded(
                        child: Text(
                          marketValue.simpleCurrency('en'),
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(fontWeight: .bold),
                        ),
                      ),
                      IconButton.filled(
                        style: IconButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.outline,
                        ),
                        icon: const RotatedBox(
                          quarterTurns: 1,
                          child: iconoir.DataTransferBoth(
                            color: AppColors.lightGray,
                          ),
                        ),
                        onPressed: () async {
                          ref
                              .read(cryptoFormControllerProvider.notifier)
                              .set(crypto: crypto);

                          await context.push(const AddCryptoScreen());
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: IntrinsicHeight(
                    child: MonnCard(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    crypto.type.label,
                                    style: const TextStyle(
                                      color: AppColors.lightGray,
                                      fontWeight: .w600,
                                    ),
                                  ),
                                  Text(
                                    crypto.totalCrypto.toDecimal(
                                      locale: locale,
                                      digit: crypto.totalCrypto > 0 ? 8 : null,
                                    ),
                                    style: const TextStyle(fontWeight: .bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const VerticalDivider(color: AppColors.lightGray),
                          Expanded(
                            child: Align(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    context.tr(LocaleKeys.common_market_price),
                                    style: const TextStyle(
                                      color: AppColors.lightGray,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    crypto.priceMarket.simpleCurrency('en'),
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(color: Theme.of(context).colorScheme.outline),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList.separated(
                  separatorBuilder: (_, _) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final transaction = sortByPurchase[index];
                    final isWithdrawal = transaction.amount.isNegative;

                    return MonnTile(
                      icon: MonnUpDown(value: transaction.amount),
                      content: Text(
                        context.tr(
                          isWithdrawal
                              ? LocaleKeys.common_withdrawal
                              : LocaleKeys.common_purchase,
                        ),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subContent: Text(
                        transaction.date.slashFormat(locale),
                        style: const TextStyle(color: AppColors.lightGray),
                      ),
                      trailing: Text(
                        '${transaction.amount}',
                        style: TextStyle(
                          color: isWithdrawal ? AppColors.red : null,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  itemCount: crypto.transactions.length,
                ),
              ),
            ],
          );
        },
        error: (error, _) => Text(error.toString()),
        loading: () => const Center(
          child: RepaintBoundary(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

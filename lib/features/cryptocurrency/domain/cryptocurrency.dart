import 'dart:ui';

import 'package:isar/isar.dart';
import 'package:monn/utils/app_colors.dart';

part 'cryptocurrency.g.dart';

@collection
class Cryptocurrency {
  Id? id;
  @Enumerated(EnumType.name)
  late CryptoType type;
  double totalCrypto = 0;
  double priceMarket = 0;
  DateTime? lastUpdate;

  final transactions = IsarLinks<CryptocurrencyTransaction>();
}

@collection
class CryptocurrencyTransaction {
  Id? id;
  late DateTime date; // withdrawalOn or boughtOn
  late double amount;
}

enum CryptoType {
  bitcoin('Bitcoin', 'BTC', AppColors.btc),
  ethereum('Ethereum', 'ETH', AppColors.eth),
  chainlink('Chainlink', 'LINK', AppColors.link),
  tether('Tether', 'USDT', AppColors.usdt),
  usdCoin('USD Coin', 'USDC', AppColors.usdc);

  const CryptoType(this.label, this.symbol, this.color);

  final String label;
  final String symbol;
  final Color color;
}

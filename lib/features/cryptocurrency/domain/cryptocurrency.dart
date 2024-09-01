import 'dart:ui';

import 'package:isar/isar.dart';
import 'package:monn/utils/app_colors.dart';

part 'cryptocurrency.g.dart';

@collection
class Cryptocurrency {
  Id? id;
  @enumerated
  late CryptoType type;
  @ignore
  late double totalFiat;
  @ignore
  late double totalCrypto;

  final transactions = IsarLinks<CryptocurrencyTransaction>();
}

@collection
class CryptocurrencyTransaction {
  Id? id;
  late DateTime boughtOn;
  late double fiat;
  late double amount;
}

enum CryptoType {
  bitcoin('Bitcoin', 'BTC', AppColors.btc),
  ethereum('Etherum', 'ETH', AppColors.eth),
  chainlink('Chainlink', 'LINK', AppColors.link),
  tether('Tether', 'USDT', AppColors.usdt),
  usdCoin('USD Coin', 'USDC', AppColors.usdc);

  const CryptoType(this.label, this.symbol, this.color);

  final String label;
  final String symbol;
  final Color color;
}

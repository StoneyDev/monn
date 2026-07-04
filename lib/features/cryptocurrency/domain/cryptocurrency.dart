import 'dart:ui';

import 'package:monn/shared/local/database.dart';
import 'package:monn/utils/app_colors.dart';

enum CryptoType {
  bitcoin('Bitcoin', 'BTC', AppColors.btc),
  ethereum('Ethereum', 'ETH', AppColors.eth),
  chainlink('Chainlink', 'LINK', AppColors.link),
  tether('Tether', 'USDT', AppColors.usdt),
  usdCoin('USD Coin', 'USDC', AppColors.usdc)
  ;

  const CryptoType(this.label, this.symbol, this.color);

  final String label;
  final String symbol;
  final Color color;
}

extension CryptocurrencyEntryX on CryptocurrencyEntry {
  CryptoType get cryptoType => CryptoType.values.byName(type);
}

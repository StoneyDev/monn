import 'package:monn/shared/local/database.dart';

enum CryptoType {
  bitcoin('Bitcoin', 'BTC'),
  ethereum('Ethereum', 'ETH'),
  chainlink('Chainlink', 'LINK'),
  tether('Tether', 'USDT'),
  usdCoin('USD Coin', 'USDC')
  ;

  const CryptoType(this.label, this.symbol);

  final String label;
  final String symbol;
}

extension CryptocurrencyEntryX on CryptocurrencyEntry {
  CryptoType get cryptoType => CryptoType.values.byName(type);
}

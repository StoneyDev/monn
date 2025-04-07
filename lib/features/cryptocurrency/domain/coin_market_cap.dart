import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_market_cap.freezed.dart';
part 'coin_market_cap.g.dart';

@freezed
class CoinMarketCapResponse with _$CoinMarketCapResponse {
  const factory CoinMarketCapResponse({
    required Map<String, CoinMarketCapCrypto> data,
  }) = _CoinMarketCapResponse;

  factory CoinMarketCapResponse.fromJson(Map<String, Object?> json) =>
      _$CoinMarketCapResponseFromJson(json);
}

@freezed
class CoinMarketCapCrypto with _$CoinMarketCapCrypto {
  const factory CoinMarketCapCrypto({
    required int id,
    required String name,
    required String symbol,
    required String slug,
    required Quote quote,
  }) = _CoinMarketCapCrypto;

  factory CoinMarketCapCrypto.fromJson(Map<String, Object?> json) =>
      _$CoinMarketCapCryptoFromJson(json);
}

@freezed
class Quote with _$Quote {
  const factory Quote({
    @JsonKey(name: 'USD') required PriceUsd priceUsd,
  }) = _Quote;

  factory Quote.fromJson(Map<String, Object?> json) => _$QuoteFromJson(json);
}

@freezed
class PriceUsd with _$PriceUsd {
  const factory PriceUsd({
    required double price,
    required String lastUpdated,
  }) = _PriceUsd;

  factory PriceUsd.fromJson(Map<String, Object?> json) =>
      _$PriceUsdFromJson(json);
}

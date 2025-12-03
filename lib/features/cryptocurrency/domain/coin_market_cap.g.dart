// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_market_cap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoinMarketCapResponse _$CoinMarketCapResponseFromJson(
  Map<String, dynamic> json,
) => _CoinMarketCapResponse(
  data: (json['data'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(k, CoinMarketCapCrypto.fromJson(e as Map<String, dynamic>)),
  ),
);

Map<String, dynamic> _$CoinMarketCapResponseToJson(
  _CoinMarketCapResponse instance,
) => <String, dynamic>{
  'data': instance.data.map((k, e) => MapEntry(k, e.toJson())),
};

_CoinMarketCapCrypto _$CoinMarketCapCryptoFromJson(Map<String, dynamic> json) =>
    _CoinMarketCapCrypto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      slug: json['slug'] as String,
      quote: Quote.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoinMarketCapCryptoToJson(
  _CoinMarketCapCrypto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'symbol': instance.symbol,
  'slug': instance.slug,
  'quote': instance.quote.toJson(),
};

_Quote _$QuoteFromJson(Map<String, dynamic> json) =>
    _Quote(priceUsd: PriceUsd.fromJson(json['USD'] as Map<String, dynamic>));

Map<String, dynamic> _$QuoteToJson(_Quote instance) => <String, dynamic>{
  'USD': instance.priceUsd.toJson(),
};

_PriceUsd _$PriceUsdFromJson(Map<String, dynamic> json) => _PriceUsd(
  price: (json['price'] as num).toDouble(),
  lastUpdated: json['last_updated'] as String,
);

Map<String, dynamic> _$PriceUsdToJson(_PriceUsd instance) => <String, dynamic>{
  'price': instance.price,
  'last_updated': instance.lastUpdated,
};

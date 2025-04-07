// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_market_cap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoinMarketCapResponseImpl _$$CoinMarketCapResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CoinMarketCapResponseImpl(
      data: (json['data'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, CoinMarketCapCrypto.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$CoinMarketCapResponseImplToJson(
        _$CoinMarketCapResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((k, e) => MapEntry(k, e.toJson())),
    };

_$CoinMarketCapCryptoImpl _$$CoinMarketCapCryptoImplFromJson(
        Map<String, dynamic> json) =>
    _$CoinMarketCapCryptoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      slug: json['slug'] as String,
      quote: Quote.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CoinMarketCapCryptoImplToJson(
        _$CoinMarketCapCryptoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'quote': instance.quote.toJson(),
    };

_$QuoteImpl _$$QuoteImplFromJson(Map<String, dynamic> json) => _$QuoteImpl(
      priceUsd: PriceUsd.fromJson(json['USD'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$QuoteImplToJson(_$QuoteImpl instance) =>
    <String, dynamic>{
      'USD': instance.priceUsd.toJson(),
    };

_$PriceUsdImpl _$$PriceUsdImplFromJson(Map<String, dynamic> json) =>
    _$PriceUsdImpl(
      price: (json['price'] as num).toDouble(),
      lastUpdated: json['last_updated'] as String,
    );

Map<String, dynamic> _$$PriceUsdImplToJson(_$PriceUsdImpl instance) =>
    <String, dynamic>{
      'price': instance.price,
      'last_updated': instance.lastUpdated,
    };

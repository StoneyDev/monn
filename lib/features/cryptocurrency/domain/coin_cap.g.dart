// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_cap.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoinCapResponseImpl _$$CoinCapResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CoinCapResponseImpl(
      data: CoinCap.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CoinCapResponseImplToJson(
        _$CoinCapResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$CoinCapImpl _$$CoinCapImplFromJson(Map<String, dynamic> json) =>
    _$CoinCapImpl(
      priceUsd: double.parse(json['priceUsd'] as String),
    );

Map<String, dynamic> _$$CoinCapImplToJson(_$CoinCapImpl instance) =>
    <String, dynamic>{
      'priceUsd': instance.priceUsd,
    };

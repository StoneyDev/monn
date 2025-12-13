// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etf_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EtfQuoteResponse _$EtfQuoteResponseFromJson(Map<String, dynamic> json) =>
    EtfQuoteResponse(
      globalQuote: json['Global Quote'] == null
          ? null
          : EtfQuote.fromJson(json['Global Quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EtfQuoteResponseToJson(EtfQuoteResponse instance) =>
    <String, dynamic>{'Global Quote': instance.globalQuote?.toJson()};

EtfQuote _$EtfQuoteFromJson(Map<String, dynamic> json) =>
    EtfQuote(price: json['05. price'] as String?);

Map<String, dynamic> _$EtfQuoteToJson(EtfQuote instance) => <String, dynamic>{
  '05. price': instance.price,
};

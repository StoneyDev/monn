import 'package:json_annotation/json_annotation.dart';

part 'etf_quote.g.dart';

@JsonSerializable()
class EtfQuoteResponse {
  const EtfQuoteResponse({this.globalQuote});

  factory EtfQuoteResponse.fromJson(Map<String, dynamic> json) =>
      _$EtfQuoteResponseFromJson(json);

  @JsonKey(name: 'Global Quote')
  final EtfQuote? globalQuote;

  Map<String, dynamic> toJson() => _$EtfQuoteResponseToJson(this);
}

@JsonSerializable()
class EtfQuote {
  const EtfQuote({this.price});

  factory EtfQuote.fromJson(Map<String, dynamic> json) =>
      _$EtfQuoteFromJson(json);

  @JsonKey(name: '05. price')
  final String? price;

  Map<String, dynamic> toJson() => _$EtfQuoteToJson(this);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_cap.freezed.dart';
part 'coin_cap.g.dart';

@freezed
class CoinCapResponse with _$CoinCapResponse {
  const factory CoinCapResponse({
    required CoinCap data,
  }) = _CoinCapResponse;

  factory CoinCapResponse.fromJson(Map<String, Object?> json) =>
      _$CoinCapResponseFromJson(json);
}

@freezed
class CoinCap with _$CoinCap {
  factory CoinCap({
    @JsonKey(fromJson: double.parse) required double priceUsd,
  }) = _CoinCap;

  factory CoinCap.fromJson(Map<String, Object?> json) =>
      _$CoinCapFromJson(json);
}

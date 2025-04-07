// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_market_cap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoinMarketCapResponse _$CoinMarketCapResponseFromJson(
    Map<String, dynamic> json) {
  return _CoinMarketCapResponse.fromJson(json);
}

/// @nodoc
mixin _$CoinMarketCapResponse {
  Map<String, CoinMarketCapCrypto> get data =>
      throw _privateConstructorUsedError;

  /// Serializes this CoinMarketCapResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoinMarketCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinMarketCapResponseCopyWith<CoinMarketCapResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinMarketCapResponseCopyWith<$Res> {
  factory $CoinMarketCapResponseCopyWith(CoinMarketCapResponse value,
          $Res Function(CoinMarketCapResponse) then) =
      _$CoinMarketCapResponseCopyWithImpl<$Res, CoinMarketCapResponse>;
  @useResult
  $Res call({Map<String, CoinMarketCapCrypto> data});
}

/// @nodoc
class _$CoinMarketCapResponseCopyWithImpl<$Res,
        $Val extends CoinMarketCapResponse>
    implements $CoinMarketCapResponseCopyWith<$Res> {
  _$CoinMarketCapResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinMarketCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, CoinMarketCapCrypto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinMarketCapResponseImplCopyWith<$Res>
    implements $CoinMarketCapResponseCopyWith<$Res> {
  factory _$$CoinMarketCapResponseImplCopyWith(
          _$CoinMarketCapResponseImpl value,
          $Res Function(_$CoinMarketCapResponseImpl) then) =
      __$$CoinMarketCapResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, CoinMarketCapCrypto> data});
}

/// @nodoc
class __$$CoinMarketCapResponseImplCopyWithImpl<$Res>
    extends _$CoinMarketCapResponseCopyWithImpl<$Res,
        _$CoinMarketCapResponseImpl>
    implements _$$CoinMarketCapResponseImplCopyWith<$Res> {
  __$$CoinMarketCapResponseImplCopyWithImpl(_$CoinMarketCapResponseImpl _value,
      $Res Function(_$CoinMarketCapResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinMarketCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CoinMarketCapResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, CoinMarketCapCrypto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinMarketCapResponseImpl implements _CoinMarketCapResponse {
  const _$CoinMarketCapResponseImpl(
      {required final Map<String, CoinMarketCapCrypto> data})
      : _data = data;

  factory _$CoinMarketCapResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinMarketCapResponseImplFromJson(json);

  final Map<String, CoinMarketCapCrypto> _data;
  @override
  Map<String, CoinMarketCapCrypto> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'CoinMarketCapResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinMarketCapResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of CoinMarketCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinMarketCapResponseImplCopyWith<_$CoinMarketCapResponseImpl>
      get copyWith => __$$CoinMarketCapResponseImplCopyWithImpl<
          _$CoinMarketCapResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinMarketCapResponseImplToJson(
      this,
    );
  }
}

abstract class _CoinMarketCapResponse implements CoinMarketCapResponse {
  const factory _CoinMarketCapResponse(
          {required final Map<String, CoinMarketCapCrypto> data}) =
      _$CoinMarketCapResponseImpl;

  factory _CoinMarketCapResponse.fromJson(Map<String, dynamic> json) =
      _$CoinMarketCapResponseImpl.fromJson;

  @override
  Map<String, CoinMarketCapCrypto> get data;

  /// Create a copy of CoinMarketCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinMarketCapResponseImplCopyWith<_$CoinMarketCapResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CoinMarketCapCrypto _$CoinMarketCapCryptoFromJson(Map<String, dynamic> json) {
  return _CoinMarketCapCrypto.fromJson(json);
}

/// @nodoc
mixin _$CoinMarketCapCrypto {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  Quote get quote => throw _privateConstructorUsedError;

  /// Serializes this CoinMarketCapCrypto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoinMarketCapCrypto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinMarketCapCryptoCopyWith<CoinMarketCapCrypto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinMarketCapCryptoCopyWith<$Res> {
  factory $CoinMarketCapCryptoCopyWith(
          CoinMarketCapCrypto value, $Res Function(CoinMarketCapCrypto) then) =
      _$CoinMarketCapCryptoCopyWithImpl<$Res, CoinMarketCapCrypto>;
  @useResult
  $Res call({int id, String name, String symbol, String slug, Quote quote});

  $QuoteCopyWith<$Res> get quote;
}

/// @nodoc
class _$CoinMarketCapCryptoCopyWithImpl<$Res, $Val extends CoinMarketCapCrypto>
    implements $CoinMarketCapCryptoCopyWith<$Res> {
  _$CoinMarketCapCryptoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinMarketCapCrypto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? symbol = null,
    Object? slug = null,
    Object? quote = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Quote,
    ) as $Val);
  }

  /// Create a copy of CoinMarketCapCrypto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuoteCopyWith<$Res> get quote {
    return $QuoteCopyWith<$Res>(_value.quote, (value) {
      return _then(_value.copyWith(quote: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoinMarketCapCryptoImplCopyWith<$Res>
    implements $CoinMarketCapCryptoCopyWith<$Res> {
  factory _$$CoinMarketCapCryptoImplCopyWith(_$CoinMarketCapCryptoImpl value,
          $Res Function(_$CoinMarketCapCryptoImpl) then) =
      __$$CoinMarketCapCryptoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String symbol, String slug, Quote quote});

  @override
  $QuoteCopyWith<$Res> get quote;
}

/// @nodoc
class __$$CoinMarketCapCryptoImplCopyWithImpl<$Res>
    extends _$CoinMarketCapCryptoCopyWithImpl<$Res, _$CoinMarketCapCryptoImpl>
    implements _$$CoinMarketCapCryptoImplCopyWith<$Res> {
  __$$CoinMarketCapCryptoImplCopyWithImpl(_$CoinMarketCapCryptoImpl _value,
      $Res Function(_$CoinMarketCapCryptoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinMarketCapCrypto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? symbol = null,
    Object? slug = null,
    Object? quote = null,
  }) {
    return _then(_$CoinMarketCapCryptoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Quote,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinMarketCapCryptoImpl implements _CoinMarketCapCrypto {
  const _$CoinMarketCapCryptoImpl(
      {required this.id,
      required this.name,
      required this.symbol,
      required this.slug,
      required this.quote});

  factory _$CoinMarketCapCryptoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinMarketCapCryptoImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String symbol;
  @override
  final String slug;
  @override
  final Quote quote;

  @override
  String toString() {
    return 'CoinMarketCapCrypto(id: $id, name: $name, symbol: $symbol, slug: $slug, quote: $quote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinMarketCapCryptoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.quote, quote) || other.quote == quote));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, symbol, slug, quote);

  /// Create a copy of CoinMarketCapCrypto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinMarketCapCryptoImplCopyWith<_$CoinMarketCapCryptoImpl> get copyWith =>
      __$$CoinMarketCapCryptoImplCopyWithImpl<_$CoinMarketCapCryptoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinMarketCapCryptoImplToJson(
      this,
    );
  }
}

abstract class _CoinMarketCapCrypto implements CoinMarketCapCrypto {
  const factory _CoinMarketCapCrypto(
      {required final int id,
      required final String name,
      required final String symbol,
      required final String slug,
      required final Quote quote}) = _$CoinMarketCapCryptoImpl;

  factory _CoinMarketCapCrypto.fromJson(Map<String, dynamic> json) =
      _$CoinMarketCapCryptoImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get symbol;
  @override
  String get slug;
  @override
  Quote get quote;

  /// Create a copy of CoinMarketCapCrypto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinMarketCapCryptoImplCopyWith<_$CoinMarketCapCryptoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Quote _$QuoteFromJson(Map<String, dynamic> json) {
  return _Quote.fromJson(json);
}

/// @nodoc
mixin _$Quote {
  @JsonKey(name: 'USD')
  PriceUsd get priceUsd => throw _privateConstructorUsedError;

  /// Serializes this Quote to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuoteCopyWith<Quote> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteCopyWith<$Res> {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) then) =
      _$QuoteCopyWithImpl<$Res, Quote>;
  @useResult
  $Res call({@JsonKey(name: 'USD') PriceUsd priceUsd});

  $PriceUsdCopyWith<$Res> get priceUsd;
}

/// @nodoc
class _$QuoteCopyWithImpl<$Res, $Val extends Quote>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceUsd = null,
  }) {
    return _then(_value.copyWith(
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as PriceUsd,
    ) as $Val);
  }

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PriceUsdCopyWith<$Res> get priceUsd {
    return $PriceUsdCopyWith<$Res>(_value.priceUsd, (value) {
      return _then(_value.copyWith(priceUsd: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$QuoteImplCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$$QuoteImplCopyWith(
          _$QuoteImpl value, $Res Function(_$QuoteImpl) then) =
      __$$QuoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'USD') PriceUsd priceUsd});

  @override
  $PriceUsdCopyWith<$Res> get priceUsd;
}

/// @nodoc
class __$$QuoteImplCopyWithImpl<$Res>
    extends _$QuoteCopyWithImpl<$Res, _$QuoteImpl>
    implements _$$QuoteImplCopyWith<$Res> {
  __$$QuoteImplCopyWithImpl(
      _$QuoteImpl _value, $Res Function(_$QuoteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceUsd = null,
  }) {
    return _then(_$QuoteImpl(
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as PriceUsd,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QuoteImpl implements _Quote {
  const _$QuoteImpl({@JsonKey(name: 'USD') required this.priceUsd});

  factory _$QuoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuoteImplFromJson(json);

  @override
  @JsonKey(name: 'USD')
  final PriceUsd priceUsd;

  @override
  String toString() {
    return 'Quote(priceUsd: $priceUsd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteImpl &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, priceUsd);

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteImplCopyWith<_$QuoteImpl> get copyWith =>
      __$$QuoteImplCopyWithImpl<_$QuoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteImplToJson(
      this,
    );
  }
}

abstract class _Quote implements Quote {
  const factory _Quote(
      {@JsonKey(name: 'USD') required final PriceUsd priceUsd}) = _$QuoteImpl;

  factory _Quote.fromJson(Map<String, dynamic> json) = _$QuoteImpl.fromJson;

  @override
  @JsonKey(name: 'USD')
  PriceUsd get priceUsd;

  /// Create a copy of Quote
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuoteImplCopyWith<_$QuoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceUsd _$PriceUsdFromJson(Map<String, dynamic> json) {
  return _PriceUsd.fromJson(json);
}

/// @nodoc
mixin _$PriceUsd {
  double get price => throw _privateConstructorUsedError;
  String get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this PriceUsd to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PriceUsd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriceUsdCopyWith<PriceUsd> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceUsdCopyWith<$Res> {
  factory $PriceUsdCopyWith(PriceUsd value, $Res Function(PriceUsd) then) =
      _$PriceUsdCopyWithImpl<$Res, PriceUsd>;
  @useResult
  $Res call({double price, String lastUpdated});
}

/// @nodoc
class _$PriceUsdCopyWithImpl<$Res, $Val extends PriceUsd>
    implements $PriceUsdCopyWith<$Res> {
  _$PriceUsdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceUsd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceUsdImplCopyWith<$Res>
    implements $PriceUsdCopyWith<$Res> {
  factory _$$PriceUsdImplCopyWith(
          _$PriceUsdImpl value, $Res Function(_$PriceUsdImpl) then) =
      __$$PriceUsdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double price, String lastUpdated});
}

/// @nodoc
class __$$PriceUsdImplCopyWithImpl<$Res>
    extends _$PriceUsdCopyWithImpl<$Res, _$PriceUsdImpl>
    implements _$$PriceUsdImplCopyWith<$Res> {
  __$$PriceUsdImplCopyWithImpl(
      _$PriceUsdImpl _value, $Res Function(_$PriceUsdImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceUsd
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$PriceUsdImpl(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceUsdImpl implements _PriceUsd {
  const _$PriceUsdImpl({required this.price, required this.lastUpdated});

  factory _$PriceUsdImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceUsdImplFromJson(json);

  @override
  final double price;
  @override
  final String lastUpdated;

  @override
  String toString() {
    return 'PriceUsd(price: $price, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceUsdImpl &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, price, lastUpdated);

  /// Create a copy of PriceUsd
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceUsdImplCopyWith<_$PriceUsdImpl> get copyWith =>
      __$$PriceUsdImplCopyWithImpl<_$PriceUsdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceUsdImplToJson(
      this,
    );
  }
}

abstract class _PriceUsd implements PriceUsd {
  const factory _PriceUsd(
      {required final double price,
      required final String lastUpdated}) = _$PriceUsdImpl;

  factory _PriceUsd.fromJson(Map<String, dynamic> json) =
      _$PriceUsdImpl.fromJson;

  @override
  double get price;
  @override
  String get lastUpdated;

  /// Create a copy of PriceUsd
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceUsdImplCopyWith<_$PriceUsdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

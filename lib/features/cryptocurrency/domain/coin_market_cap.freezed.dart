// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_market_cap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinMarketCapResponse {

 Map<String, CoinMarketCapCrypto> get data;
/// Create a copy of CoinMarketCapResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinMarketCapResponseCopyWith<CoinMarketCapResponse> get copyWith => _$CoinMarketCapResponseCopyWithImpl<CoinMarketCapResponse>(this as CoinMarketCapResponse, _$identity);

  /// Serializes this CoinMarketCapResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinMarketCapResponse&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CoinMarketCapResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class $CoinMarketCapResponseCopyWith<$Res>  {
  factory $CoinMarketCapResponseCopyWith(CoinMarketCapResponse value, $Res Function(CoinMarketCapResponse) _then) = _$CoinMarketCapResponseCopyWithImpl;
@useResult
$Res call({
 Map<String, CoinMarketCapCrypto> data
});




}
/// @nodoc
class _$CoinMarketCapResponseCopyWithImpl<$Res>
    implements $CoinMarketCapResponseCopyWith<$Res> {
  _$CoinMarketCapResponseCopyWithImpl(this._self, this._then);

  final CoinMarketCapResponse _self;
  final $Res Function(CoinMarketCapResponse) _then;

/// Create a copy of CoinMarketCapResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Map<String, CoinMarketCapCrypto>,
  ));
}

}


/// Adds pattern-matching-related methods to [CoinMarketCapResponse].
extension CoinMarketCapResponsePatterns on CoinMarketCapResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinMarketCapResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinMarketCapResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinMarketCapResponse value)  $default,){
final _that = this;
switch (_that) {
case _CoinMarketCapResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinMarketCapResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CoinMarketCapResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, CoinMarketCapCrypto> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinMarketCapResponse() when $default != null:
return $default(_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, CoinMarketCapCrypto> data)  $default,) {final _that = this;
switch (_that) {
case _CoinMarketCapResponse():
return $default(_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, CoinMarketCapCrypto> data)?  $default,) {final _that = this;
switch (_that) {
case _CoinMarketCapResponse() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinMarketCapResponse implements CoinMarketCapResponse {
  const _CoinMarketCapResponse({required final  Map<String, CoinMarketCapCrypto> data}): _data = data;
  factory _CoinMarketCapResponse.fromJson(Map<String, dynamic> json) => _$CoinMarketCapResponseFromJson(json);

 final  Map<String, CoinMarketCapCrypto> _data;
@override Map<String, CoinMarketCapCrypto> get data {
  if (_data is EqualUnmodifiableMapView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_data);
}


/// Create a copy of CoinMarketCapResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinMarketCapResponseCopyWith<_CoinMarketCapResponse> get copyWith => __$CoinMarketCapResponseCopyWithImpl<_CoinMarketCapResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinMarketCapResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinMarketCapResponse&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CoinMarketCapResponse(data: $data)';
}


}

/// @nodoc
abstract mixin class _$CoinMarketCapResponseCopyWith<$Res> implements $CoinMarketCapResponseCopyWith<$Res> {
  factory _$CoinMarketCapResponseCopyWith(_CoinMarketCapResponse value, $Res Function(_CoinMarketCapResponse) _then) = __$CoinMarketCapResponseCopyWithImpl;
@override @useResult
$Res call({
 Map<String, CoinMarketCapCrypto> data
});




}
/// @nodoc
class __$CoinMarketCapResponseCopyWithImpl<$Res>
    implements _$CoinMarketCapResponseCopyWith<$Res> {
  __$CoinMarketCapResponseCopyWithImpl(this._self, this._then);

  final _CoinMarketCapResponse _self;
  final $Res Function(_CoinMarketCapResponse) _then;

/// Create a copy of CoinMarketCapResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_CoinMarketCapResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as Map<String, CoinMarketCapCrypto>,
  ));
}


}


/// @nodoc
mixin _$CoinMarketCapCrypto {

 int get id; String get name; String get symbol; String get slug; Quote get quote;
/// Create a copy of CoinMarketCapCrypto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoinMarketCapCryptoCopyWith<CoinMarketCapCrypto> get copyWith => _$CoinMarketCapCryptoCopyWithImpl<CoinMarketCapCrypto>(this as CoinMarketCapCrypto, _$identity);

  /// Serializes this CoinMarketCapCrypto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoinMarketCapCrypto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.quote, quote) || other.quote == quote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,symbol,slug,quote);

@override
String toString() {
  return 'CoinMarketCapCrypto(id: $id, name: $name, symbol: $symbol, slug: $slug, quote: $quote)';
}


}

/// @nodoc
abstract mixin class $CoinMarketCapCryptoCopyWith<$Res>  {
  factory $CoinMarketCapCryptoCopyWith(CoinMarketCapCrypto value, $Res Function(CoinMarketCapCrypto) _then) = _$CoinMarketCapCryptoCopyWithImpl;
@useResult
$Res call({
 int id, String name, String symbol, String slug, Quote quote
});


$QuoteCopyWith<$Res> get quote;

}
/// @nodoc
class _$CoinMarketCapCryptoCopyWithImpl<$Res>
    implements $CoinMarketCapCryptoCopyWith<$Res> {
  _$CoinMarketCapCryptoCopyWithImpl(this._self, this._then);

  final CoinMarketCapCrypto _self;
  final $Res Function(CoinMarketCapCrypto) _then;

/// Create a copy of CoinMarketCapCrypto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? symbol = null,Object? slug = null,Object? quote = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as Quote,
  ));
}
/// Create a copy of CoinMarketCapCrypto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteCopyWith<$Res> get quote {
  
  return $QuoteCopyWith<$Res>(_self.quote, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoinMarketCapCrypto].
extension CoinMarketCapCryptoPatterns on CoinMarketCapCrypto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoinMarketCapCrypto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoinMarketCapCrypto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoinMarketCapCrypto value)  $default,){
final _that = this;
switch (_that) {
case _CoinMarketCapCrypto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoinMarketCapCrypto value)?  $default,){
final _that = this;
switch (_that) {
case _CoinMarketCapCrypto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String symbol,  String slug,  Quote quote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoinMarketCapCrypto() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.slug,_that.quote);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String symbol,  String slug,  Quote quote)  $default,) {final _that = this;
switch (_that) {
case _CoinMarketCapCrypto():
return $default(_that.id,_that.name,_that.symbol,_that.slug,_that.quote);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String symbol,  String slug,  Quote quote)?  $default,) {final _that = this;
switch (_that) {
case _CoinMarketCapCrypto() when $default != null:
return $default(_that.id,_that.name,_that.symbol,_that.slug,_that.quote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoinMarketCapCrypto implements CoinMarketCapCrypto {
  const _CoinMarketCapCrypto({required this.id, required this.name, required this.symbol, required this.slug, required this.quote});
  factory _CoinMarketCapCrypto.fromJson(Map<String, dynamic> json) => _$CoinMarketCapCryptoFromJson(json);

@override final  int id;
@override final  String name;
@override final  String symbol;
@override final  String slug;
@override final  Quote quote;

/// Create a copy of CoinMarketCapCrypto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoinMarketCapCryptoCopyWith<_CoinMarketCapCrypto> get copyWith => __$CoinMarketCapCryptoCopyWithImpl<_CoinMarketCapCrypto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoinMarketCapCryptoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoinMarketCapCrypto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.symbol, symbol) || other.symbol == symbol)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.quote, quote) || other.quote == quote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,symbol,slug,quote);

@override
String toString() {
  return 'CoinMarketCapCrypto(id: $id, name: $name, symbol: $symbol, slug: $slug, quote: $quote)';
}


}

/// @nodoc
abstract mixin class _$CoinMarketCapCryptoCopyWith<$Res> implements $CoinMarketCapCryptoCopyWith<$Res> {
  factory _$CoinMarketCapCryptoCopyWith(_CoinMarketCapCrypto value, $Res Function(_CoinMarketCapCrypto) _then) = __$CoinMarketCapCryptoCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String symbol, String slug, Quote quote
});


@override $QuoteCopyWith<$Res> get quote;

}
/// @nodoc
class __$CoinMarketCapCryptoCopyWithImpl<$Res>
    implements _$CoinMarketCapCryptoCopyWith<$Res> {
  __$CoinMarketCapCryptoCopyWithImpl(this._self, this._then);

  final _CoinMarketCapCrypto _self;
  final $Res Function(_CoinMarketCapCrypto) _then;

/// Create a copy of CoinMarketCapCrypto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? symbol = null,Object? slug = null,Object? quote = null,}) {
  return _then(_CoinMarketCapCrypto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,symbol: null == symbol ? _self.symbol : symbol // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as Quote,
  ));
}

/// Create a copy of CoinMarketCapCrypto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteCopyWith<$Res> get quote {
  
  return $QuoteCopyWith<$Res>(_self.quote, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}


/// @nodoc
mixin _$Quote {

@JsonKey(name: 'USD') PriceUsd get priceUsd;
/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteCopyWith<Quote> get copyWith => _$QuoteCopyWithImpl<Quote>(this as Quote, _$identity);

  /// Serializes this Quote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quote&&(identical(other.priceUsd, priceUsd) || other.priceUsd == priceUsd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,priceUsd);

@override
String toString() {
  return 'Quote(priceUsd: $priceUsd)';
}


}

/// @nodoc
abstract mixin class $QuoteCopyWith<$Res>  {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) _then) = _$QuoteCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'USD') PriceUsd priceUsd
});


$PriceUsdCopyWith<$Res> get priceUsd;

}
/// @nodoc
class _$QuoteCopyWithImpl<$Res>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._self, this._then);

  final Quote _self;
  final $Res Function(Quote) _then;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? priceUsd = null,}) {
  return _then(_self.copyWith(
priceUsd: null == priceUsd ? _self.priceUsd : priceUsd // ignore: cast_nullable_to_non_nullable
as PriceUsd,
  ));
}
/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceUsdCopyWith<$Res> get priceUsd {
  
  return $PriceUsdCopyWith<$Res>(_self.priceUsd, (value) {
    return _then(_self.copyWith(priceUsd: value));
  });
}
}


/// Adds pattern-matching-related methods to [Quote].
extension QuotePatterns on Quote {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Quote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Quote() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Quote value)  $default,){
final _that = this;
switch (_that) {
case _Quote():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Quote value)?  $default,){
final _that = this;
switch (_that) {
case _Quote() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'USD')  PriceUsd priceUsd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Quote() when $default != null:
return $default(_that.priceUsd);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'USD')  PriceUsd priceUsd)  $default,) {final _that = this;
switch (_that) {
case _Quote():
return $default(_that.priceUsd);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'USD')  PriceUsd priceUsd)?  $default,) {final _that = this;
switch (_that) {
case _Quote() when $default != null:
return $default(_that.priceUsd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Quote implements Quote {
  const _Quote({@JsonKey(name: 'USD') required this.priceUsd});
  factory _Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);

@override@JsonKey(name: 'USD') final  PriceUsd priceUsd;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteCopyWith<_Quote> get copyWith => __$QuoteCopyWithImpl<_Quote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Quote&&(identical(other.priceUsd, priceUsd) || other.priceUsd == priceUsd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,priceUsd);

@override
String toString() {
  return 'Quote(priceUsd: $priceUsd)';
}


}

/// @nodoc
abstract mixin class _$QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$QuoteCopyWith(_Quote value, $Res Function(_Quote) _then) = __$QuoteCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'USD') PriceUsd priceUsd
});


@override $PriceUsdCopyWith<$Res> get priceUsd;

}
/// @nodoc
class __$QuoteCopyWithImpl<$Res>
    implements _$QuoteCopyWith<$Res> {
  __$QuoteCopyWithImpl(this._self, this._then);

  final _Quote _self;
  final $Res Function(_Quote) _then;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? priceUsd = null,}) {
  return _then(_Quote(
priceUsd: null == priceUsd ? _self.priceUsd : priceUsd // ignore: cast_nullable_to_non_nullable
as PriceUsd,
  ));
}

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PriceUsdCopyWith<$Res> get priceUsd {
  
  return $PriceUsdCopyWith<$Res>(_self.priceUsd, (value) {
    return _then(_self.copyWith(priceUsd: value));
  });
}
}


/// @nodoc
mixin _$PriceUsd {

 double get price; String get lastUpdated;
/// Create a copy of PriceUsd
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PriceUsdCopyWith<PriceUsd> get copyWith => _$PriceUsdCopyWithImpl<PriceUsd>(this as PriceUsd, _$identity);

  /// Serializes this PriceUsd to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PriceUsd&&(identical(other.price, price) || other.price == price)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,lastUpdated);

@override
String toString() {
  return 'PriceUsd(price: $price, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $PriceUsdCopyWith<$Res>  {
  factory $PriceUsdCopyWith(PriceUsd value, $Res Function(PriceUsd) _then) = _$PriceUsdCopyWithImpl;
@useResult
$Res call({
 double price, String lastUpdated
});




}
/// @nodoc
class _$PriceUsdCopyWithImpl<$Res>
    implements $PriceUsdCopyWith<$Res> {
  _$PriceUsdCopyWithImpl(this._self, this._then);

  final PriceUsd _self;
  final $Res Function(PriceUsd) _then;

/// Create a copy of PriceUsd
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? price = null,Object? lastUpdated = null,}) {
  return _then(_self.copyWith(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PriceUsd].
extension PriceUsdPatterns on PriceUsd {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PriceUsd value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PriceUsd() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PriceUsd value)  $default,){
final _that = this;
switch (_that) {
case _PriceUsd():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PriceUsd value)?  $default,){
final _that = this;
switch (_that) {
case _PriceUsd() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double price,  String lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PriceUsd() when $default != null:
return $default(_that.price,_that.lastUpdated);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double price,  String lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _PriceUsd():
return $default(_that.price,_that.lastUpdated);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double price,  String lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _PriceUsd() when $default != null:
return $default(_that.price,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PriceUsd implements PriceUsd {
  const _PriceUsd({required this.price, required this.lastUpdated});
  factory _PriceUsd.fromJson(Map<String, dynamic> json) => _$PriceUsdFromJson(json);

@override final  double price;
@override final  String lastUpdated;

/// Create a copy of PriceUsd
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PriceUsdCopyWith<_PriceUsd> get copyWith => __$PriceUsdCopyWithImpl<_PriceUsd>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PriceUsdToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PriceUsd&&(identical(other.price, price) || other.price == price)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,price,lastUpdated);

@override
String toString() {
  return 'PriceUsd(price: $price, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$PriceUsdCopyWith<$Res> implements $PriceUsdCopyWith<$Res> {
  factory _$PriceUsdCopyWith(_PriceUsd value, $Res Function(_PriceUsd) _then) = __$PriceUsdCopyWithImpl;
@override @useResult
$Res call({
 double price, String lastUpdated
});




}
/// @nodoc
class __$PriceUsdCopyWithImpl<$Res>
    implements _$PriceUsdCopyWith<$Res> {
  __$PriceUsdCopyWithImpl(this._self, this._then);

  final _PriceUsd _self;
  final $Res Function(_PriceUsd) _then;

/// Create a copy of PriceUsd
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? price = null,Object? lastUpdated = null,}) {
  return _then(_PriceUsd(
price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,lastUpdated: null == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

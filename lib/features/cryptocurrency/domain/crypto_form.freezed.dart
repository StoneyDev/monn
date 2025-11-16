// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CryptoForm {

 String get amount; DateTime get date; Cryptocurrency? get crypto;
/// Create a copy of CryptoForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CryptoFormCopyWith<CryptoForm> get copyWith => _$CryptoFormCopyWithImpl<CryptoForm>(this as CryptoForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CryptoForm&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.crypto, crypto) || other.crypto == crypto));
}


@override
int get hashCode => Object.hash(runtimeType,amount,date,crypto);

@override
String toString() {
  return 'CryptoForm(amount: $amount, date: $date, crypto: $crypto)';
}


}

/// @nodoc
abstract mixin class $CryptoFormCopyWith<$Res>  {
  factory $CryptoFormCopyWith(CryptoForm value, $Res Function(CryptoForm) _then) = _$CryptoFormCopyWithImpl;
@useResult
$Res call({
 String amount, DateTime date, Cryptocurrency? crypto
});




}
/// @nodoc
class _$CryptoFormCopyWithImpl<$Res>
    implements $CryptoFormCopyWith<$Res> {
  _$CryptoFormCopyWithImpl(this._self, this._then);

  final CryptoForm _self;
  final $Res Function(CryptoForm) _then;

/// Create a copy of CryptoForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? date = null,Object? crypto = freezed,}) {
  return _then(_self.copyWith(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,crypto: freezed == crypto ? _self.crypto : crypto // ignore: cast_nullable_to_non_nullable
as Cryptocurrency?,
  ));
}

}


/// Adds pattern-matching-related methods to [CryptoForm].
extension CryptoFormPatterns on CryptoForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CryptoForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CryptoForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CryptoForm value)  $default,){
final _that = this;
switch (_that) {
case _CryptoForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CryptoForm value)?  $default,){
final _that = this;
switch (_that) {
case _CryptoForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String amount,  DateTime date,  Cryptocurrency? crypto)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CryptoForm() when $default != null:
return $default(_that.amount,_that.date,_that.crypto);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String amount,  DateTime date,  Cryptocurrency? crypto)  $default,) {final _that = this;
switch (_that) {
case _CryptoForm():
return $default(_that.amount,_that.date,_that.crypto);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String amount,  DateTime date,  Cryptocurrency? crypto)?  $default,) {final _that = this;
switch (_that) {
case _CryptoForm() when $default != null:
return $default(_that.amount,_that.date,_that.crypto);case _:
  return null;

}
}

}

/// @nodoc


class _CryptoForm implements CryptoForm {
  const _CryptoForm({required this.amount, required this.date, this.crypto});
  

@override final  String amount;
@override final  DateTime date;
@override final  Cryptocurrency? crypto;

/// Create a copy of CryptoForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CryptoFormCopyWith<_CryptoForm> get copyWith => __$CryptoFormCopyWithImpl<_CryptoForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CryptoForm&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.crypto, crypto) || other.crypto == crypto));
}


@override
int get hashCode => Object.hash(runtimeType,amount,date,crypto);

@override
String toString() {
  return 'CryptoForm(amount: $amount, date: $date, crypto: $crypto)';
}


}

/// @nodoc
abstract mixin class _$CryptoFormCopyWith<$Res> implements $CryptoFormCopyWith<$Res> {
  factory _$CryptoFormCopyWith(_CryptoForm value, $Res Function(_CryptoForm) _then) = __$CryptoFormCopyWithImpl;
@override @useResult
$Res call({
 String amount, DateTime date, Cryptocurrency? crypto
});




}
/// @nodoc
class __$CryptoFormCopyWithImpl<$Res>
    implements _$CryptoFormCopyWith<$Res> {
  __$CryptoFormCopyWithImpl(this._self, this._then);

  final _CryptoForm _self;
  final $Res Function(_CryptoForm) _then;

/// Create a copy of CryptoForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? date = null,Object? crypto = freezed,}) {
  return _then(_CryptoForm(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,crypto: freezed == crypto ? _self.crypto : crypto // ignore: cast_nullable_to_non_nullable
as Cryptocurrency?,
  ));
}


}

// dart format on

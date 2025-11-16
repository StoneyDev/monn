// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reit_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReitForm {

 String get reitName; DateTime get boughtOn; String get shares; String get price;
/// Create a copy of ReitForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReitFormCopyWith<ReitForm> get copyWith => _$ReitFormCopyWithImpl<ReitForm>(this as ReitForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReitForm&&(identical(other.reitName, reitName) || other.reitName == reitName)&&(identical(other.boughtOn, boughtOn) || other.boughtOn == boughtOn)&&(identical(other.shares, shares) || other.shares == shares)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,reitName,boughtOn,shares,price);

@override
String toString() {
  return 'ReitForm(reitName: $reitName, boughtOn: $boughtOn, shares: $shares, price: $price)';
}


}

/// @nodoc
abstract mixin class $ReitFormCopyWith<$Res>  {
  factory $ReitFormCopyWith(ReitForm value, $Res Function(ReitForm) _then) = _$ReitFormCopyWithImpl;
@useResult
$Res call({
 String reitName, DateTime boughtOn, String shares, String price
});




}
/// @nodoc
class _$ReitFormCopyWithImpl<$Res>
    implements $ReitFormCopyWith<$Res> {
  _$ReitFormCopyWithImpl(this._self, this._then);

  final ReitForm _self;
  final $Res Function(ReitForm) _then;

/// Create a copy of ReitForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reitName = null,Object? boughtOn = null,Object? shares = null,Object? price = null,}) {
  return _then(_self.copyWith(
reitName: null == reitName ? _self.reitName : reitName // ignore: cast_nullable_to_non_nullable
as String,boughtOn: null == boughtOn ? _self.boughtOn : boughtOn // ignore: cast_nullable_to_non_nullable
as DateTime,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReitForm].
extension ReitFormPatterns on ReitForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReitForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReitForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReitForm value)  $default,){
final _that = this;
switch (_that) {
case _ReitForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReitForm value)?  $default,){
final _that = this;
switch (_that) {
case _ReitForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reitName,  DateTime boughtOn,  String shares,  String price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReitForm() when $default != null:
return $default(_that.reitName,_that.boughtOn,_that.shares,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reitName,  DateTime boughtOn,  String shares,  String price)  $default,) {final _that = this;
switch (_that) {
case _ReitForm():
return $default(_that.reitName,_that.boughtOn,_that.shares,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reitName,  DateTime boughtOn,  String shares,  String price)?  $default,) {final _that = this;
switch (_that) {
case _ReitForm() when $default != null:
return $default(_that.reitName,_that.boughtOn,_that.shares,_that.price);case _:
  return null;

}
}

}

/// @nodoc


class _ReitForm implements ReitForm {
  const _ReitForm({required this.reitName, required this.boughtOn, required this.shares, required this.price});
  

@override final  String reitName;
@override final  DateTime boughtOn;
@override final  String shares;
@override final  String price;

/// Create a copy of ReitForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReitFormCopyWith<_ReitForm> get copyWith => __$ReitFormCopyWithImpl<_ReitForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReitForm&&(identical(other.reitName, reitName) || other.reitName == reitName)&&(identical(other.boughtOn, boughtOn) || other.boughtOn == boughtOn)&&(identical(other.shares, shares) || other.shares == shares)&&(identical(other.price, price) || other.price == price));
}


@override
int get hashCode => Object.hash(runtimeType,reitName,boughtOn,shares,price);

@override
String toString() {
  return 'ReitForm(reitName: $reitName, boughtOn: $boughtOn, shares: $shares, price: $price)';
}


}

/// @nodoc
abstract mixin class _$ReitFormCopyWith<$Res> implements $ReitFormCopyWith<$Res> {
  factory _$ReitFormCopyWith(_ReitForm value, $Res Function(_ReitForm) _then) = __$ReitFormCopyWithImpl;
@override @useResult
$Res call({
 String reitName, DateTime boughtOn, String shares, String price
});




}
/// @nodoc
class __$ReitFormCopyWithImpl<$Res>
    implements _$ReitFormCopyWith<$Res> {
  __$ReitFormCopyWithImpl(this._self, this._then);

  final _ReitForm _self;
  final $Res Function(_ReitForm) _then;

/// Create a copy of ReitForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reitName = null,Object? boughtOn = null,Object? shares = null,Object? price = null,}) {
  return _then(_ReitForm(
reitName: null == reitName ? _self.reitName : reitName // ignore: cast_nullable_to_non_nullable
as String,boughtOn: null == boughtOn ? _self.boughtOn : boughtOn // ignore: cast_nullable_to_non_nullable
as DateTime,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

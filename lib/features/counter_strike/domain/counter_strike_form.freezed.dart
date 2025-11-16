// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_strike_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CounterStrikeForm {

 String get purchaseValue; String get currentValue; DateTime get boughtAt; String get quantity; CounterStrikeItem? get imageId; String? get wear;
/// Create a copy of CounterStrikeForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterStrikeFormCopyWith<CounterStrikeForm> get copyWith => _$CounterStrikeFormCopyWithImpl<CounterStrikeForm>(this as CounterStrikeForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterStrikeForm&&(identical(other.purchaseValue, purchaseValue) || other.purchaseValue == purchaseValue)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.boughtAt, boughtAt) || other.boughtAt == boughtAt)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.imageId, imageId) || other.imageId == imageId)&&(identical(other.wear, wear) || other.wear == wear));
}


@override
int get hashCode => Object.hash(runtimeType,purchaseValue,currentValue,boughtAt,quantity,imageId,wear);

@override
String toString() {
  return 'CounterStrikeForm(purchaseValue: $purchaseValue, currentValue: $currentValue, boughtAt: $boughtAt, quantity: $quantity, imageId: $imageId, wear: $wear)';
}


}

/// @nodoc
abstract mixin class $CounterStrikeFormCopyWith<$Res>  {
  factory $CounterStrikeFormCopyWith(CounterStrikeForm value, $Res Function(CounterStrikeForm) _then) = _$CounterStrikeFormCopyWithImpl;
@useResult
$Res call({
 String purchaseValue, String currentValue, DateTime boughtAt, String quantity, CounterStrikeItem? imageId, String? wear
});




}
/// @nodoc
class _$CounterStrikeFormCopyWithImpl<$Res>
    implements $CounterStrikeFormCopyWith<$Res> {
  _$CounterStrikeFormCopyWithImpl(this._self, this._then);

  final CounterStrikeForm _self;
  final $Res Function(CounterStrikeForm) _then;

/// Create a copy of CounterStrikeForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? purchaseValue = null,Object? currentValue = null,Object? boughtAt = null,Object? quantity = null,Object? imageId = freezed,Object? wear = freezed,}) {
  return _then(_self.copyWith(
purchaseValue: null == purchaseValue ? _self.purchaseValue : purchaseValue // ignore: cast_nullable_to_non_nullable
as String,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as String,boughtAt: null == boughtAt ? _self.boughtAt : boughtAt // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as CounterStrikeItem?,wear: freezed == wear ? _self.wear : wear // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterStrikeForm].
extension CounterStrikeFormPatterns on CounterStrikeForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterStrikeForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterStrikeForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterStrikeForm value)  $default,){
final _that = this;
switch (_that) {
case _CounterStrikeForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterStrikeForm value)?  $default,){
final _that = this;
switch (_that) {
case _CounterStrikeForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String purchaseValue,  String currentValue,  DateTime boughtAt,  String quantity,  CounterStrikeItem? imageId,  String? wear)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterStrikeForm() when $default != null:
return $default(_that.purchaseValue,_that.currentValue,_that.boughtAt,_that.quantity,_that.imageId,_that.wear);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String purchaseValue,  String currentValue,  DateTime boughtAt,  String quantity,  CounterStrikeItem? imageId,  String? wear)  $default,) {final _that = this;
switch (_that) {
case _CounterStrikeForm():
return $default(_that.purchaseValue,_that.currentValue,_that.boughtAt,_that.quantity,_that.imageId,_that.wear);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String purchaseValue,  String currentValue,  DateTime boughtAt,  String quantity,  CounterStrikeItem? imageId,  String? wear)?  $default,) {final _that = this;
switch (_that) {
case _CounterStrikeForm() when $default != null:
return $default(_that.purchaseValue,_that.currentValue,_that.boughtAt,_that.quantity,_that.imageId,_that.wear);case _:
  return null;

}
}

}

/// @nodoc


class _CounterStrikeForm implements CounterStrikeForm {
  const _CounterStrikeForm({required this.purchaseValue, required this.currentValue, required this.boughtAt, required this.quantity, required this.imageId, this.wear});
  

@override final  String purchaseValue;
@override final  String currentValue;
@override final  DateTime boughtAt;
@override final  String quantity;
@override final  CounterStrikeItem? imageId;
@override final  String? wear;

/// Create a copy of CounterStrikeForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterStrikeFormCopyWith<_CounterStrikeForm> get copyWith => __$CounterStrikeFormCopyWithImpl<_CounterStrikeForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterStrikeForm&&(identical(other.purchaseValue, purchaseValue) || other.purchaseValue == purchaseValue)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.boughtAt, boughtAt) || other.boughtAt == boughtAt)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.imageId, imageId) || other.imageId == imageId)&&(identical(other.wear, wear) || other.wear == wear));
}


@override
int get hashCode => Object.hash(runtimeType,purchaseValue,currentValue,boughtAt,quantity,imageId,wear);

@override
String toString() {
  return 'CounterStrikeForm(purchaseValue: $purchaseValue, currentValue: $currentValue, boughtAt: $boughtAt, quantity: $quantity, imageId: $imageId, wear: $wear)';
}


}

/// @nodoc
abstract mixin class _$CounterStrikeFormCopyWith<$Res> implements $CounterStrikeFormCopyWith<$Res> {
  factory _$CounterStrikeFormCopyWith(_CounterStrikeForm value, $Res Function(_CounterStrikeForm) _then) = __$CounterStrikeFormCopyWithImpl;
@override @useResult
$Res call({
 String purchaseValue, String currentValue, DateTime boughtAt, String quantity, CounterStrikeItem? imageId, String? wear
});




}
/// @nodoc
class __$CounterStrikeFormCopyWithImpl<$Res>
    implements _$CounterStrikeFormCopyWith<$Res> {
  __$CounterStrikeFormCopyWithImpl(this._self, this._then);

  final _CounterStrikeForm _self;
  final $Res Function(_CounterStrikeForm) _then;

/// Create a copy of CounterStrikeForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? purchaseValue = null,Object? currentValue = null,Object? boughtAt = null,Object? quantity = null,Object? imageId = freezed,Object? wear = freezed,}) {
  return _then(_CounterStrikeForm(
purchaseValue: null == purchaseValue ? _self.purchaseValue : purchaseValue // ignore: cast_nullable_to_non_nullable
as String,currentValue: null == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as String,boughtAt: null == boughtAt ? _self.boughtAt : boughtAt // ignore: cast_nullable_to_non_nullable
as DateTime,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as String,imageId: freezed == imageId ? _self.imageId : imageId // ignore: cast_nullable_to_non_nullable
as CounterStrikeItem?,wear: freezed == wear ? _self.wear : wear // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

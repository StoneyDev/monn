// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reit_dividend_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReitDividendForm {

 DateTime get receivedAt; String get amount; Reit? get reit;
/// Create a copy of ReitDividendForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReitDividendFormCopyWith<ReitDividendForm> get copyWith => _$ReitDividendFormCopyWithImpl<ReitDividendForm>(this as ReitDividendForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReitDividendForm&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.reit, reit) || other.reit == reit));
}


@override
int get hashCode => Object.hash(runtimeType,receivedAt,amount,reit);

@override
String toString() {
  return 'ReitDividendForm(receivedAt: $receivedAt, amount: $amount, reit: $reit)';
}


}

/// @nodoc
abstract mixin class $ReitDividendFormCopyWith<$Res>  {
  factory $ReitDividendFormCopyWith(ReitDividendForm value, $Res Function(ReitDividendForm) _then) = _$ReitDividendFormCopyWithImpl;
@useResult
$Res call({
 DateTime receivedAt, String amount, Reit? reit
});




}
/// @nodoc
class _$ReitDividendFormCopyWithImpl<$Res>
    implements $ReitDividendFormCopyWith<$Res> {
  _$ReitDividendFormCopyWithImpl(this._self, this._then);

  final ReitDividendForm _self;
  final $Res Function(ReitDividendForm) _then;

/// Create a copy of ReitDividendForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? receivedAt = null,Object? amount = null,Object? reit = freezed,}) {
  return _then(_self.copyWith(
receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,reit: freezed == reit ? _self.reit : reit // ignore: cast_nullable_to_non_nullable
as Reit?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReitDividendForm].
extension ReitDividendFormPatterns on ReitDividendForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReitDividendForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReitDividendForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReitDividendForm value)  $default,){
final _that = this;
switch (_that) {
case _ReitDividendForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReitDividendForm value)?  $default,){
final _that = this;
switch (_that) {
case _ReitDividendForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime receivedAt,  String amount,  Reit? reit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReitDividendForm() when $default != null:
return $default(_that.receivedAt,_that.amount,_that.reit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime receivedAt,  String amount,  Reit? reit)  $default,) {final _that = this;
switch (_that) {
case _ReitDividendForm():
return $default(_that.receivedAt,_that.amount,_that.reit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime receivedAt,  String amount,  Reit? reit)?  $default,) {final _that = this;
switch (_that) {
case _ReitDividendForm() when $default != null:
return $default(_that.receivedAt,_that.amount,_that.reit);case _:
  return null;

}
}

}

/// @nodoc


class _ReitDividendForm implements ReitDividendForm {
  const _ReitDividendForm({required this.receivedAt, required this.amount, this.reit});
  

@override final  DateTime receivedAt;
@override final  String amount;
@override final  Reit? reit;

/// Create a copy of ReitDividendForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReitDividendFormCopyWith<_ReitDividendForm> get copyWith => __$ReitDividendFormCopyWithImpl<_ReitDividendForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReitDividendForm&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.reit, reit) || other.reit == reit));
}


@override
int get hashCode => Object.hash(runtimeType,receivedAt,amount,reit);

@override
String toString() {
  return 'ReitDividendForm(receivedAt: $receivedAt, amount: $amount, reit: $reit)';
}


}

/// @nodoc
abstract mixin class _$ReitDividendFormCopyWith<$Res> implements $ReitDividendFormCopyWith<$Res> {
  factory _$ReitDividendFormCopyWith(_ReitDividendForm value, $Res Function(_ReitDividendForm) _then) = __$ReitDividendFormCopyWithImpl;
@override @useResult
$Res call({
 DateTime receivedAt, String amount, Reit? reit
});




}
/// @nodoc
class __$ReitDividendFormCopyWithImpl<$Res>
    implements _$ReitDividendFormCopyWith<$Res> {
  __$ReitDividendFormCopyWithImpl(this._self, this._then);

  final _ReitDividendForm _self;
  final $Res Function(_ReitDividendForm) _then;

/// Create a copy of ReitDividendForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? receivedAt = null,Object? amount = null,Object? reit = freezed,}) {
  return _then(_ReitDividendForm(
receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as String,reit: freezed == reit ? _self.reit : reit // ignore: cast_nullable_to_non_nullable
as Reit?,
  ));
}


}

// dart format on

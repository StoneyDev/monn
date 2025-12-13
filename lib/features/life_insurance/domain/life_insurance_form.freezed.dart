// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'life_insurance_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LifeInsuranceForm {

 String get invested; String get interests;
/// Create a copy of LifeInsuranceForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LifeInsuranceFormCopyWith<LifeInsuranceForm> get copyWith => _$LifeInsuranceFormCopyWithImpl<LifeInsuranceForm>(this as LifeInsuranceForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LifeInsuranceForm&&(identical(other.invested, invested) || other.invested == invested)&&(identical(other.interests, interests) || other.interests == interests));
}


@override
int get hashCode => Object.hash(runtimeType,invested,interests);

@override
String toString() {
  return 'LifeInsuranceForm(invested: $invested, interests: $interests)';
}


}

/// @nodoc
abstract mixin class $LifeInsuranceFormCopyWith<$Res>  {
  factory $LifeInsuranceFormCopyWith(LifeInsuranceForm value, $Res Function(LifeInsuranceForm) _then) = _$LifeInsuranceFormCopyWithImpl;
@useResult
$Res call({
 String invested, String interests
});




}
/// @nodoc
class _$LifeInsuranceFormCopyWithImpl<$Res>
    implements $LifeInsuranceFormCopyWith<$Res> {
  _$LifeInsuranceFormCopyWithImpl(this._self, this._then);

  final LifeInsuranceForm _self;
  final $Res Function(LifeInsuranceForm) _then;

/// Create a copy of LifeInsuranceForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invested = null,Object? interests = null,}) {
  return _then(_self.copyWith(
invested: null == invested ? _self.invested : invested // ignore: cast_nullable_to_non_nullable
as String,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LifeInsuranceForm].
extension LifeInsuranceFormPatterns on LifeInsuranceForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LifeInsuranceForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LifeInsuranceForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LifeInsuranceForm value)  $default,){
final _that = this;
switch (_that) {
case _LifeInsuranceForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LifeInsuranceForm value)?  $default,){
final _that = this;
switch (_that) {
case _LifeInsuranceForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String invested,  String interests)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LifeInsuranceForm() when $default != null:
return $default(_that.invested,_that.interests);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String invested,  String interests)  $default,) {final _that = this;
switch (_that) {
case _LifeInsuranceForm():
return $default(_that.invested,_that.interests);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String invested,  String interests)?  $default,) {final _that = this;
switch (_that) {
case _LifeInsuranceForm() when $default != null:
return $default(_that.invested,_that.interests);case _:
  return null;

}
}

}

/// @nodoc


class _LifeInsuranceForm implements LifeInsuranceForm {
  const _LifeInsuranceForm({required this.invested, required this.interests});
  

@override final  String invested;
@override final  String interests;

/// Create a copy of LifeInsuranceForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LifeInsuranceFormCopyWith<_LifeInsuranceForm> get copyWith => __$LifeInsuranceFormCopyWithImpl<_LifeInsuranceForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LifeInsuranceForm&&(identical(other.invested, invested) || other.invested == invested)&&(identical(other.interests, interests) || other.interests == interests));
}


@override
int get hashCode => Object.hash(runtimeType,invested,interests);

@override
String toString() {
  return 'LifeInsuranceForm(invested: $invested, interests: $interests)';
}


}

/// @nodoc
abstract mixin class _$LifeInsuranceFormCopyWith<$Res> implements $LifeInsuranceFormCopyWith<$Res> {
  factory _$LifeInsuranceFormCopyWith(_LifeInsuranceForm value, $Res Function(_LifeInsuranceForm) _then) = __$LifeInsuranceFormCopyWithImpl;
@override @useResult
$Res call({
 String invested, String interests
});




}
/// @nodoc
class __$LifeInsuranceFormCopyWithImpl<$Res>
    implements _$LifeInsuranceFormCopyWith<$Res> {
  __$LifeInsuranceFormCopyWithImpl(this._self, this._then);

  final _LifeInsuranceForm _self;
  final $Res Function(_LifeInsuranceForm) _then;

/// Create a copy of LifeInsuranceForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invested = null,Object? interests = null,}) {
  return _then(_LifeInsuranceForm(
invested: null == invested ? _self.invested : invested // ignore: cast_nullable_to_non_nullable
as String,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

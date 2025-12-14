// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelance_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FreelanceForm {

 String get annualRevenue;
/// Create a copy of FreelanceForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelanceFormCopyWith<FreelanceForm> get copyWith => _$FreelanceFormCopyWithImpl<FreelanceForm>(this as FreelanceForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelanceForm&&(identical(other.annualRevenue, annualRevenue) || other.annualRevenue == annualRevenue));
}


@override
int get hashCode => Object.hash(runtimeType,annualRevenue);

@override
String toString() {
  return 'FreelanceForm(annualRevenue: $annualRevenue)';
}


}

/// @nodoc
abstract mixin class $FreelanceFormCopyWith<$Res>  {
  factory $FreelanceFormCopyWith(FreelanceForm value, $Res Function(FreelanceForm) _then) = _$FreelanceFormCopyWithImpl;
@useResult
$Res call({
 String annualRevenue
});




}
/// @nodoc
class _$FreelanceFormCopyWithImpl<$Res>
    implements $FreelanceFormCopyWith<$Res> {
  _$FreelanceFormCopyWithImpl(this._self, this._then);

  final FreelanceForm _self;
  final $Res Function(FreelanceForm) _then;

/// Create a copy of FreelanceForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? annualRevenue = null,}) {
  return _then(_self.copyWith(
annualRevenue: null == annualRevenue ? _self.annualRevenue : annualRevenue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FreelanceForm].
extension FreelanceFormPatterns on FreelanceForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreelanceForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreelanceForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreelanceForm value)  $default,){
final _that = this;
switch (_that) {
case _FreelanceForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreelanceForm value)?  $default,){
final _that = this;
switch (_that) {
case _FreelanceForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String annualRevenue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FreelanceForm() when $default != null:
return $default(_that.annualRevenue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String annualRevenue)  $default,) {final _that = this;
switch (_that) {
case _FreelanceForm():
return $default(_that.annualRevenue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String annualRevenue)?  $default,) {final _that = this;
switch (_that) {
case _FreelanceForm() when $default != null:
return $default(_that.annualRevenue);case _:
  return null;

}
}

}

/// @nodoc


class _FreelanceForm implements FreelanceForm {
  const _FreelanceForm({required this.annualRevenue});
  

@override final  String annualRevenue;

/// Create a copy of FreelanceForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreelanceFormCopyWith<_FreelanceForm> get copyWith => __$FreelanceFormCopyWithImpl<_FreelanceForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreelanceForm&&(identical(other.annualRevenue, annualRevenue) || other.annualRevenue == annualRevenue));
}


@override
int get hashCode => Object.hash(runtimeType,annualRevenue);

@override
String toString() {
  return 'FreelanceForm(annualRevenue: $annualRevenue)';
}


}

/// @nodoc
abstract mixin class _$FreelanceFormCopyWith<$Res> implements $FreelanceFormCopyWith<$Res> {
  factory _$FreelanceFormCopyWith(_FreelanceForm value, $Res Function(_FreelanceForm) _then) = __$FreelanceFormCopyWithImpl;
@override @useResult
$Res call({
 String annualRevenue
});




}
/// @nodoc
class __$FreelanceFormCopyWithImpl<$Res>
    implements _$FreelanceFormCopyWith<$Res> {
  __$FreelanceFormCopyWithImpl(this._self, this._then);

  final _FreelanceForm _self;
  final $Res Function(_FreelanceForm) _then;

/// Create a copy of FreelanceForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? annualRevenue = null,}) {
  return _then(_FreelanceForm(
annualRevenue: null == annualRevenue ? _self.annualRevenue : annualRevenue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

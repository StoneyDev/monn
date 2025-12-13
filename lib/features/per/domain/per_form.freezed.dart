// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'per_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PerForm {

 String get invested; String get interests;
/// Create a copy of PerForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PerFormCopyWith<PerForm> get copyWith => _$PerFormCopyWithImpl<PerForm>(this as PerForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PerForm&&(identical(other.invested, invested) || other.invested == invested)&&(identical(other.interests, interests) || other.interests == interests));
}


@override
int get hashCode => Object.hash(runtimeType,invested,interests);

@override
String toString() {
  return 'PerForm(invested: $invested, interests: $interests)';
}


}

/// @nodoc
abstract mixin class $PerFormCopyWith<$Res>  {
  factory $PerFormCopyWith(PerForm value, $Res Function(PerForm) _then) = _$PerFormCopyWithImpl;
@useResult
$Res call({
 String invested, String interests
});




}
/// @nodoc
class _$PerFormCopyWithImpl<$Res>
    implements $PerFormCopyWith<$Res> {
  _$PerFormCopyWithImpl(this._self, this._then);

  final PerForm _self;
  final $Res Function(PerForm) _then;

/// Create a copy of PerForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? invested = null,Object? interests = null,}) {
  return _then(_self.copyWith(
invested: null == invested ? _self.invested : invested // ignore: cast_nullable_to_non_nullable
as String,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PerForm].
extension PerFormPatterns on PerForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PerForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PerForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PerForm value)  $default,){
final _that = this;
switch (_that) {
case _PerForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PerForm value)?  $default,){
final _that = this;
switch (_that) {
case _PerForm() when $default != null:
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
case _PerForm() when $default != null:
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
case _PerForm():
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
case _PerForm() when $default != null:
return $default(_that.invested,_that.interests);case _:
  return null;

}
}

}

/// @nodoc


class _PerForm implements PerForm {
  const _PerForm({required this.invested, required this.interests});
  

@override final  String invested;
@override final  String interests;

/// Create a copy of PerForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PerFormCopyWith<_PerForm> get copyWith => __$PerFormCopyWithImpl<_PerForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PerForm&&(identical(other.invested, invested) || other.invested == invested)&&(identical(other.interests, interests) || other.interests == interests));
}


@override
int get hashCode => Object.hash(runtimeType,invested,interests);

@override
String toString() {
  return 'PerForm(invested: $invested, interests: $interests)';
}


}

/// @nodoc
abstract mixin class _$PerFormCopyWith<$Res> implements $PerFormCopyWith<$Res> {
  factory _$PerFormCopyWith(_PerForm value, $Res Function(_PerForm) _then) = __$PerFormCopyWithImpl;
@override @useResult
$Res call({
 String invested, String interests
});




}
/// @nodoc
class __$PerFormCopyWithImpl<$Res>
    implements _$PerFormCopyWith<$Res> {
  __$PerFormCopyWithImpl(this._self, this._then);

  final _PerForm _self;
  final $Res Function(_PerForm) _then;

/// Create a copy of PerForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? invested = null,Object? interests = null,}) {
  return _then(_PerForm(
invested: null == invested ? _self.invested : invested // ignore: cast_nullable_to_non_nullable
as String,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

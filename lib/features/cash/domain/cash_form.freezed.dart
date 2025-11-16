// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CashForm {

 String get label; String get value; int? get id;
/// Create a copy of CashForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CashFormCopyWith<CashForm> get copyWith => _$CashFormCopyWithImpl<CashForm>(this as CashForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CashForm&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,label,value,id);

@override
String toString() {
  return 'CashForm(label: $label, value: $value, id: $id)';
}


}

/// @nodoc
abstract mixin class $CashFormCopyWith<$Res>  {
  factory $CashFormCopyWith(CashForm value, $Res Function(CashForm) _then) = _$CashFormCopyWithImpl;
@useResult
$Res call({
 String label, String value, int? id
});




}
/// @nodoc
class _$CashFormCopyWithImpl<$Res>
    implements $CashFormCopyWith<$Res> {
  _$CashFormCopyWithImpl(this._self, this._then);

  final CashForm _self;
  final $Res Function(CashForm) _then;

/// Create a copy of CashForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? value = null,Object? id = freezed,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CashForm].
extension CashFormPatterns on CashForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CashForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CashForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CashForm value)  $default,){
final _that = this;
switch (_that) {
case _CashForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CashForm value)?  $default,){
final _that = this;
switch (_that) {
case _CashForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String value,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CashForm() when $default != null:
return $default(_that.label,_that.value,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String value,  int? id)  $default,) {final _that = this;
switch (_that) {
case _CashForm():
return $default(_that.label,_that.value,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String value,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _CashForm() when $default != null:
return $default(_that.label,_that.value,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _CashForm implements CashForm {
  const _CashForm({required this.label, required this.value, this.id});
  

@override final  String label;
@override final  String value;
@override final  int? id;

/// Create a copy of CashForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CashFormCopyWith<_CashForm> get copyWith => __$CashFormCopyWithImpl<_CashForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CashForm&&(identical(other.label, label) || other.label == label)&&(identical(other.value, value) || other.value == value)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,label,value,id);

@override
String toString() {
  return 'CashForm(label: $label, value: $value, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CashFormCopyWith<$Res> implements $CashFormCopyWith<$Res> {
  factory _$CashFormCopyWith(_CashForm value, $Res Function(_CashForm) _then) = __$CashFormCopyWithImpl;
@override @useResult
$Res call({
 String label, String value, int? id
});




}
/// @nodoc
class __$CashFormCopyWithImpl<$Res>
    implements _$CashFormCopyWith<$Res> {
  __$CashFormCopyWithImpl(this._self, this._then);

  final _CashForm _self;
  final $Res Function(_CashForm) _then;

/// Create a copy of CashForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? value = null,Object? id = freezed,}) {
  return _then(_CashForm(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on

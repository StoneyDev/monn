// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pea_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PeaForm {

 String get equity; String get costAverage; bool get isDirty;
/// Create a copy of PeaForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PeaFormCopyWith<PeaForm> get copyWith => _$PeaFormCopyWithImpl<PeaForm>(this as PeaForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PeaForm&&(identical(other.equity, equity) || other.equity == equity)&&(identical(other.costAverage, costAverage) || other.costAverage == costAverage)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty));
}


@override
int get hashCode => Object.hash(runtimeType,equity,costAverage,isDirty);

@override
String toString() {
  return 'PeaForm(equity: $equity, costAverage: $costAverage, isDirty: $isDirty)';
}


}

/// @nodoc
abstract mixin class $PeaFormCopyWith<$Res>  {
  factory $PeaFormCopyWith(PeaForm value, $Res Function(PeaForm) _then) = _$PeaFormCopyWithImpl;
@useResult
$Res call({
 String equity, String costAverage, bool isDirty
});




}
/// @nodoc
class _$PeaFormCopyWithImpl<$Res>
    implements $PeaFormCopyWith<$Res> {
  _$PeaFormCopyWithImpl(this._self, this._then);

  final PeaForm _self;
  final $Res Function(PeaForm) _then;

/// Create a copy of PeaForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? equity = null,Object? costAverage = null,Object? isDirty = null,}) {
  return _then(_self.copyWith(
equity: null == equity ? _self.equity : equity // ignore: cast_nullable_to_non_nullable
as String,costAverage: null == costAverage ? _self.costAverage : costAverage // ignore: cast_nullable_to_non_nullable
as String,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PeaForm].
extension PeaFormPatterns on PeaForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PeaForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PeaForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PeaForm value)  $default,){
final _that = this;
switch (_that) {
case _PeaForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PeaForm value)?  $default,){
final _that = this;
switch (_that) {
case _PeaForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String equity,  String costAverage,  bool isDirty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PeaForm() when $default != null:
return $default(_that.equity,_that.costAverage,_that.isDirty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String equity,  String costAverage,  bool isDirty)  $default,) {final _that = this;
switch (_that) {
case _PeaForm():
return $default(_that.equity,_that.costAverage,_that.isDirty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String equity,  String costAverage,  bool isDirty)?  $default,) {final _that = this;
switch (_that) {
case _PeaForm() when $default != null:
return $default(_that.equity,_that.costAverage,_that.isDirty);case _:
  return null;

}
}

}

/// @nodoc


class _PeaForm implements PeaForm {
  const _PeaForm({required this.equity, required this.costAverage, this.isDirty = false});
  

@override final  String equity;
@override final  String costAverage;
@override@JsonKey() final  bool isDirty;

/// Create a copy of PeaForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PeaFormCopyWith<_PeaForm> get copyWith => __$PeaFormCopyWithImpl<_PeaForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PeaForm&&(identical(other.equity, equity) || other.equity == equity)&&(identical(other.costAverage, costAverage) || other.costAverage == costAverage)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty));
}


@override
int get hashCode => Object.hash(runtimeType,equity,costAverage,isDirty);

@override
String toString() {
  return 'PeaForm(equity: $equity, costAverage: $costAverage, isDirty: $isDirty)';
}


}

/// @nodoc
abstract mixin class _$PeaFormCopyWith<$Res> implements $PeaFormCopyWith<$Res> {
  factory _$PeaFormCopyWith(_PeaForm value, $Res Function(_PeaForm) _then) = __$PeaFormCopyWithImpl;
@override @useResult
$Res call({
 String equity, String costAverage, bool isDirty
});




}
/// @nodoc
class __$PeaFormCopyWithImpl<$Res>
    implements _$PeaFormCopyWith<$Res> {
  __$PeaFormCopyWithImpl(this._self, this._then);

  final _PeaForm _self;
  final $Res Function(_PeaForm) _then;

/// Create a copy of PeaForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? equity = null,Object? costAverage = null,Object? isDirty = null,}) {
  return _then(_PeaForm(
equity: null == equity ? _self.equity : equity // ignore: cast_nullable_to_non_nullable
as String,costAverage: null == costAverage ? _self.costAverage : costAverage // ignore: cast_nullable_to_non_nullable
as String,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

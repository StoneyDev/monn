// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_book_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SavingsBookForm {

 String get name; String get startAmount; String? get withdrawal;
/// Create a copy of SavingsBookForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingsBookFormCopyWith<SavingsBookForm> get copyWith => _$SavingsBookFormCopyWithImpl<SavingsBookForm>(this as SavingsBookForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SavingsBookForm&&(identical(other.name, name) || other.name == name)&&(identical(other.startAmount, startAmount) || other.startAmount == startAmount)&&(identical(other.withdrawal, withdrawal) || other.withdrawal == withdrawal));
}


@override
int get hashCode => Object.hash(runtimeType,name,startAmount,withdrawal);

@override
String toString() {
  return 'SavingsBookForm(name: $name, startAmount: $startAmount, withdrawal: $withdrawal)';
}


}

/// @nodoc
abstract mixin class $SavingsBookFormCopyWith<$Res>  {
  factory $SavingsBookFormCopyWith(SavingsBookForm value, $Res Function(SavingsBookForm) _then) = _$SavingsBookFormCopyWithImpl;
@useResult
$Res call({
 String name, String startAmount, String? withdrawal
});




}
/// @nodoc
class _$SavingsBookFormCopyWithImpl<$Res>
    implements $SavingsBookFormCopyWith<$Res> {
  _$SavingsBookFormCopyWithImpl(this._self, this._then);

  final SavingsBookForm _self;
  final $Res Function(SavingsBookForm) _then;

/// Create a copy of SavingsBookForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? startAmount = null,Object? withdrawal = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startAmount: null == startAmount ? _self.startAmount : startAmount // ignore: cast_nullable_to_non_nullable
as String,withdrawal: freezed == withdrawal ? _self.withdrawal : withdrawal // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SavingsBookForm].
extension SavingsBookFormPatterns on SavingsBookForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SavingsBookForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SavingsBookForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SavingsBookForm value)  $default,){
final _that = this;
switch (_that) {
case _SavingsBookForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SavingsBookForm value)?  $default,){
final _that = this;
switch (_that) {
case _SavingsBookForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String startAmount,  String? withdrawal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SavingsBookForm() when $default != null:
return $default(_that.name,_that.startAmount,_that.withdrawal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String startAmount,  String? withdrawal)  $default,) {final _that = this;
switch (_that) {
case _SavingsBookForm():
return $default(_that.name,_that.startAmount,_that.withdrawal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String startAmount,  String? withdrawal)?  $default,) {final _that = this;
switch (_that) {
case _SavingsBookForm() when $default != null:
return $default(_that.name,_that.startAmount,_that.withdrawal);case _:
  return null;

}
}

}

/// @nodoc


class _SavingsBookForm implements SavingsBookForm {
  const _SavingsBookForm({required this.name, required this.startAmount, this.withdrawal});
  

@override final  String name;
@override final  String startAmount;
@override final  String? withdrawal;

/// Create a copy of SavingsBookForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavingsBookFormCopyWith<_SavingsBookForm> get copyWith => __$SavingsBookFormCopyWithImpl<_SavingsBookForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SavingsBookForm&&(identical(other.name, name) || other.name == name)&&(identical(other.startAmount, startAmount) || other.startAmount == startAmount)&&(identical(other.withdrawal, withdrawal) || other.withdrawal == withdrawal));
}


@override
int get hashCode => Object.hash(runtimeType,name,startAmount,withdrawal);

@override
String toString() {
  return 'SavingsBookForm(name: $name, startAmount: $startAmount, withdrawal: $withdrawal)';
}


}

/// @nodoc
abstract mixin class _$SavingsBookFormCopyWith<$Res> implements $SavingsBookFormCopyWith<$Res> {
  factory _$SavingsBookFormCopyWith(_SavingsBookForm value, $Res Function(_SavingsBookForm) _then) = __$SavingsBookFormCopyWithImpl;
@override @useResult
$Res call({
 String name, String startAmount, String? withdrawal
});




}
/// @nodoc
class __$SavingsBookFormCopyWithImpl<$Res>
    implements _$SavingsBookFormCopyWith<$Res> {
  __$SavingsBookFormCopyWithImpl(this._self, this._then);

  final _SavingsBookForm _self;
  final $Res Function(_SavingsBookForm) _then;

/// Create a copy of SavingsBookForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? startAmount = null,Object? withdrawal = freezed,}) {
  return _then(_SavingsBookForm(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startAmount: null == startAmount ? _self.startAmount : startAmount // ignore: cast_nullable_to_non_nullable
as String,withdrawal: freezed == withdrawal ? _self.withdrawal : withdrawal // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crowdfunding_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CrowdfundingForm {

 String get platformName; DateTime get receivedAt; String get brutProfit; String? get taxPercentage; int? get id;
/// Create a copy of CrowdfundingForm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CrowdfundingFormCopyWith<CrowdfundingForm> get copyWith => _$CrowdfundingFormCopyWithImpl<CrowdfundingForm>(this as CrowdfundingForm, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CrowdfundingForm&&(identical(other.platformName, platformName) || other.platformName == platformName)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.brutProfit, brutProfit) || other.brutProfit == brutProfit)&&(identical(other.taxPercentage, taxPercentage) || other.taxPercentage == taxPercentage)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,platformName,receivedAt,brutProfit,taxPercentage,id);

@override
String toString() {
  return 'CrowdfundingForm(platformName: $platformName, receivedAt: $receivedAt, brutProfit: $brutProfit, taxPercentage: $taxPercentage, id: $id)';
}


}

/// @nodoc
abstract mixin class $CrowdfundingFormCopyWith<$Res>  {
  factory $CrowdfundingFormCopyWith(CrowdfundingForm value, $Res Function(CrowdfundingForm) _then) = _$CrowdfundingFormCopyWithImpl;
@useResult
$Res call({
 String platformName, DateTime receivedAt, String brutProfit, String? taxPercentage, int? id
});




}
/// @nodoc
class _$CrowdfundingFormCopyWithImpl<$Res>
    implements $CrowdfundingFormCopyWith<$Res> {
  _$CrowdfundingFormCopyWithImpl(this._self, this._then);

  final CrowdfundingForm _self;
  final $Res Function(CrowdfundingForm) _then;

/// Create a copy of CrowdfundingForm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? platformName = null,Object? receivedAt = null,Object? brutProfit = null,Object? taxPercentage = freezed,Object? id = freezed,}) {
  return _then(_self.copyWith(
platformName: null == platformName ? _self.platformName : platformName // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,brutProfit: null == brutProfit ? _self.brutProfit : brutProfit // ignore: cast_nullable_to_non_nullable
as String,taxPercentage: freezed == taxPercentage ? _self.taxPercentage : taxPercentage // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CrowdfundingForm].
extension CrowdfundingFormPatterns on CrowdfundingForm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CrowdfundingForm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CrowdfundingForm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CrowdfundingForm value)  $default,){
final _that = this;
switch (_that) {
case _CrowdfundingForm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CrowdfundingForm value)?  $default,){
final _that = this;
switch (_that) {
case _CrowdfundingForm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String platformName,  DateTime receivedAt,  String brutProfit,  String? taxPercentage,  int? id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CrowdfundingForm() when $default != null:
return $default(_that.platformName,_that.receivedAt,_that.brutProfit,_that.taxPercentage,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String platformName,  DateTime receivedAt,  String brutProfit,  String? taxPercentage,  int? id)  $default,) {final _that = this;
switch (_that) {
case _CrowdfundingForm():
return $default(_that.platformName,_that.receivedAt,_that.brutProfit,_that.taxPercentage,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String platformName,  DateTime receivedAt,  String brutProfit,  String? taxPercentage,  int? id)?  $default,) {final _that = this;
switch (_that) {
case _CrowdfundingForm() when $default != null:
return $default(_that.platformName,_that.receivedAt,_that.brutProfit,_that.taxPercentage,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _CrowdfundingForm implements CrowdfundingForm {
  const _CrowdfundingForm({required this.platformName, required this.receivedAt, required this.brutProfit, this.taxPercentage, this.id});
  

@override final  String platformName;
@override final  DateTime receivedAt;
@override final  String brutProfit;
@override final  String? taxPercentage;
@override final  int? id;

/// Create a copy of CrowdfundingForm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CrowdfundingFormCopyWith<_CrowdfundingForm> get copyWith => __$CrowdfundingFormCopyWithImpl<_CrowdfundingForm>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CrowdfundingForm&&(identical(other.platformName, platformName) || other.platformName == platformName)&&(identical(other.receivedAt, receivedAt) || other.receivedAt == receivedAt)&&(identical(other.brutProfit, brutProfit) || other.brutProfit == brutProfit)&&(identical(other.taxPercentage, taxPercentage) || other.taxPercentage == taxPercentage)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,platformName,receivedAt,brutProfit,taxPercentage,id);

@override
String toString() {
  return 'CrowdfundingForm(platformName: $platformName, receivedAt: $receivedAt, brutProfit: $brutProfit, taxPercentage: $taxPercentage, id: $id)';
}


}

/// @nodoc
abstract mixin class _$CrowdfundingFormCopyWith<$Res> implements $CrowdfundingFormCopyWith<$Res> {
  factory _$CrowdfundingFormCopyWith(_CrowdfundingForm value, $Res Function(_CrowdfundingForm) _then) = __$CrowdfundingFormCopyWithImpl;
@override @useResult
$Res call({
 String platformName, DateTime receivedAt, String brutProfit, String? taxPercentage, int? id
});




}
/// @nodoc
class __$CrowdfundingFormCopyWithImpl<$Res>
    implements _$CrowdfundingFormCopyWith<$Res> {
  __$CrowdfundingFormCopyWithImpl(this._self, this._then);

  final _CrowdfundingForm _self;
  final $Res Function(_CrowdfundingForm) _then;

/// Create a copy of CrowdfundingForm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? platformName = null,Object? receivedAt = null,Object? brutProfit = null,Object? taxPercentage = freezed,Object? id = freezed,}) {
  return _then(_CrowdfundingForm(
platformName: null == platformName ? _self.platformName : platformName // ignore: cast_nullable_to_non_nullable
as String,receivedAt: null == receivedAt ? _self.receivedAt : receivedAt // ignore: cast_nullable_to_non_nullable
as DateTime,brutProfit: null == brutProfit ? _self.brutProfit : brutProfit // ignore: cast_nullable_to_non_nullable
as String,taxPercentage: freezed == taxPercentage ? _self.taxPercentage : taxPercentage // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on

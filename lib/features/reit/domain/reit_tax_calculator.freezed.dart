// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reit_tax_calculator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReitTaxResult {

 double get reitDividends; double get reitIncomeTax; double get reitSocialCharges; double get reitTotalTax; double get reitNetAfterTax; double get effectiveTaxRate; double get tmi;
/// Create a copy of ReitTaxResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReitTaxResultCopyWith<ReitTaxResult> get copyWith => _$ReitTaxResultCopyWithImpl<ReitTaxResult>(this as ReitTaxResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReitTaxResult&&(identical(other.reitDividends, reitDividends) || other.reitDividends == reitDividends)&&(identical(other.reitIncomeTax, reitIncomeTax) || other.reitIncomeTax == reitIncomeTax)&&(identical(other.reitSocialCharges, reitSocialCharges) || other.reitSocialCharges == reitSocialCharges)&&(identical(other.reitTotalTax, reitTotalTax) || other.reitTotalTax == reitTotalTax)&&(identical(other.reitNetAfterTax, reitNetAfterTax) || other.reitNetAfterTax == reitNetAfterTax)&&(identical(other.effectiveTaxRate, effectiveTaxRate) || other.effectiveTaxRate == effectiveTaxRate)&&(identical(other.tmi, tmi) || other.tmi == tmi));
}


@override
int get hashCode => Object.hash(runtimeType,reitDividends,reitIncomeTax,reitSocialCharges,reitTotalTax,reitNetAfterTax,effectiveTaxRate,tmi);

@override
String toString() {
  return 'ReitTaxResult(reitDividends: $reitDividends, reitIncomeTax: $reitIncomeTax, reitSocialCharges: $reitSocialCharges, reitTotalTax: $reitTotalTax, reitNetAfterTax: $reitNetAfterTax, effectiveTaxRate: $effectiveTaxRate, tmi: $tmi)';
}


}

/// @nodoc
abstract mixin class $ReitTaxResultCopyWith<$Res>  {
  factory $ReitTaxResultCopyWith(ReitTaxResult value, $Res Function(ReitTaxResult) _then) = _$ReitTaxResultCopyWithImpl;
@useResult
$Res call({
 double reitDividends, double reitIncomeTax, double reitSocialCharges, double reitTotalTax, double reitNetAfterTax, double effectiveTaxRate, double tmi
});




}
/// @nodoc
class _$ReitTaxResultCopyWithImpl<$Res>
    implements $ReitTaxResultCopyWith<$Res> {
  _$ReitTaxResultCopyWithImpl(this._self, this._then);

  final ReitTaxResult _self;
  final $Res Function(ReitTaxResult) _then;

/// Create a copy of ReitTaxResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reitDividends = null,Object? reitIncomeTax = null,Object? reitSocialCharges = null,Object? reitTotalTax = null,Object? reitNetAfterTax = null,Object? effectiveTaxRate = null,Object? tmi = null,}) {
  return _then(_self.copyWith(
reitDividends: null == reitDividends ? _self.reitDividends : reitDividends // ignore: cast_nullable_to_non_nullable
as double,reitIncomeTax: null == reitIncomeTax ? _self.reitIncomeTax : reitIncomeTax // ignore: cast_nullable_to_non_nullable
as double,reitSocialCharges: null == reitSocialCharges ? _self.reitSocialCharges : reitSocialCharges // ignore: cast_nullable_to_non_nullable
as double,reitTotalTax: null == reitTotalTax ? _self.reitTotalTax : reitTotalTax // ignore: cast_nullable_to_non_nullable
as double,reitNetAfterTax: null == reitNetAfterTax ? _self.reitNetAfterTax : reitNetAfterTax // ignore: cast_nullable_to_non_nullable
as double,effectiveTaxRate: null == effectiveTaxRate ? _self.effectiveTaxRate : effectiveTaxRate // ignore: cast_nullable_to_non_nullable
as double,tmi: null == tmi ? _self.tmi : tmi // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ReitTaxResult].
extension ReitTaxResultPatterns on ReitTaxResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReitTaxResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReitTaxResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReitTaxResult value)  $default,){
final _that = this;
switch (_that) {
case _ReitTaxResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReitTaxResult value)?  $default,){
final _that = this;
switch (_that) {
case _ReitTaxResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double reitDividends,  double reitIncomeTax,  double reitSocialCharges,  double reitTotalTax,  double reitNetAfterTax,  double effectiveTaxRate,  double tmi)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReitTaxResult() when $default != null:
return $default(_that.reitDividends,_that.reitIncomeTax,_that.reitSocialCharges,_that.reitTotalTax,_that.reitNetAfterTax,_that.effectiveTaxRate,_that.tmi);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double reitDividends,  double reitIncomeTax,  double reitSocialCharges,  double reitTotalTax,  double reitNetAfterTax,  double effectiveTaxRate,  double tmi)  $default,) {final _that = this;
switch (_that) {
case _ReitTaxResult():
return $default(_that.reitDividends,_that.reitIncomeTax,_that.reitSocialCharges,_that.reitTotalTax,_that.reitNetAfterTax,_that.effectiveTaxRate,_that.tmi);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double reitDividends,  double reitIncomeTax,  double reitSocialCharges,  double reitTotalTax,  double reitNetAfterTax,  double effectiveTaxRate,  double tmi)?  $default,) {final _that = this;
switch (_that) {
case _ReitTaxResult() when $default != null:
return $default(_that.reitDividends,_that.reitIncomeTax,_that.reitSocialCharges,_that.reitTotalTax,_that.reitNetAfterTax,_that.effectiveTaxRate,_that.tmi);case _:
  return null;

}
}

}

/// @nodoc


class _ReitTaxResult implements ReitTaxResult {
  const _ReitTaxResult({required this.reitDividends, required this.reitIncomeTax, required this.reitSocialCharges, required this.reitTotalTax, required this.reitNetAfterTax, required this.effectiveTaxRate, required this.tmi});
  

@override final  double reitDividends;
@override final  double reitIncomeTax;
@override final  double reitSocialCharges;
@override final  double reitTotalTax;
@override final  double reitNetAfterTax;
@override final  double effectiveTaxRate;
@override final  double tmi;

/// Create a copy of ReitTaxResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReitTaxResultCopyWith<_ReitTaxResult> get copyWith => __$ReitTaxResultCopyWithImpl<_ReitTaxResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReitTaxResult&&(identical(other.reitDividends, reitDividends) || other.reitDividends == reitDividends)&&(identical(other.reitIncomeTax, reitIncomeTax) || other.reitIncomeTax == reitIncomeTax)&&(identical(other.reitSocialCharges, reitSocialCharges) || other.reitSocialCharges == reitSocialCharges)&&(identical(other.reitTotalTax, reitTotalTax) || other.reitTotalTax == reitTotalTax)&&(identical(other.reitNetAfterTax, reitNetAfterTax) || other.reitNetAfterTax == reitNetAfterTax)&&(identical(other.effectiveTaxRate, effectiveTaxRate) || other.effectiveTaxRate == effectiveTaxRate)&&(identical(other.tmi, tmi) || other.tmi == tmi));
}


@override
int get hashCode => Object.hash(runtimeType,reitDividends,reitIncomeTax,reitSocialCharges,reitTotalTax,reitNetAfterTax,effectiveTaxRate,tmi);

@override
String toString() {
  return 'ReitTaxResult(reitDividends: $reitDividends, reitIncomeTax: $reitIncomeTax, reitSocialCharges: $reitSocialCharges, reitTotalTax: $reitTotalTax, reitNetAfterTax: $reitNetAfterTax, effectiveTaxRate: $effectiveTaxRate, tmi: $tmi)';
}


}

/// @nodoc
abstract mixin class _$ReitTaxResultCopyWith<$Res> implements $ReitTaxResultCopyWith<$Res> {
  factory _$ReitTaxResultCopyWith(_ReitTaxResult value, $Res Function(_ReitTaxResult) _then) = __$ReitTaxResultCopyWithImpl;
@override @useResult
$Res call({
 double reitDividends, double reitIncomeTax, double reitSocialCharges, double reitTotalTax, double reitNetAfterTax, double effectiveTaxRate, double tmi
});




}
/// @nodoc
class __$ReitTaxResultCopyWithImpl<$Res>
    implements _$ReitTaxResultCopyWith<$Res> {
  __$ReitTaxResultCopyWithImpl(this._self, this._then);

  final _ReitTaxResult _self;
  final $Res Function(_ReitTaxResult) _then;

/// Create a copy of ReitTaxResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reitDividends = null,Object? reitIncomeTax = null,Object? reitSocialCharges = null,Object? reitTotalTax = null,Object? reitNetAfterTax = null,Object? effectiveTaxRate = null,Object? tmi = null,}) {
  return _then(_ReitTaxResult(
reitDividends: null == reitDividends ? _self.reitDividends : reitDividends // ignore: cast_nullable_to_non_nullable
as double,reitIncomeTax: null == reitIncomeTax ? _self.reitIncomeTax : reitIncomeTax // ignore: cast_nullable_to_non_nullable
as double,reitSocialCharges: null == reitSocialCharges ? _self.reitSocialCharges : reitSocialCharges // ignore: cast_nullable_to_non_nullable
as double,reitTotalTax: null == reitTotalTax ? _self.reitTotalTax : reitTotalTax // ignore: cast_nullable_to_non_nullable
as double,reitNetAfterTax: null == reitNetAfterTax ? _self.reitNetAfterTax : reitNetAfterTax // ignore: cast_nullable_to_non_nullable
as double,effectiveTaxRate: null == effectiveTaxRate ? _self.effectiveTaxRate : effectiveTaxRate // ignore: cast_nullable_to_non_nullable
as double,tmi: null == tmi ? _self.tmi : tmi // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

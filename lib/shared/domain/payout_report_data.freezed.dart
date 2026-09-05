// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payout_report_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PayoutReportData {

 double get totalNetProfit; double get totalTaxProfit; double get totalLoss; double get finalAmount;
/// Create a copy of PayoutReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PayoutReportDataCopyWith<PayoutReportData> get copyWith => _$PayoutReportDataCopyWithImpl<PayoutReportData>(this as PayoutReportData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PayoutReportData&&(identical(other.totalNetProfit, totalNetProfit) || other.totalNetProfit == totalNetProfit)&&(identical(other.totalTaxProfit, totalTaxProfit) || other.totalTaxProfit == totalTaxProfit)&&(identical(other.totalLoss, totalLoss) || other.totalLoss == totalLoss)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,totalNetProfit,totalTaxProfit,totalLoss,finalAmount);

@override
String toString() {
  return 'PayoutReportData(totalNetProfit: $totalNetProfit, totalTaxProfit: $totalTaxProfit, totalLoss: $totalLoss, finalAmount: $finalAmount)';
}


}

/// @nodoc
abstract mixin class $PayoutReportDataCopyWith<$Res>  {
  factory $PayoutReportDataCopyWith(PayoutReportData value, $Res Function(PayoutReportData) _then) = _$PayoutReportDataCopyWithImpl;
@useResult
$Res call({
 double totalNetProfit, double totalTaxProfit, double totalLoss, double finalAmount
});




}
/// @nodoc
class _$PayoutReportDataCopyWithImpl<$Res>
    implements $PayoutReportDataCopyWith<$Res> {
  _$PayoutReportDataCopyWithImpl(this._self, this._then);

  final PayoutReportData _self;
  final $Res Function(PayoutReportData) _then;

/// Create a copy of PayoutReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalNetProfit = null,Object? totalTaxProfit = null,Object? totalLoss = null,Object? finalAmount = null,}) {
  return _then(_self.copyWith(
totalNetProfit: null == totalNetProfit ? _self.totalNetProfit : totalNetProfit // ignore: cast_nullable_to_non_nullable
as double,totalTaxProfit: null == totalTaxProfit ? _self.totalTaxProfit : totalTaxProfit // ignore: cast_nullable_to_non_nullable
as double,totalLoss: null == totalLoss ? _self.totalLoss : totalLoss // ignore: cast_nullable_to_non_nullable
as double,finalAmount: null == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PayoutReportData].
extension PayoutReportDataPatterns on PayoutReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PayoutReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PayoutReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PayoutReportData value)  $default,){
final _that = this;
switch (_that) {
case _PayoutReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PayoutReportData value)?  $default,){
final _that = this;
switch (_that) {
case _PayoutReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalNetProfit,  double totalTaxProfit,  double totalLoss,  double finalAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PayoutReportData() when $default != null:
return $default(_that.totalNetProfit,_that.totalTaxProfit,_that.totalLoss,_that.finalAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalNetProfit,  double totalTaxProfit,  double totalLoss,  double finalAmount)  $default,) {final _that = this;
switch (_that) {
case _PayoutReportData():
return $default(_that.totalNetProfit,_that.totalTaxProfit,_that.totalLoss,_that.finalAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalNetProfit,  double totalTaxProfit,  double totalLoss,  double finalAmount)?  $default,) {final _that = this;
switch (_that) {
case _PayoutReportData() when $default != null:
return $default(_that.totalNetProfit,_that.totalTaxProfit,_that.totalLoss,_that.finalAmount);case _:
  return null;

}
}

}

/// @nodoc


class _PayoutReportData implements PayoutReportData {
  const _PayoutReportData({this.totalNetProfit = 0.0, this.totalTaxProfit = 0.0, this.totalLoss = 0.0, this.finalAmount = 0.0});
  

@override@JsonKey() final  double totalNetProfit;
@override@JsonKey() final  double totalTaxProfit;
@override@JsonKey() final  double totalLoss;
@override@JsonKey() final  double finalAmount;

/// Create a copy of PayoutReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PayoutReportDataCopyWith<_PayoutReportData> get copyWith => __$PayoutReportDataCopyWithImpl<_PayoutReportData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PayoutReportData&&(identical(other.totalNetProfit, totalNetProfit) || other.totalNetProfit == totalNetProfit)&&(identical(other.totalTaxProfit, totalTaxProfit) || other.totalTaxProfit == totalTaxProfit)&&(identical(other.totalLoss, totalLoss) || other.totalLoss == totalLoss)&&(identical(other.finalAmount, finalAmount) || other.finalAmount == finalAmount));
}


@override
int get hashCode => Object.hash(runtimeType,totalNetProfit,totalTaxProfit,totalLoss,finalAmount);

@override
String toString() {
  return 'PayoutReportData(totalNetProfit: $totalNetProfit, totalTaxProfit: $totalTaxProfit, totalLoss: $totalLoss, finalAmount: $finalAmount)';
}


}

/// @nodoc
abstract mixin class _$PayoutReportDataCopyWith<$Res> implements $PayoutReportDataCopyWith<$Res> {
  factory _$PayoutReportDataCopyWith(_PayoutReportData value, $Res Function(_PayoutReportData) _then) = __$PayoutReportDataCopyWithImpl;
@override @useResult
$Res call({
 double totalNetProfit, double totalTaxProfit, double totalLoss, double finalAmount
});




}
/// @nodoc
class __$PayoutReportDataCopyWithImpl<$Res>
    implements _$PayoutReportDataCopyWith<$Res> {
  __$PayoutReportDataCopyWithImpl(this._self, this._then);

  final _PayoutReportData _self;
  final $Res Function(_PayoutReportData) _then;

/// Create a copy of PayoutReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalNetProfit = null,Object? totalTaxProfit = null,Object? totalLoss = null,Object? finalAmount = null,}) {
  return _then(_PayoutReportData(
totalNetProfit: null == totalNetProfit ? _self.totalNetProfit : totalNetProfit // ignore: cast_nullable_to_non_nullable
as double,totalTaxProfit: null == totalTaxProfit ? _self.totalTaxProfit : totalTaxProfit // ignore: cast_nullable_to_non_nullable
as double,totalLoss: null == totalLoss ? _self.totalLoss : totalLoss // ignore: cast_nullable_to_non_nullable
as double,finalAmount: null == finalAmount ? _self.finalAmount : finalAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freelance_calculator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FreelanceResult {

 double get annualRevenue; double get abatement; double get netImposable; double get urssaf; double get incomeTax; double get totalCharges; double get netAfterAll;
/// Create a copy of FreelanceResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FreelanceResultCopyWith<FreelanceResult> get copyWith => _$FreelanceResultCopyWithImpl<FreelanceResult>(this as FreelanceResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FreelanceResult&&(identical(other.annualRevenue, annualRevenue) || other.annualRevenue == annualRevenue)&&(identical(other.abatement, abatement) || other.abatement == abatement)&&(identical(other.netImposable, netImposable) || other.netImposable == netImposable)&&(identical(other.urssaf, urssaf) || other.urssaf == urssaf)&&(identical(other.incomeTax, incomeTax) || other.incomeTax == incomeTax)&&(identical(other.totalCharges, totalCharges) || other.totalCharges == totalCharges)&&(identical(other.netAfterAll, netAfterAll) || other.netAfterAll == netAfterAll));
}


@override
int get hashCode => Object.hash(runtimeType,annualRevenue,abatement,netImposable,urssaf,incomeTax,totalCharges,netAfterAll);

@override
String toString() {
  return 'FreelanceResult(annualRevenue: $annualRevenue, abatement: $abatement, netImposable: $netImposable, urssaf: $urssaf, incomeTax: $incomeTax, totalCharges: $totalCharges, netAfterAll: $netAfterAll)';
}


}

/// @nodoc
abstract mixin class $FreelanceResultCopyWith<$Res>  {
  factory $FreelanceResultCopyWith(FreelanceResult value, $Res Function(FreelanceResult) _then) = _$FreelanceResultCopyWithImpl;
@useResult
$Res call({
 double annualRevenue, double abatement, double netImposable, double urssaf, double incomeTax, double totalCharges, double netAfterAll
});




}
/// @nodoc
class _$FreelanceResultCopyWithImpl<$Res>
    implements $FreelanceResultCopyWith<$Res> {
  _$FreelanceResultCopyWithImpl(this._self, this._then);

  final FreelanceResult _self;
  final $Res Function(FreelanceResult) _then;

/// Create a copy of FreelanceResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? annualRevenue = null,Object? abatement = null,Object? netImposable = null,Object? urssaf = null,Object? incomeTax = null,Object? totalCharges = null,Object? netAfterAll = null,}) {
  return _then(_self.copyWith(
annualRevenue: null == annualRevenue ? _self.annualRevenue : annualRevenue // ignore: cast_nullable_to_non_nullable
as double,abatement: null == abatement ? _self.abatement : abatement // ignore: cast_nullable_to_non_nullable
as double,netImposable: null == netImposable ? _self.netImposable : netImposable // ignore: cast_nullable_to_non_nullable
as double,urssaf: null == urssaf ? _self.urssaf : urssaf // ignore: cast_nullable_to_non_nullable
as double,incomeTax: null == incomeTax ? _self.incomeTax : incomeTax // ignore: cast_nullable_to_non_nullable
as double,totalCharges: null == totalCharges ? _self.totalCharges : totalCharges // ignore: cast_nullable_to_non_nullable
as double,netAfterAll: null == netAfterAll ? _self.netAfterAll : netAfterAll // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [FreelanceResult].
extension FreelanceResultPatterns on FreelanceResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FreelanceResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FreelanceResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FreelanceResult value)  $default,){
final _that = this;
switch (_that) {
case _FreelanceResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FreelanceResult value)?  $default,){
final _that = this;
switch (_that) {
case _FreelanceResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double annualRevenue,  double abatement,  double netImposable,  double urssaf,  double incomeTax,  double totalCharges,  double netAfterAll)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FreelanceResult() when $default != null:
return $default(_that.annualRevenue,_that.abatement,_that.netImposable,_that.urssaf,_that.incomeTax,_that.totalCharges,_that.netAfterAll);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double annualRevenue,  double abatement,  double netImposable,  double urssaf,  double incomeTax,  double totalCharges,  double netAfterAll)  $default,) {final _that = this;
switch (_that) {
case _FreelanceResult():
return $default(_that.annualRevenue,_that.abatement,_that.netImposable,_that.urssaf,_that.incomeTax,_that.totalCharges,_that.netAfterAll);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double annualRevenue,  double abatement,  double netImposable,  double urssaf,  double incomeTax,  double totalCharges,  double netAfterAll)?  $default,) {final _that = this;
switch (_that) {
case _FreelanceResult() when $default != null:
return $default(_that.annualRevenue,_that.abatement,_that.netImposable,_that.urssaf,_that.incomeTax,_that.totalCharges,_that.netAfterAll);case _:
  return null;

}
}

}

/// @nodoc


class _FreelanceResult implements FreelanceResult {
  const _FreelanceResult({required this.annualRevenue, required this.abatement, required this.netImposable, required this.urssaf, required this.incomeTax, required this.totalCharges, required this.netAfterAll});
  

@override final  double annualRevenue;
@override final  double abatement;
@override final  double netImposable;
@override final  double urssaf;
@override final  double incomeTax;
@override final  double totalCharges;
@override final  double netAfterAll;

/// Create a copy of FreelanceResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FreelanceResultCopyWith<_FreelanceResult> get copyWith => __$FreelanceResultCopyWithImpl<_FreelanceResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FreelanceResult&&(identical(other.annualRevenue, annualRevenue) || other.annualRevenue == annualRevenue)&&(identical(other.abatement, abatement) || other.abatement == abatement)&&(identical(other.netImposable, netImposable) || other.netImposable == netImposable)&&(identical(other.urssaf, urssaf) || other.urssaf == urssaf)&&(identical(other.incomeTax, incomeTax) || other.incomeTax == incomeTax)&&(identical(other.totalCharges, totalCharges) || other.totalCharges == totalCharges)&&(identical(other.netAfterAll, netAfterAll) || other.netAfterAll == netAfterAll));
}


@override
int get hashCode => Object.hash(runtimeType,annualRevenue,abatement,netImposable,urssaf,incomeTax,totalCharges,netAfterAll);

@override
String toString() {
  return 'FreelanceResult(annualRevenue: $annualRevenue, abatement: $abatement, netImposable: $netImposable, urssaf: $urssaf, incomeTax: $incomeTax, totalCharges: $totalCharges, netAfterAll: $netAfterAll)';
}


}

/// @nodoc
abstract mixin class _$FreelanceResultCopyWith<$Res> implements $FreelanceResultCopyWith<$Res> {
  factory _$FreelanceResultCopyWith(_FreelanceResult value, $Res Function(_FreelanceResult) _then) = __$FreelanceResultCopyWithImpl;
@override @useResult
$Res call({
 double annualRevenue, double abatement, double netImposable, double urssaf, double incomeTax, double totalCharges, double netAfterAll
});




}
/// @nodoc
class __$FreelanceResultCopyWithImpl<$Res>
    implements _$FreelanceResultCopyWith<$Res> {
  __$FreelanceResultCopyWithImpl(this._self, this._then);

  final _FreelanceResult _self;
  final $Res Function(_FreelanceResult) _then;

/// Create a copy of FreelanceResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? annualRevenue = null,Object? abatement = null,Object? netImposable = null,Object? urssaf = null,Object? incomeTax = null,Object? totalCharges = null,Object? netAfterAll = null,}) {
  return _then(_FreelanceResult(
annualRevenue: null == annualRevenue ? _self.annualRevenue : annualRevenue // ignore: cast_nullable_to_non_nullable
as double,abatement: null == abatement ? _self.abatement : abatement // ignore: cast_nullable_to_non_nullable
as double,netImposable: null == netImposable ? _self.netImposable : netImposable // ignore: cast_nullable_to_non_nullable
as double,urssaf: null == urssaf ? _self.urssaf : urssaf // ignore: cast_nullable_to_non_nullable
as double,incomeTax: null == incomeTax ? _self.incomeTax : incomeTax // ignore: cast_nullable_to_non_nullable
as double,totalCharges: null == totalCharges ? _self.totalCharges : totalCharges // ignore: cast_nullable_to_non_nullable
as double,netAfterAll: null == netAfterAll ? _self.netAfterAll : netAfterAll // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

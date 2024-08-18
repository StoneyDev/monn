// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payout_report_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PayoutReportData {
  double get totalNetProfit => throw _privateConstructorUsedError;
  double get totalTaxProfit => throw _privateConstructorUsedError;
  double get totalLoss => throw _privateConstructorUsedError;
  double get finalAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PayoutReportDataCopyWith<PayoutReportData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayoutReportDataCopyWith<$Res> {
  factory $PayoutReportDataCopyWith(
          PayoutReportData value, $Res Function(PayoutReportData) then) =
      _$PayoutReportDataCopyWithImpl<$Res, PayoutReportData>;
  @useResult
  $Res call(
      {double totalNetProfit,
      double totalTaxProfit,
      double totalLoss,
      double finalAmount});
}

/// @nodoc
class _$PayoutReportDataCopyWithImpl<$Res, $Val extends PayoutReportData>
    implements $PayoutReportDataCopyWith<$Res> {
  _$PayoutReportDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalNetProfit = null,
    Object? totalTaxProfit = null,
    Object? totalLoss = null,
    Object? finalAmount = null,
  }) {
    return _then(_value.copyWith(
      totalNetProfit: null == totalNetProfit
          ? _value.totalNetProfit
          : totalNetProfit // ignore: cast_nullable_to_non_nullable
              as double,
      totalTaxProfit: null == totalTaxProfit
          ? _value.totalTaxProfit
          : totalTaxProfit // ignore: cast_nullable_to_non_nullable
              as double,
      totalLoss: null == totalLoss
          ? _value.totalLoss
          : totalLoss // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayoutReportDataImplCopyWith<$Res>
    implements $PayoutReportDataCopyWith<$Res> {
  factory _$$PayoutReportDataImplCopyWith(_$PayoutReportDataImpl value,
          $Res Function(_$PayoutReportDataImpl) then) =
      __$$PayoutReportDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalNetProfit,
      double totalTaxProfit,
      double totalLoss,
      double finalAmount});
}

/// @nodoc
class __$$PayoutReportDataImplCopyWithImpl<$Res>
    extends _$PayoutReportDataCopyWithImpl<$Res, _$PayoutReportDataImpl>
    implements _$$PayoutReportDataImplCopyWith<$Res> {
  __$$PayoutReportDataImplCopyWithImpl(_$PayoutReportDataImpl _value,
      $Res Function(_$PayoutReportDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalNetProfit = null,
    Object? totalTaxProfit = null,
    Object? totalLoss = null,
    Object? finalAmount = null,
  }) {
    return _then(_$PayoutReportDataImpl(
      totalNetProfit: null == totalNetProfit
          ? _value.totalNetProfit
          : totalNetProfit // ignore: cast_nullable_to_non_nullable
              as double,
      totalTaxProfit: null == totalTaxProfit
          ? _value.totalTaxProfit
          : totalTaxProfit // ignore: cast_nullable_to_non_nullable
              as double,
      totalLoss: null == totalLoss
          ? _value.totalLoss
          : totalLoss // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PayoutReportDataImpl implements _PayoutReportData {
  const _$PayoutReportDataImpl(
      {this.totalNetProfit = 0.0,
      this.totalTaxProfit = 0.0,
      this.totalLoss = 0.0,
      this.finalAmount = 0.0});

  @override
  @JsonKey()
  final double totalNetProfit;
  @override
  @JsonKey()
  final double totalTaxProfit;
  @override
  @JsonKey()
  final double totalLoss;
  @override
  @JsonKey()
  final double finalAmount;

  @override
  String toString() {
    return 'PayoutReportData(totalNetProfit: $totalNetProfit, totalTaxProfit: $totalTaxProfit, totalLoss: $totalLoss, finalAmount: $finalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayoutReportDataImpl &&
            (identical(other.totalNetProfit, totalNetProfit) ||
                other.totalNetProfit == totalNetProfit) &&
            (identical(other.totalTaxProfit, totalTaxProfit) ||
                other.totalTaxProfit == totalTaxProfit) &&
            (identical(other.totalLoss, totalLoss) ||
                other.totalLoss == totalLoss) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, totalNetProfit, totalTaxProfit, totalLoss, finalAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayoutReportDataImplCopyWith<_$PayoutReportDataImpl> get copyWith =>
      __$$PayoutReportDataImplCopyWithImpl<_$PayoutReportDataImpl>(
          this, _$identity);
}

abstract class _PayoutReportData implements PayoutReportData {
  const factory _PayoutReportData(
      {final double totalNetProfit,
      final double totalTaxProfit,
      final double totalLoss,
      final double finalAmount}) = _$PayoutReportDataImpl;

  @override
  double get totalNetProfit;
  @override
  double get totalTaxProfit;
  @override
  double get totalLoss;
  @override
  double get finalAmount;
  @override
  @JsonKey(ignore: true)
  _$$PayoutReportDataImplCopyWith<_$PayoutReportDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

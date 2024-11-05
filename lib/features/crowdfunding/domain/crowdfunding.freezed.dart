// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crowdfunding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Crowdfunding {
  double get netProfit => throw _privateConstructorUsedError;
  double get brutProfit => throw _privateConstructorUsedError;
  double get taxProfit => throw _privateConstructorUsedError;
  double get taxPercentage => throw _privateConstructorUsedError;
  String get platformName => throw _privateConstructorUsedError;
  DateTime? get receivedAt => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CrowdfundingCopyWith<Crowdfunding> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrowdfundingCopyWith<$Res> {
  factory $CrowdfundingCopyWith(
          Crowdfunding value, $Res Function(Crowdfunding) then) =
      _$CrowdfundingCopyWithImpl<$Res, Crowdfunding>;
  @useResult
  $Res call(
      {double netProfit,
      double brutProfit,
      double taxProfit,
      double taxPercentage,
      String platformName,
      DateTime? receivedAt,
      int id});
}

/// @nodoc
class _$CrowdfundingCopyWithImpl<$Res, $Val extends Crowdfunding>
    implements $CrowdfundingCopyWith<$Res> {
  _$CrowdfundingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? netProfit = null,
    Object? brutProfit = null,
    Object? taxProfit = null,
    Object? taxPercentage = null,
    Object? platformName = null,
    Object? receivedAt = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      netProfit: null == netProfit
          ? _value.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double,
      brutProfit: null == brutProfit
          ? _value.brutProfit
          : brutProfit // ignore: cast_nullable_to_non_nullable
              as double,
      taxProfit: null == taxProfit
          ? _value.taxProfit
          : taxProfit // ignore: cast_nullable_to_non_nullable
              as double,
      taxPercentage: null == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      platformName: null == platformName
          ? _value.platformName
          : platformName // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrowdfundingImplCopyWith<$Res>
    implements $CrowdfundingCopyWith<$Res> {
  factory _$$CrowdfundingImplCopyWith(
          _$CrowdfundingImpl value, $Res Function(_$CrowdfundingImpl) then) =
      __$$CrowdfundingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double netProfit,
      double brutProfit,
      double taxProfit,
      double taxPercentage,
      String platformName,
      DateTime? receivedAt,
      int id});
}

/// @nodoc
class __$$CrowdfundingImplCopyWithImpl<$Res>
    extends _$CrowdfundingCopyWithImpl<$Res, _$CrowdfundingImpl>
    implements _$$CrowdfundingImplCopyWith<$Res> {
  __$$CrowdfundingImplCopyWithImpl(
      _$CrowdfundingImpl _value, $Res Function(_$CrowdfundingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? netProfit = null,
    Object? brutProfit = null,
    Object? taxProfit = null,
    Object? taxPercentage = null,
    Object? platformName = null,
    Object? receivedAt = freezed,
    Object? id = null,
  }) {
    return _then(_$CrowdfundingImpl(
      netProfit: null == netProfit
          ? _value.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double,
      brutProfit: null == brutProfit
          ? _value.brutProfit
          : brutProfit // ignore: cast_nullable_to_non_nullable
              as double,
      taxProfit: null == taxProfit
          ? _value.taxProfit
          : taxProfit // ignore: cast_nullable_to_non_nullable
              as double,
      taxPercentage: null == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      platformName: null == platformName
          ? _value.platformName
          : platformName // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CrowdfundingImpl implements _Crowdfunding {
  const _$CrowdfundingImpl(
      {this.netProfit = 0.0,
      this.brutProfit = 0.0,
      this.taxProfit = 0.0,
      this.taxPercentage = 0.0,
      this.platformName = 'Inconnue',
      this.receivedAt,
      this.id = Isar.autoIncrement});

  @override
  @JsonKey()
  final double netProfit;
  @override
  @JsonKey()
  final double brutProfit;
  @override
  @JsonKey()
  final double taxProfit;
  @override
  @JsonKey()
  final double taxPercentage;
  @override
  @JsonKey()
  final String platformName;
  @override
  final DateTime? receivedAt;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'Crowdfunding(netProfit: $netProfit, brutProfit: $brutProfit, taxProfit: $taxProfit, taxPercentage: $taxPercentage, platformName: $platformName, receivedAt: $receivedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrowdfundingImpl &&
            (identical(other.netProfit, netProfit) ||
                other.netProfit == netProfit) &&
            (identical(other.brutProfit, brutProfit) ||
                other.brutProfit == brutProfit) &&
            (identical(other.taxProfit, taxProfit) ||
                other.taxProfit == taxProfit) &&
            (identical(other.taxPercentage, taxPercentage) ||
                other.taxPercentage == taxPercentage) &&
            (identical(other.platformName, platformName) ||
                other.platformName == platformName) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, netProfit, brutProfit, taxProfit,
      taxPercentage, platformName, receivedAt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CrowdfundingImplCopyWith<_$CrowdfundingImpl> get copyWith =>
      __$$CrowdfundingImplCopyWithImpl<_$CrowdfundingImpl>(this, _$identity);
}

abstract class _Crowdfunding implements Crowdfunding {
  const factory _Crowdfunding(
      {final double netProfit,
      final double brutProfit,
      final double taxProfit,
      final double taxPercentage,
      final String platformName,
      final DateTime? receivedAt,
      final int id}) = _$CrowdfundingImpl;

  @override
  double get netProfit;
  @override
  double get brutProfit;
  @override
  double get taxProfit;
  @override
  double get taxPercentage;
  @override
  String get platformName;
  @override
  DateTime? get receivedAt;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$CrowdfundingImplCopyWith<_$CrowdfundingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

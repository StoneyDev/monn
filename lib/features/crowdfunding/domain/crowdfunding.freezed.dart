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
  double get brutProfit => throw _privateConstructorUsedError;
  String get platformName => throw _privateConstructorUsedError;
  double? get netProfit => throw _privateConstructorUsedError;
  double? get taxProfit => throw _privateConstructorUsedError;
  double? get taxPercentage => throw _privateConstructorUsedError;
  DateTime? get receivedAt => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of Crowdfunding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {double brutProfit,
      String platformName,
      double? netProfit,
      double? taxProfit,
      double? taxPercentage,
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

  /// Create a copy of Crowdfunding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brutProfit = null,
    Object? platformName = null,
    Object? netProfit = freezed,
    Object? taxProfit = freezed,
    Object? taxPercentage = freezed,
    Object? receivedAt = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      brutProfit: null == brutProfit
          ? _value.brutProfit
          : brutProfit // ignore: cast_nullable_to_non_nullable
              as double,
      platformName: null == platformName
          ? _value.platformName
          : platformName // ignore: cast_nullable_to_non_nullable
              as String,
      netProfit: freezed == netProfit
          ? _value.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double?,
      taxProfit: freezed == taxProfit
          ? _value.taxProfit
          : taxProfit // ignore: cast_nullable_to_non_nullable
              as double?,
      taxPercentage: freezed == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
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
      {double brutProfit,
      String platformName,
      double? netProfit,
      double? taxProfit,
      double? taxPercentage,
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

  /// Create a copy of Crowdfunding
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brutProfit = null,
    Object? platformName = null,
    Object? netProfit = freezed,
    Object? taxProfit = freezed,
    Object? taxPercentage = freezed,
    Object? receivedAt = freezed,
    Object? id = null,
  }) {
    return _then(_$CrowdfundingImpl(
      brutProfit: null == brutProfit
          ? _value.brutProfit
          : brutProfit // ignore: cast_nullable_to_non_nullable
              as double,
      platformName: null == platformName
          ? _value.platformName
          : platformName // ignore: cast_nullable_to_non_nullable
              as String,
      netProfit: freezed == netProfit
          ? _value.netProfit
          : netProfit // ignore: cast_nullable_to_non_nullable
              as double?,
      taxProfit: freezed == taxProfit
          ? _value.taxProfit
          : taxProfit // ignore: cast_nullable_to_non_nullable
              as double?,
      taxPercentage: freezed == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as double?,
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
      {required this.brutProfit,
      required this.platformName,
      this.netProfit,
      this.taxProfit,
      this.taxPercentage,
      this.receivedAt,
      this.id = Isar.autoIncrement});

  @override
  final double brutProfit;
  @override
  final String platformName;
  @override
  final double? netProfit;
  @override
  final double? taxProfit;
  @override
  final double? taxPercentage;
  @override
  final DateTime? receivedAt;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'Crowdfunding(brutProfit: $brutProfit, platformName: $platformName, netProfit: $netProfit, taxProfit: $taxProfit, taxPercentage: $taxPercentage, receivedAt: $receivedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrowdfundingImpl &&
            (identical(other.brutProfit, brutProfit) ||
                other.brutProfit == brutProfit) &&
            (identical(other.platformName, platformName) ||
                other.platformName == platformName) &&
            (identical(other.netProfit, netProfit) ||
                other.netProfit == netProfit) &&
            (identical(other.taxProfit, taxProfit) ||
                other.taxProfit == taxProfit) &&
            (identical(other.taxPercentage, taxPercentage) ||
                other.taxPercentage == taxPercentage) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brutProfit, platformName,
      netProfit, taxProfit, taxPercentage, receivedAt, id);

  /// Create a copy of Crowdfunding
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrowdfundingImplCopyWith<_$CrowdfundingImpl> get copyWith =>
      __$$CrowdfundingImplCopyWithImpl<_$CrowdfundingImpl>(this, _$identity);
}

abstract class _Crowdfunding implements Crowdfunding {
  const factory _Crowdfunding(
      {required final double brutProfit,
      required final String platformName,
      final double? netProfit,
      final double? taxProfit,
      final double? taxPercentage,
      final DateTime? receivedAt,
      final int id}) = _$CrowdfundingImpl;

  @override
  double get brutProfit;
  @override
  String get platformName;
  @override
  double? get netProfit;
  @override
  double? get taxProfit;
  @override
  double? get taxPercentage;
  @override
  DateTime? get receivedAt;
  @override
  int get id;

  /// Create a copy of Crowdfunding
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrowdfundingImplCopyWith<_$CrowdfundingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

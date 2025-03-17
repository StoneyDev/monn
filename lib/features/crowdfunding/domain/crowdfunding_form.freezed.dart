// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crowdfunding_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CrowdfundingForm {
  String get platformName => throw _privateConstructorUsedError;
  DateTime get receivedAt => throw _privateConstructorUsedError;
  String get brutProfit => throw _privateConstructorUsedError;
  String? get taxPercentage => throw _privateConstructorUsedError;

  /// Create a copy of CrowdfundingForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CrowdfundingFormCopyWith<CrowdfundingForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrowdfundingFormCopyWith<$Res> {
  factory $CrowdfundingFormCopyWith(
          CrowdfundingForm value, $Res Function(CrowdfundingForm) then) =
      _$CrowdfundingFormCopyWithImpl<$Res, CrowdfundingForm>;
  @useResult
  $Res call(
      {String platformName,
      DateTime receivedAt,
      String brutProfit,
      String? taxPercentage});
}

/// @nodoc
class _$CrowdfundingFormCopyWithImpl<$Res, $Val extends CrowdfundingForm>
    implements $CrowdfundingFormCopyWith<$Res> {
  _$CrowdfundingFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CrowdfundingForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platformName = null,
    Object? receivedAt = null,
    Object? brutProfit = null,
    Object? taxPercentage = freezed,
  }) {
    return _then(_value.copyWith(
      platformName: null == platformName
          ? _value.platformName
          : platformName // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      brutProfit: null == brutProfit
          ? _value.brutProfit
          : brutProfit // ignore: cast_nullable_to_non_nullable
              as String,
      taxPercentage: freezed == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrowdfundingFormImplCopyWith<$Res>
    implements $CrowdfundingFormCopyWith<$Res> {
  factory _$$CrowdfundingFormImplCopyWith(_$CrowdfundingFormImpl value,
          $Res Function(_$CrowdfundingFormImpl) then) =
      __$$CrowdfundingFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String platformName,
      DateTime receivedAt,
      String brutProfit,
      String? taxPercentage});
}

/// @nodoc
class __$$CrowdfundingFormImplCopyWithImpl<$Res>
    extends _$CrowdfundingFormCopyWithImpl<$Res, _$CrowdfundingFormImpl>
    implements _$$CrowdfundingFormImplCopyWith<$Res> {
  __$$CrowdfundingFormImplCopyWithImpl(_$CrowdfundingFormImpl _value,
      $Res Function(_$CrowdfundingFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of CrowdfundingForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platformName = null,
    Object? receivedAt = null,
    Object? brutProfit = null,
    Object? taxPercentage = freezed,
  }) {
    return _then(_$CrowdfundingFormImpl(
      platformName: null == platformName
          ? _value.platformName
          : platformName // ignore: cast_nullable_to_non_nullable
              as String,
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      brutProfit: null == brutProfit
          ? _value.brutProfit
          : brutProfit // ignore: cast_nullable_to_non_nullable
              as String,
      taxPercentage: freezed == taxPercentage
          ? _value.taxPercentage
          : taxPercentage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CrowdfundingFormImpl implements _CrowdfundingForm {
  const _$CrowdfundingFormImpl(
      {required this.platformName,
      required this.receivedAt,
      required this.brutProfit,
      this.taxPercentage});

  @override
  final String platformName;
  @override
  final DateTime receivedAt;
  @override
  final String brutProfit;
  @override
  final String? taxPercentage;

  @override
  String toString() {
    return 'CrowdfundingForm(platformName: $platformName, receivedAt: $receivedAt, brutProfit: $brutProfit, taxPercentage: $taxPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrowdfundingFormImpl &&
            (identical(other.platformName, platformName) ||
                other.platformName == platformName) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.brutProfit, brutProfit) ||
                other.brutProfit == brutProfit) &&
            (identical(other.taxPercentage, taxPercentage) ||
                other.taxPercentage == taxPercentage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, platformName, receivedAt, brutProfit, taxPercentage);

  /// Create a copy of CrowdfundingForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrowdfundingFormImplCopyWith<_$CrowdfundingFormImpl> get copyWith =>
      __$$CrowdfundingFormImplCopyWithImpl<_$CrowdfundingFormImpl>(
          this, _$identity);
}

abstract class _CrowdfundingForm implements CrowdfundingForm {
  const factory _CrowdfundingForm(
      {required final String platformName,
      required final DateTime receivedAt,
      required final String brutProfit,
      final String? taxPercentage}) = _$CrowdfundingFormImpl;

  @override
  String get platformName;
  @override
  DateTime get receivedAt;
  @override
  String get brutProfit;
  @override
  String? get taxPercentage;

  /// Create a copy of CrowdfundingForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrowdfundingFormImplCopyWith<_$CrowdfundingFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

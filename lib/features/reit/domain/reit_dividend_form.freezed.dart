// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reit_dividend_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReitDividendForm {
  DateTime get receivedAt => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  Reit? get reit => throw _privateConstructorUsedError;

  /// Create a copy of ReitDividendForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReitDividendFormCopyWith<ReitDividendForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReitDividendFormCopyWith<$Res> {
  factory $ReitDividendFormCopyWith(
          ReitDividendForm value, $Res Function(ReitDividendForm) then) =
      _$ReitDividendFormCopyWithImpl<$Res, ReitDividendForm>;
  @useResult
  $Res call({DateTime receivedAt, String amount, Reit? reit});
}

/// @nodoc
class _$ReitDividendFormCopyWithImpl<$Res, $Val extends ReitDividendForm>
    implements $ReitDividendFormCopyWith<$Res> {
  _$ReitDividendFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReitDividendForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receivedAt = null,
    Object? amount = null,
    Object? reit = freezed,
  }) {
    return _then(_value.copyWith(
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      reit: freezed == reit
          ? _value.reit
          : reit // ignore: cast_nullable_to_non_nullable
              as Reit?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReitDividendFormImplCopyWith<$Res>
    implements $ReitDividendFormCopyWith<$Res> {
  factory _$$ReitDividendFormImplCopyWith(_$ReitDividendFormImpl value,
          $Res Function(_$ReitDividendFormImpl) then) =
      __$$ReitDividendFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime receivedAt, String amount, Reit? reit});
}

/// @nodoc
class __$$ReitDividendFormImplCopyWithImpl<$Res>
    extends _$ReitDividendFormCopyWithImpl<$Res, _$ReitDividendFormImpl>
    implements _$$ReitDividendFormImplCopyWith<$Res> {
  __$$ReitDividendFormImplCopyWithImpl(_$ReitDividendFormImpl _value,
      $Res Function(_$ReitDividendFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReitDividendForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? receivedAt = null,
    Object? amount = null,
    Object? reit = freezed,
  }) {
    return _then(_$ReitDividendFormImpl(
      receivedAt: null == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      reit: freezed == reit
          ? _value.reit
          : reit // ignore: cast_nullable_to_non_nullable
              as Reit?,
    ));
  }
}

/// @nodoc

class _$ReitDividendFormImpl implements _ReitDividendForm {
  const _$ReitDividendFormImpl(
      {required this.receivedAt, required this.amount, this.reit});

  @override
  final DateTime receivedAt;
  @override
  final String amount;
  @override
  final Reit? reit;

  @override
  String toString() {
    return 'ReitDividendForm(receivedAt: $receivedAt, amount: $amount, reit: $reit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReitDividendFormImpl &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.reit, reit) || other.reit == reit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, receivedAt, amount, reit);

  /// Create a copy of ReitDividendForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReitDividendFormImplCopyWith<_$ReitDividendFormImpl> get copyWith =>
      __$$ReitDividendFormImplCopyWithImpl<_$ReitDividendFormImpl>(
          this, _$identity);
}

abstract class _ReitDividendForm implements ReitDividendForm {
  const factory _ReitDividendForm(
      {required final DateTime receivedAt,
      required final String amount,
      final Reit? reit}) = _$ReitDividendFormImpl;

  @override
  DateTime get receivedAt;
  @override
  String get amount;
  @override
  Reit? get reit;

  /// Create a copy of ReitDividendForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReitDividendFormImplCopyWith<_$ReitDividendFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

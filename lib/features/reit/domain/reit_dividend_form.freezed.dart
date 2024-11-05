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
  Reit? get reit => throw _privateConstructorUsedError;
  DateTime? get receivedAt => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReitDividendFormCopyWith<ReitDividendForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReitDividendFormCopyWith<$Res> {
  factory $ReitDividendFormCopyWith(
          ReitDividendForm value, $Res Function(ReitDividendForm) then) =
      _$ReitDividendFormCopyWithImpl<$Res, ReitDividendForm>;
  @useResult
  $Res call({Reit? reit, DateTime? receivedAt, double? amount});
}

/// @nodoc
class _$ReitDividendFormCopyWithImpl<$Res, $Val extends ReitDividendForm>
    implements $ReitDividendFormCopyWith<$Res> {
  _$ReitDividendFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reit = freezed,
    Object? receivedAt = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      reit: freezed == reit
          ? _value.reit
          : reit // ignore: cast_nullable_to_non_nullable
              as Reit?,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
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
  $Res call({Reit? reit, DateTime? receivedAt, double? amount});
}

/// @nodoc
class __$$ReitDividendFormImplCopyWithImpl<$Res>
    extends _$ReitDividendFormCopyWithImpl<$Res, _$ReitDividendFormImpl>
    implements _$$ReitDividendFormImplCopyWith<$Res> {
  __$$ReitDividendFormImplCopyWithImpl(_$ReitDividendFormImpl _value,
      $Res Function(_$ReitDividendFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reit = freezed,
    Object? receivedAt = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$ReitDividendFormImpl(
      reit: freezed == reit
          ? _value.reit
          : reit // ignore: cast_nullable_to_non_nullable
              as Reit?,
      receivedAt: freezed == receivedAt
          ? _value.receivedAt
          : receivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$ReitDividendFormImpl implements _ReitDividendForm {
  const _$ReitDividendFormImpl({this.reit, this.receivedAt, this.amount});

  @override
  final Reit? reit;
  @override
  final DateTime? receivedAt;
  @override
  final double? amount;

  @override
  String toString() {
    return 'ReitDividendForm(reit: $reit, receivedAt: $receivedAt, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReitDividendFormImpl &&
            (identical(other.reit, reit) || other.reit == reit) &&
            (identical(other.receivedAt, receivedAt) ||
                other.receivedAt == receivedAt) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reit, receivedAt, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReitDividendFormImplCopyWith<_$ReitDividendFormImpl> get copyWith =>
      __$$ReitDividendFormImplCopyWithImpl<_$ReitDividendFormImpl>(
          this, _$identity);
}

abstract class _ReitDividendForm implements ReitDividendForm {
  const factory _ReitDividendForm(
      {final Reit? reit,
      final DateTime? receivedAt,
      final double? amount}) = _$ReitDividendFormImpl;

  @override
  Reit? get reit;
  @override
  DateTime? get receivedAt;
  @override
  double? get amount;
  @override
  @JsonKey(ignore: true)
  _$$ReitDividendFormImplCopyWith<_$ReitDividendFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

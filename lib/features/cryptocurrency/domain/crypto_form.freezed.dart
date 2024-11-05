// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CryptoForm {
  Cryptocurrency? get crypto => throw _privateConstructorUsedError;
  double? get fiat => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  DateTime? get boughtOn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CryptoFormCopyWith<CryptoForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoFormCopyWith<$Res> {
  factory $CryptoFormCopyWith(
          CryptoForm value, $Res Function(CryptoForm) then) =
      _$CryptoFormCopyWithImpl<$Res, CryptoForm>;
  @useResult
  $Res call(
      {Cryptocurrency? crypto,
      double? fiat,
      double? amount,
      DateTime? boughtOn});
}

/// @nodoc
class _$CryptoFormCopyWithImpl<$Res, $Val extends CryptoForm>
    implements $CryptoFormCopyWith<$Res> {
  _$CryptoFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crypto = freezed,
    Object? fiat = freezed,
    Object? amount = freezed,
    Object? boughtOn = freezed,
  }) {
    return _then(_value.copyWith(
      crypto: freezed == crypto
          ? _value.crypto
          : crypto // ignore: cast_nullable_to_non_nullable
              as Cryptocurrency?,
      fiat: freezed == fiat
          ? _value.fiat
          : fiat // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      boughtOn: freezed == boughtOn
          ? _value.boughtOn
          : boughtOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoFormImplCopyWith<$Res>
    implements $CryptoFormCopyWith<$Res> {
  factory _$$CryptoFormImplCopyWith(
          _$CryptoFormImpl value, $Res Function(_$CryptoFormImpl) then) =
      __$$CryptoFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Cryptocurrency? crypto,
      double? fiat,
      double? amount,
      DateTime? boughtOn});
}

/// @nodoc
class __$$CryptoFormImplCopyWithImpl<$Res>
    extends _$CryptoFormCopyWithImpl<$Res, _$CryptoFormImpl>
    implements _$$CryptoFormImplCopyWith<$Res> {
  __$$CryptoFormImplCopyWithImpl(
      _$CryptoFormImpl _value, $Res Function(_$CryptoFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? crypto = freezed,
    Object? fiat = freezed,
    Object? amount = freezed,
    Object? boughtOn = freezed,
  }) {
    return _then(_$CryptoFormImpl(
      crypto: freezed == crypto
          ? _value.crypto
          : crypto // ignore: cast_nullable_to_non_nullable
              as Cryptocurrency?,
      fiat: freezed == fiat
          ? _value.fiat
          : fiat // ignore: cast_nullable_to_non_nullable
              as double?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      boughtOn: freezed == boughtOn
          ? _value.boughtOn
          : boughtOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$CryptoFormImpl implements _CryptoForm {
  const _$CryptoFormImpl({this.crypto, this.fiat, this.amount, this.boughtOn});

  @override
  final Cryptocurrency? crypto;
  @override
  final double? fiat;
  @override
  final double? amount;
  @override
  final DateTime? boughtOn;

  @override
  String toString() {
    return 'CryptoForm(crypto: $crypto, fiat: $fiat, amount: $amount, boughtOn: $boughtOn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoFormImpl &&
            (identical(other.crypto, crypto) || other.crypto == crypto) &&
            (identical(other.fiat, fiat) || other.fiat == fiat) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.boughtOn, boughtOn) ||
                other.boughtOn == boughtOn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, crypto, fiat, amount, boughtOn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoFormImplCopyWith<_$CryptoFormImpl> get copyWith =>
      __$$CryptoFormImplCopyWithImpl<_$CryptoFormImpl>(this, _$identity);
}

abstract class _CryptoForm implements CryptoForm {
  const factory _CryptoForm(
      {final Cryptocurrency? crypto,
      final double? fiat,
      final double? amount,
      final DateTime? boughtOn}) = _$CryptoFormImpl;

  @override
  Cryptocurrency? get crypto;
  @override
  double? get fiat;
  @override
  double? get amount;
  @override
  DateTime? get boughtOn;
  @override
  @JsonKey(ignore: true)
  _$$CryptoFormImplCopyWith<_$CryptoFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

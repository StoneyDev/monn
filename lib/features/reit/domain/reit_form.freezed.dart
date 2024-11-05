// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reit_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReitForm {
  String? get reitName => throw _privateConstructorUsedError;
  DateTime? get boughtOn => throw _privateConstructorUsedError;
  double? get shares => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReitFormCopyWith<ReitForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReitFormCopyWith<$Res> {
  factory $ReitFormCopyWith(ReitForm value, $Res Function(ReitForm) then) =
      _$ReitFormCopyWithImpl<$Res, ReitForm>;
  @useResult
  $Res call(
      {String? reitName, DateTime? boughtOn, double? shares, double? price});
}

/// @nodoc
class _$ReitFormCopyWithImpl<$Res, $Val extends ReitForm>
    implements $ReitFormCopyWith<$Res> {
  _$ReitFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reitName = freezed,
    Object? boughtOn = freezed,
    Object? shares = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      reitName: freezed == reitName
          ? _value.reitName
          : reitName // ignore: cast_nullable_to_non_nullable
              as String?,
      boughtOn: freezed == boughtOn
          ? _value.boughtOn
          : boughtOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shares: freezed == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReitFormImplCopyWith<$Res>
    implements $ReitFormCopyWith<$Res> {
  factory _$$ReitFormImplCopyWith(
          _$ReitFormImpl value, $Res Function(_$ReitFormImpl) then) =
      __$$ReitFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? reitName, DateTime? boughtOn, double? shares, double? price});
}

/// @nodoc
class __$$ReitFormImplCopyWithImpl<$Res>
    extends _$ReitFormCopyWithImpl<$Res, _$ReitFormImpl>
    implements _$$ReitFormImplCopyWith<$Res> {
  __$$ReitFormImplCopyWithImpl(
      _$ReitFormImpl _value, $Res Function(_$ReitFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reitName = freezed,
    Object? boughtOn = freezed,
    Object? shares = freezed,
    Object? price = freezed,
  }) {
    return _then(_$ReitFormImpl(
      reitName: freezed == reitName
          ? _value.reitName
          : reitName // ignore: cast_nullable_to_non_nullable
              as String?,
      boughtOn: freezed == boughtOn
          ? _value.boughtOn
          : boughtOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shares: freezed == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$ReitFormImpl implements _ReitForm {
  const _$ReitFormImpl({this.reitName, this.boughtOn, this.shares, this.price});

  @override
  final String? reitName;
  @override
  final DateTime? boughtOn;
  @override
  final double? shares;
  @override
  final double? price;

  @override
  String toString() {
    return 'ReitForm(reitName: $reitName, boughtOn: $boughtOn, shares: $shares, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReitFormImpl &&
            (identical(other.reitName, reitName) ||
                other.reitName == reitName) &&
            (identical(other.boughtOn, boughtOn) ||
                other.boughtOn == boughtOn) &&
            (identical(other.shares, shares) || other.shares == shares) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, reitName, boughtOn, shares, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReitFormImplCopyWith<_$ReitFormImpl> get copyWith =>
      __$$ReitFormImplCopyWithImpl<_$ReitFormImpl>(this, _$identity);
}

abstract class _ReitForm implements ReitForm {
  const factory _ReitForm(
      {final String? reitName,
      final DateTime? boughtOn,
      final double? shares,
      final double? price}) = _$ReitFormImpl;

  @override
  String? get reitName;
  @override
  DateTime? get boughtOn;
  @override
  double? get shares;
  @override
  double? get price;
  @override
  @JsonKey(ignore: true)
  _$$ReitFormImplCopyWith<_$ReitFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

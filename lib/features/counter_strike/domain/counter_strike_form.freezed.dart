// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_strike_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CounterStrikeForm {
  String? get name => throw _privateConstructorUsedError;
  String? get wear => throw _privateConstructorUsedError;
  double? get purchaseValue => throw _privateConstructorUsedError;
  double? get currentValue => throw _privateConstructorUsedError;
  DateTime? get boughtAt => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  String? get imageId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CounterStrikeFormCopyWith<CounterStrikeForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterStrikeFormCopyWith<$Res> {
  factory $CounterStrikeFormCopyWith(
          CounterStrikeForm value, $Res Function(CounterStrikeForm) then) =
      _$CounterStrikeFormCopyWithImpl<$Res, CounterStrikeForm>;
  @useResult
  $Res call(
      {String? name,
      String? wear,
      double? purchaseValue,
      double? currentValue,
      DateTime? boughtAt,
      int? quantity,
      String? imageId});
}

/// @nodoc
class _$CounterStrikeFormCopyWithImpl<$Res, $Val extends CounterStrikeForm>
    implements $CounterStrikeFormCopyWith<$Res> {
  _$CounterStrikeFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? wear = freezed,
    Object? purchaseValue = freezed,
    Object? currentValue = freezed,
    Object? boughtAt = freezed,
    Object? quantity = freezed,
    Object? imageId = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      wear: freezed == wear
          ? _value.wear
          : wear // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseValue: freezed == purchaseValue
          ? _value.purchaseValue
          : purchaseValue // ignore: cast_nullable_to_non_nullable
              as double?,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double?,
      boughtAt: freezed == boughtAt
          ? _value.boughtAt
          : boughtAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      imageId: freezed == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterStrikeFormImplCopyWith<$Res>
    implements $CounterStrikeFormCopyWith<$Res> {
  factory _$$CounterStrikeFormImplCopyWith(_$CounterStrikeFormImpl value,
          $Res Function(_$CounterStrikeFormImpl) then) =
      __$$CounterStrikeFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? wear,
      double? purchaseValue,
      double? currentValue,
      DateTime? boughtAt,
      int? quantity,
      String? imageId});
}

/// @nodoc
class __$$CounterStrikeFormImplCopyWithImpl<$Res>
    extends _$CounterStrikeFormCopyWithImpl<$Res, _$CounterStrikeFormImpl>
    implements _$$CounterStrikeFormImplCopyWith<$Res> {
  __$$CounterStrikeFormImplCopyWithImpl(_$CounterStrikeFormImpl _value,
      $Res Function(_$CounterStrikeFormImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? wear = freezed,
    Object? purchaseValue = freezed,
    Object? currentValue = freezed,
    Object? boughtAt = freezed,
    Object? quantity = freezed,
    Object? imageId = freezed,
  }) {
    return _then(_$CounterStrikeFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      wear: freezed == wear
          ? _value.wear
          : wear // ignore: cast_nullable_to_non_nullable
              as String?,
      purchaseValue: freezed == purchaseValue
          ? _value.purchaseValue
          : purchaseValue // ignore: cast_nullable_to_non_nullable
              as double?,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double?,
      boughtAt: freezed == boughtAt
          ? _value.boughtAt
          : boughtAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      imageId: freezed == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CounterStrikeFormImpl implements _CounterStrikeForm {
  const _$CounterStrikeFormImpl(
      {this.name,
      this.wear,
      this.purchaseValue,
      this.currentValue,
      this.boughtAt,
      this.quantity,
      this.imageId});

  @override
  final String? name;
  @override
  final String? wear;
  @override
  final double? purchaseValue;
  @override
  final double? currentValue;
  @override
  final DateTime? boughtAt;
  @override
  final int? quantity;
  @override
  final String? imageId;

  @override
  String toString() {
    return 'CounterStrikeForm(name: $name, wear: $wear, purchaseValue: $purchaseValue, currentValue: $currentValue, boughtAt: $boughtAt, quantity: $quantity, imageId: $imageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterStrikeFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.wear, wear) || other.wear == wear) &&
            (identical(other.purchaseValue, purchaseValue) ||
                other.purchaseValue == purchaseValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.boughtAt, boughtAt) ||
                other.boughtAt == boughtAt) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.imageId, imageId) || other.imageId == imageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, wear, purchaseValue,
      currentValue, boughtAt, quantity, imageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterStrikeFormImplCopyWith<_$CounterStrikeFormImpl> get copyWith =>
      __$$CounterStrikeFormImplCopyWithImpl<_$CounterStrikeFormImpl>(
          this, _$identity);
}

abstract class _CounterStrikeForm implements CounterStrikeForm {
  const factory _CounterStrikeForm(
      {final String? name,
      final String? wear,
      final double? purchaseValue,
      final double? currentValue,
      final DateTime? boughtAt,
      final int? quantity,
      final String? imageId}) = _$CounterStrikeFormImpl;

  @override
  String? get name;
  @override
  String? get wear;
  @override
  double? get purchaseValue;
  @override
  double? get currentValue;
  @override
  DateTime? get boughtAt;
  @override
  int? get quantity;
  @override
  String? get imageId;
  @override
  @JsonKey(ignore: true)
  _$$CounterStrikeFormImplCopyWith<_$CounterStrikeFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

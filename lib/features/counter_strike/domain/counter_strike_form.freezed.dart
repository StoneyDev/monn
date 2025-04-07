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
  String get purchaseValue => throw _privateConstructorUsedError;
  String get currentValue => throw _privateConstructorUsedError;
  DateTime get boughtAt => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  CounterStrikeItem? get imageId => throw _privateConstructorUsedError;
  String? get wear => throw _privateConstructorUsedError;

  /// Create a copy of CounterStrikeForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {String purchaseValue,
      String currentValue,
      DateTime boughtAt,
      String quantity,
      CounterStrikeItem? imageId,
      String? wear});
}

/// @nodoc
class _$CounterStrikeFormCopyWithImpl<$Res, $Val extends CounterStrikeForm>
    implements $CounterStrikeFormCopyWith<$Res> {
  _$CounterStrikeFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CounterStrikeForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseValue = null,
    Object? currentValue = null,
    Object? boughtAt = null,
    Object? quantity = null,
    Object? imageId = freezed,
    Object? wear = freezed,
  }) {
    return _then(_value.copyWith(
      purchaseValue: null == purchaseValue
          ? _value.purchaseValue
          : purchaseValue // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as String,
      boughtAt: null == boughtAt
          ? _value.boughtAt
          : boughtAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      imageId: freezed == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as CounterStrikeItem?,
      wear: freezed == wear
          ? _value.wear
          : wear // ignore: cast_nullable_to_non_nullable
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
      {String purchaseValue,
      String currentValue,
      DateTime boughtAt,
      String quantity,
      CounterStrikeItem? imageId,
      String? wear});
}

/// @nodoc
class __$$CounterStrikeFormImplCopyWithImpl<$Res>
    extends _$CounterStrikeFormCopyWithImpl<$Res, _$CounterStrikeFormImpl>
    implements _$$CounterStrikeFormImplCopyWith<$Res> {
  __$$CounterStrikeFormImplCopyWithImpl(_$CounterStrikeFormImpl _value,
      $Res Function(_$CounterStrikeFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of CounterStrikeForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseValue = null,
    Object? currentValue = null,
    Object? boughtAt = null,
    Object? quantity = null,
    Object? imageId = freezed,
    Object? wear = freezed,
  }) {
    return _then(_$CounterStrikeFormImpl(
      purchaseValue: null == purchaseValue
          ? _value.purchaseValue
          : purchaseValue // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as String,
      boughtAt: null == boughtAt
          ? _value.boughtAt
          : boughtAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      imageId: freezed == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as CounterStrikeItem?,
      wear: freezed == wear
          ? _value.wear
          : wear // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CounterStrikeFormImpl implements _CounterStrikeForm {
  const _$CounterStrikeFormImpl(
      {required this.purchaseValue,
      required this.currentValue,
      required this.boughtAt,
      required this.quantity,
      required this.imageId,
      this.wear});

  @override
  final String purchaseValue;
  @override
  final String currentValue;
  @override
  final DateTime boughtAt;
  @override
  final String quantity;
  @override
  final CounterStrikeItem? imageId;
  @override
  final String? wear;

  @override
  String toString() {
    return 'CounterStrikeForm(purchaseValue: $purchaseValue, currentValue: $currentValue, boughtAt: $boughtAt, quantity: $quantity, imageId: $imageId, wear: $wear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterStrikeFormImpl &&
            (identical(other.purchaseValue, purchaseValue) ||
                other.purchaseValue == purchaseValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.boughtAt, boughtAt) ||
                other.boughtAt == boughtAt) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.wear, wear) || other.wear == wear));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseValue, currentValue,
      boughtAt, quantity, imageId, wear);

  /// Create a copy of CounterStrikeForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterStrikeFormImplCopyWith<_$CounterStrikeFormImpl> get copyWith =>
      __$$CounterStrikeFormImplCopyWithImpl<_$CounterStrikeFormImpl>(
          this, _$identity);
}

abstract class _CounterStrikeForm implements CounterStrikeForm {
  const factory _CounterStrikeForm(
      {required final String purchaseValue,
      required final String currentValue,
      required final DateTime boughtAt,
      required final String quantity,
      required final CounterStrikeItem? imageId,
      final String? wear}) = _$CounterStrikeFormImpl;

  @override
  String get purchaseValue;
  @override
  String get currentValue;
  @override
  DateTime get boughtAt;
  @override
  String get quantity;
  @override
  CounterStrikeItem? get imageId;
  @override
  String? get wear;

  /// Create a copy of CounterStrikeForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CounterStrikeFormImplCopyWith<_$CounterStrikeFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

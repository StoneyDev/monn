// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_strike.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CounterStrike {
  DateTime get boughtAt => throw _privateConstructorUsedError;
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  @Enumerated(EnumType.name)
  CounterStrikeItem get imageId => throw _privateConstructorUsedError;
  double get purchaseValue => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double? get wear => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of CounterStrike
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CounterStrikeCopyWith<CounterStrike> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CounterStrikeCopyWith<$Res> {
  factory $CounterStrikeCopyWith(
          CounterStrike value, $Res Function(CounterStrike) then) =
      _$CounterStrikeCopyWithImpl<$Res, CounterStrike>;
  @useResult
  $Res call(
      {DateTime boughtAt,
      DateTime lastUpdate,
      @Enumerated(EnumType.name) CounterStrikeItem imageId,
      double purchaseValue,
      double currentValue,
      int quantity,
      double? wear,
      int id});
}

/// @nodoc
class _$CounterStrikeCopyWithImpl<$Res, $Val extends CounterStrike>
    implements $CounterStrikeCopyWith<$Res> {
  _$CounterStrikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CounterStrike
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boughtAt = null,
    Object? lastUpdate = null,
    Object? imageId = null,
    Object? purchaseValue = null,
    Object? currentValue = null,
    Object? quantity = null,
    Object? wear = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      boughtAt: null == boughtAt
          ? _value.boughtAt
          : boughtAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as CounterStrikeItem,
      purchaseValue: null == purchaseValue
          ? _value.purchaseValue
          : purchaseValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      wear: freezed == wear
          ? _value.wear
          : wear // ignore: cast_nullable_to_non_nullable
              as double?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CounterStrikeImplCopyWith<$Res>
    implements $CounterStrikeCopyWith<$Res> {
  factory _$$CounterStrikeImplCopyWith(
          _$CounterStrikeImpl value, $Res Function(_$CounterStrikeImpl) then) =
      __$$CounterStrikeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime boughtAt,
      DateTime lastUpdate,
      @Enumerated(EnumType.name) CounterStrikeItem imageId,
      double purchaseValue,
      double currentValue,
      int quantity,
      double? wear,
      int id});
}

/// @nodoc
class __$$CounterStrikeImplCopyWithImpl<$Res>
    extends _$CounterStrikeCopyWithImpl<$Res, _$CounterStrikeImpl>
    implements _$$CounterStrikeImplCopyWith<$Res> {
  __$$CounterStrikeImplCopyWithImpl(
      _$CounterStrikeImpl _value, $Res Function(_$CounterStrikeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CounterStrike
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boughtAt = null,
    Object? lastUpdate = null,
    Object? imageId = null,
    Object? purchaseValue = null,
    Object? currentValue = null,
    Object? quantity = null,
    Object? wear = freezed,
    Object? id = null,
  }) {
    return _then(_$CounterStrikeImpl(
      boughtAt: null == boughtAt
          ? _value.boughtAt
          : boughtAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastUpdate: null == lastUpdate
          ? _value.lastUpdate
          : lastUpdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageId: null == imageId
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as CounterStrikeItem,
      purchaseValue: null == purchaseValue
          ? _value.purchaseValue
          : purchaseValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      wear: freezed == wear
          ? _value.wear
          : wear // ignore: cast_nullable_to_non_nullable
              as double?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CounterStrikeImpl implements _CounterStrike {
  const _$CounterStrikeImpl(
      {required this.boughtAt,
      required this.lastUpdate,
      @Enumerated(EnumType.name) required this.imageId,
      required this.purchaseValue,
      required this.currentValue,
      required this.quantity,
      this.wear,
      this.id = Isar.autoIncrement});

  @override
  final DateTime boughtAt;
  @override
  final DateTime lastUpdate;
  @override
  @Enumerated(EnumType.name)
  final CounterStrikeItem imageId;
  @override
  final double purchaseValue;
  @override
  final double currentValue;
  @override
  final int quantity;
  @override
  final double? wear;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'CounterStrike(boughtAt: $boughtAt, lastUpdate: $lastUpdate, imageId: $imageId, purchaseValue: $purchaseValue, currentValue: $currentValue, quantity: $quantity, wear: $wear, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterStrikeImpl &&
            (identical(other.boughtAt, boughtAt) ||
                other.boughtAt == boughtAt) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.purchaseValue, purchaseValue) ||
                other.purchaseValue == purchaseValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.wear, wear) || other.wear == wear) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, boughtAt, lastUpdate, imageId,
      purchaseValue, currentValue, quantity, wear, id);

  /// Create a copy of CounterStrike
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterStrikeImplCopyWith<_$CounterStrikeImpl> get copyWith =>
      __$$CounterStrikeImplCopyWithImpl<_$CounterStrikeImpl>(this, _$identity);
}

abstract class _CounterStrike implements CounterStrike {
  const factory _CounterStrike(
      {required final DateTime boughtAt,
      required final DateTime lastUpdate,
      @Enumerated(EnumType.name) required final CounterStrikeItem imageId,
      required final double purchaseValue,
      required final double currentValue,
      required final int quantity,
      final double? wear,
      final int id}) = _$CounterStrikeImpl;

  @override
  DateTime get boughtAt;
  @override
  DateTime get lastUpdate;
  @override
  @Enumerated(EnumType.name)
  CounterStrikeItem get imageId;
  @override
  double get purchaseValue;
  @override
  double get currentValue;
  @override
  int get quantity;
  @override
  double? get wear;
  @override
  int get id;

  /// Create a copy of CounterStrike
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CounterStrikeImplCopyWith<_$CounterStrikeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

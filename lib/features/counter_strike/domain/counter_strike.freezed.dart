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
  String get name => throw _privateConstructorUsedError;
  DateTime get boughtAt => throw _privateConstructorUsedError;
  DateTime get lastUpdate => throw _privateConstructorUsedError;
  String get imageId => throw _privateConstructorUsedError;
  String? get wear => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get purchaseValue => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
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
      {String name,
      DateTime boughtAt,
      DateTime lastUpdate,
      String imageId,
      String? wear,
      int quantity,
      double purchaseValue,
      double currentValue,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? boughtAt = null,
    Object? lastUpdate = null,
    Object? imageId = null,
    Object? wear = freezed,
    Object? quantity = null,
    Object? purchaseValue = null,
    Object? currentValue = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      wear: freezed == wear
          ? _value.wear
          : wear // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseValue: null == purchaseValue
          ? _value.purchaseValue
          : purchaseValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
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
      {String name,
      DateTime boughtAt,
      DateTime lastUpdate,
      String imageId,
      String? wear,
      int quantity,
      double purchaseValue,
      double currentValue,
      int id});
}

/// @nodoc
class __$$CounterStrikeImplCopyWithImpl<$Res>
    extends _$CounterStrikeCopyWithImpl<$Res, _$CounterStrikeImpl>
    implements _$$CounterStrikeImplCopyWith<$Res> {
  __$$CounterStrikeImplCopyWithImpl(
      _$CounterStrikeImpl _value, $Res Function(_$CounterStrikeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? boughtAt = null,
    Object? lastUpdate = null,
    Object? imageId = null,
    Object? wear = freezed,
    Object? quantity = null,
    Object? purchaseValue = null,
    Object? currentValue = null,
    Object? id = null,
  }) {
    return _then(_$CounterStrikeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
      wear: freezed == wear
          ? _value.wear
          : wear // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      purchaseValue: null == purchaseValue
          ? _value.purchaseValue
          : purchaseValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
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
      {required this.name,
      required this.boughtAt,
      required this.lastUpdate,
      required this.imageId,
      this.wear,
      this.quantity = 1,
      this.purchaseValue = 0.0,
      this.currentValue = 0.0,
      this.id = Isar.autoIncrement});

  @override
  final String name;
  @override
  final DateTime boughtAt;
  @override
  final DateTime lastUpdate;
  @override
  final String imageId;
  @override
  final String? wear;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final double purchaseValue;
  @override
  @JsonKey()
  final double currentValue;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'CounterStrike(name: $name, boughtAt: $boughtAt, lastUpdate: $lastUpdate, imageId: $imageId, wear: $wear, quantity: $quantity, purchaseValue: $purchaseValue, currentValue: $currentValue, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CounterStrikeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.boughtAt, boughtAt) ||
                other.boughtAt == boughtAt) &&
            (identical(other.lastUpdate, lastUpdate) ||
                other.lastUpdate == lastUpdate) &&
            (identical(other.imageId, imageId) || other.imageId == imageId) &&
            (identical(other.wear, wear) || other.wear == wear) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.purchaseValue, purchaseValue) ||
                other.purchaseValue == purchaseValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, boughtAt, lastUpdate,
      imageId, wear, quantity, purchaseValue, currentValue, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CounterStrikeImplCopyWith<_$CounterStrikeImpl> get copyWith =>
      __$$CounterStrikeImplCopyWithImpl<_$CounterStrikeImpl>(this, _$identity);
}

abstract class _CounterStrike implements CounterStrike {
  const factory _CounterStrike(
      {required final String name,
      required final DateTime boughtAt,
      required final DateTime lastUpdate,
      required final String imageId,
      final String? wear,
      final int quantity,
      final double purchaseValue,
      final double currentValue,
      final int id}) = _$CounterStrikeImpl;

  @override
  String get name;
  @override
  DateTime get boughtAt;
  @override
  DateTime get lastUpdate;
  @override
  String get imageId;
  @override
  String? get wear;
  @override
  int get quantity;
  @override
  double get purchaseValue;
  @override
  double get currentValue;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$CounterStrikeImplCopyWith<_$CounterStrikeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

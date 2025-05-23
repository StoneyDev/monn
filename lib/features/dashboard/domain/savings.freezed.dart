// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Savings {
  @Enumerated(EnumType.name)
  SavingsType get type => throw _privateConstructorUsedError;
  double? get startAmount => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of Savings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavingsCopyWith<Savings> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingsCopyWith<$Res> {
  factory $SavingsCopyWith(Savings value, $Res Function(Savings) then) =
      _$SavingsCopyWithImpl<$Res, Savings>;
  @useResult
  $Res call(
      {@Enumerated(EnumType.name) SavingsType type,
      double? startAmount,
      int id});
}

/// @nodoc
class _$SavingsCopyWithImpl<$Res, $Val extends Savings>
    implements $SavingsCopyWith<$Res> {
  _$SavingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Savings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? startAmount = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SavingsType,
      startAmount: freezed == startAmount
          ? _value.startAmount
          : startAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavingsImplCopyWith<$Res> implements $SavingsCopyWith<$Res> {
  factory _$$SavingsImplCopyWith(
          _$SavingsImpl value, $Res Function(_$SavingsImpl) then) =
      __$$SavingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Enumerated(EnumType.name) SavingsType type,
      double? startAmount,
      int id});
}

/// @nodoc
class __$$SavingsImplCopyWithImpl<$Res>
    extends _$SavingsCopyWithImpl<$Res, _$SavingsImpl>
    implements _$$SavingsImplCopyWith<$Res> {
  __$$SavingsImplCopyWithImpl(
      _$SavingsImpl _value, $Res Function(_$SavingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Savings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? startAmount = freezed,
    Object? id = null,
  }) {
    return _then(_$SavingsImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SavingsType,
      startAmount: freezed == startAmount
          ? _value.startAmount
          : startAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SavingsImpl implements _Savings {
  const _$SavingsImpl(
      {@Enumerated(EnumType.name) required this.type,
      this.startAmount,
      this.id = Isar.autoIncrement});

  @override
  @Enumerated(EnumType.name)
  final SavingsType type;
  @override
  final double? startAmount;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'Savings(type: $type, startAmount: $startAmount, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingsImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startAmount, startAmount) ||
                other.startAmount == startAmount) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, startAmount, id);

  /// Create a copy of Savings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavingsImplCopyWith<_$SavingsImpl> get copyWith =>
      __$$SavingsImplCopyWithImpl<_$SavingsImpl>(this, _$identity);
}

abstract class _Savings implements Savings {
  const factory _Savings(
      {@Enumerated(EnumType.name) required final SavingsType type,
      final double? startAmount,
      final int id}) = _$SavingsImpl;

  @override
  @Enumerated(EnumType.name)
  SavingsType get type;
  @override
  double? get startAmount;
  @override
  int get id;

  /// Create a copy of Savings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavingsImplCopyWith<_$SavingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

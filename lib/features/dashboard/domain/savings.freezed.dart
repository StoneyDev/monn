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
  @enumerated
  SavingsType get type => throw _privateConstructorUsedError;
  double get startAmount => throw _privateConstructorUsedError;
  double get income => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavingsCopyWith<Savings> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingsCopyWith<$Res> {
  factory $SavingsCopyWith(Savings value, $Res Function(Savings) then) =
      _$SavingsCopyWithImpl<$Res, Savings>;
  @useResult
  $Res call(
      {@enumerated SavingsType type,
      double startAmount,
      double income,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? startAmount = null,
    Object? income = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SavingsType,
      startAmount: null == startAmount
          ? _value.startAmount
          : startAmount // ignore: cast_nullable_to_non_nullable
              as double,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
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
      {@enumerated SavingsType type,
      double startAmount,
      double income,
      int id});
}

/// @nodoc
class __$$SavingsImplCopyWithImpl<$Res>
    extends _$SavingsCopyWithImpl<$Res, _$SavingsImpl>
    implements _$$SavingsImplCopyWith<$Res> {
  __$$SavingsImplCopyWithImpl(
      _$SavingsImpl _value, $Res Function(_$SavingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? startAmount = null,
    Object? income = null,
    Object? id = null,
  }) {
    return _then(_$SavingsImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SavingsType,
      startAmount: null == startAmount
          ? _value.startAmount
          : startAmount // ignore: cast_nullable_to_non_nullable
              as double,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as double,
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
      {@enumerated required this.type,
      this.startAmount = 0,
      this.income = 0,
      this.id = Isar.autoIncrement});

  @override
  @enumerated
  final SavingsType type;
  @override
  @JsonKey()
  final double startAmount;
  @override
  @JsonKey()
  final double income;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'Savings(type: $type, startAmount: $startAmount, income: $income, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingsImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.startAmount, startAmount) ||
                other.startAmount == startAmount) &&
            (identical(other.income, income) || other.income == income) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, startAmount, income, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavingsImplCopyWith<_$SavingsImpl> get copyWith =>
      __$$SavingsImplCopyWithImpl<_$SavingsImpl>(this, _$identity);
}

abstract class _Savings implements Savings {
  const factory _Savings(
      {@enumerated required final SavingsType type,
      final double startAmount,
      final double income,
      final int id}) = _$SavingsImpl;

  @override
  @enumerated
  SavingsType get type;
  @override
  double get startAmount;
  @override
  double get income;
  @override
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$SavingsImplCopyWith<_$SavingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

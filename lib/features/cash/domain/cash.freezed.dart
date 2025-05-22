// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Cash {
  String get label => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  /// Create a copy of Cash
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashCopyWith<Cash> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashCopyWith<$Res> {
  factory $CashCopyWith(Cash value, $Res Function(Cash) then) =
      _$CashCopyWithImpl<$Res, Cash>;
  @useResult
  $Res call({String label, double value, int id});
}

/// @nodoc
class _$CashCopyWithImpl<$Res, $Val extends Cash>
    implements $CashCopyWith<$Res> {
  _$CashCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Cash
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashImplCopyWith<$Res> implements $CashCopyWith<$Res> {
  factory _$$CashImplCopyWith(
          _$CashImpl value, $Res Function(_$CashImpl) then) =
      __$$CashImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, double value, int id});
}

/// @nodoc
class __$$CashImplCopyWithImpl<$Res>
    extends _$CashCopyWithImpl<$Res, _$CashImpl>
    implements _$$CashImplCopyWith<$Res> {
  __$$CashImplCopyWithImpl(_$CashImpl _value, $Res Function(_$CashImpl) _then)
      : super(_value, _then);

  /// Create a copy of Cash
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? id = null,
  }) {
    return _then(_$CashImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CashImpl implements _Cash {
  const _$CashImpl(
      {required this.label, required this.value, this.id = Isar.autoIncrement});

  @override
  final String label;
  @override
  final double value;
  @override
  @JsonKey()
  final int id;

  @override
  String toString() {
    return 'Cash(label: $label, value: $value, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value, id);

  /// Create a copy of Cash
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashImplCopyWith<_$CashImpl> get copyWith =>
      __$$CashImplCopyWithImpl<_$CashImpl>(this, _$identity);
}

abstract class _Cash implements Cash {
  const factory _Cash(
      {required final String label,
      required final double value,
      final int id}) = _$CashImpl;

  @override
  String get label;
  @override
  double get value;
  @override
  int get id;

  /// Create a copy of Cash
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashImplCopyWith<_$CashImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

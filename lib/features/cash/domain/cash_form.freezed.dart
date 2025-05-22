// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cash_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CashForm {
  String get label => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Create a copy of CashForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CashFormCopyWith<CashForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CashFormCopyWith<$Res> {
  factory $CashFormCopyWith(CashForm value, $Res Function(CashForm) then) =
      _$CashFormCopyWithImpl<$Res, CashForm>;
  @useResult
  $Res call({String label, String value, int? id});
}

/// @nodoc
class _$CashFormCopyWithImpl<$Res, $Val extends CashForm>
    implements $CashFormCopyWith<$Res> {
  _$CashFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CashForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CashFormImplCopyWith<$Res>
    implements $CashFormCopyWith<$Res> {
  factory _$$CashFormImplCopyWith(
          _$CashFormImpl value, $Res Function(_$CashFormImpl) then) =
      __$$CashFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String value, int? id});
}

/// @nodoc
class __$$CashFormImplCopyWithImpl<$Res>
    extends _$CashFormCopyWithImpl<$Res, _$CashFormImpl>
    implements _$$CashFormImplCopyWith<$Res> {
  __$$CashFormImplCopyWithImpl(
      _$CashFormImpl _value, $Res Function(_$CashFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of CashForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? value = null,
    Object? id = freezed,
  }) {
    return _then(_$CashFormImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CashFormImpl implements _CashForm {
  const _$CashFormImpl({required this.label, required this.value, this.id});

  @override
  final String label;
  @override
  final String value;
  @override
  final int? id;

  @override
  String toString() {
    return 'CashForm(label: $label, value: $value, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CashFormImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, label, value, id);

  /// Create a copy of CashForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CashFormImplCopyWith<_$CashFormImpl> get copyWith =>
      __$$CashFormImplCopyWithImpl<_$CashFormImpl>(this, _$identity);
}

abstract class _CashForm implements CashForm {
  const factory _CashForm(
      {required final String label,
      required final String value,
      final int? id}) = _$CashFormImpl;

  @override
  String get label;
  @override
  String get value;
  @override
  int? get id;

  /// Create a copy of CashForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CashFormImplCopyWith<_$CashFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

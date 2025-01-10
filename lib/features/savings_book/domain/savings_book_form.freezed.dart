// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'savings_book_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SavingsBookForm {
  String? get name => throw _privateConstructorUsedError;
  double? get startAmount => throw _privateConstructorUsedError;
  double? get withdrawal => throw _privateConstructorUsedError;

  /// Create a copy of SavingsBookForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SavingsBookFormCopyWith<SavingsBookForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingsBookFormCopyWith<$Res> {
  factory $SavingsBookFormCopyWith(
          SavingsBookForm value, $Res Function(SavingsBookForm) then) =
      _$SavingsBookFormCopyWithImpl<$Res, SavingsBookForm>;
  @useResult
  $Res call({String? name, double? startAmount, double? withdrawal});
}

/// @nodoc
class _$SavingsBookFormCopyWithImpl<$Res, $Val extends SavingsBookForm>
    implements $SavingsBookFormCopyWith<$Res> {
  _$SavingsBookFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SavingsBookForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? startAmount = freezed,
    Object? withdrawal = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startAmount: freezed == startAmount
          ? _value.startAmount
          : startAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      withdrawal: freezed == withdrawal
          ? _value.withdrawal
          : withdrawal // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavingsBookFormImplCopyWith<$Res>
    implements $SavingsBookFormCopyWith<$Res> {
  factory _$$SavingsBookFormImplCopyWith(_$SavingsBookFormImpl value,
          $Res Function(_$SavingsBookFormImpl) then) =
      __$$SavingsBookFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, double? startAmount, double? withdrawal});
}

/// @nodoc
class __$$SavingsBookFormImplCopyWithImpl<$Res>
    extends _$SavingsBookFormCopyWithImpl<$Res, _$SavingsBookFormImpl>
    implements _$$SavingsBookFormImplCopyWith<$Res> {
  __$$SavingsBookFormImplCopyWithImpl(
      _$SavingsBookFormImpl _value, $Res Function(_$SavingsBookFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of SavingsBookForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? startAmount = freezed,
    Object? withdrawal = freezed,
  }) {
    return _then(_$SavingsBookFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startAmount: freezed == startAmount
          ? _value.startAmount
          : startAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      withdrawal: freezed == withdrawal
          ? _value.withdrawal
          : withdrawal // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$SavingsBookFormImpl implements _SavingsBookForm {
  const _$SavingsBookFormImpl({this.name, this.startAmount, this.withdrawal});

  @override
  final String? name;
  @override
  final double? startAmount;
  @override
  final double? withdrawal;

  @override
  String toString() {
    return 'SavingsBookForm(name: $name, startAmount: $startAmount, withdrawal: $withdrawal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavingsBookFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startAmount, startAmount) ||
                other.startAmount == startAmount) &&
            (identical(other.withdrawal, withdrawal) ||
                other.withdrawal == withdrawal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, startAmount, withdrawal);

  /// Create a copy of SavingsBookForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SavingsBookFormImplCopyWith<_$SavingsBookFormImpl> get copyWith =>
      __$$SavingsBookFormImplCopyWithImpl<_$SavingsBookFormImpl>(
          this, _$identity);
}

abstract class _SavingsBookForm implements SavingsBookForm {
  const factory _SavingsBookForm(
      {final String? name,
      final double? startAmount,
      final double? withdrawal}) = _$SavingsBookFormImpl;

  @override
  String? get name;
  @override
  double? get startAmount;
  @override
  double? get withdrawal;

  /// Create a copy of SavingsBookForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SavingsBookFormImplCopyWith<_$SavingsBookFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

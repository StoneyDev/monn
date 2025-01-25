// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pea_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PeaForm {
  int? get equity => throw _privateConstructorUsedError;
  double? get costAverage => throw _privateConstructorUsedError;

  /// Create a copy of PeaForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PeaFormCopyWith<PeaForm> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeaFormCopyWith<$Res> {
  factory $PeaFormCopyWith(PeaForm value, $Res Function(PeaForm) then) =
      _$PeaFormCopyWithImpl<$Res, PeaForm>;
  @useResult
  $Res call({int? equity, double? costAverage});
}

/// @nodoc
class _$PeaFormCopyWithImpl<$Res, $Val extends PeaForm>
    implements $PeaFormCopyWith<$Res> {
  _$PeaFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PeaForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equity = freezed,
    Object? costAverage = freezed,
  }) {
    return _then(_value.copyWith(
      equity: freezed == equity
          ? _value.equity
          : equity // ignore: cast_nullable_to_non_nullable
              as int?,
      costAverage: freezed == costAverage
          ? _value.costAverage
          : costAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeaFormImplCopyWith<$Res> implements $PeaFormCopyWith<$Res> {
  factory _$$PeaFormImplCopyWith(
          _$PeaFormImpl value, $Res Function(_$PeaFormImpl) then) =
      __$$PeaFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? equity, double? costAverage});
}

/// @nodoc
class __$$PeaFormImplCopyWithImpl<$Res>
    extends _$PeaFormCopyWithImpl<$Res, _$PeaFormImpl>
    implements _$$PeaFormImplCopyWith<$Res> {
  __$$PeaFormImplCopyWithImpl(
      _$PeaFormImpl _value, $Res Function(_$PeaFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of PeaForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? equity = freezed,
    Object? costAverage = freezed,
  }) {
    return _then(_$PeaFormImpl(
      equity: freezed == equity
          ? _value.equity
          : equity // ignore: cast_nullable_to_non_nullable
              as int?,
      costAverage: freezed == costAverage
          ? _value.costAverage
          : costAverage // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$PeaFormImpl implements _PeaForm {
  const _$PeaFormImpl({this.equity, this.costAverage});

  @override
  final int? equity;
  @override
  final double? costAverage;

  @override
  String toString() {
    return 'PeaForm(equity: $equity, costAverage: $costAverage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeaFormImpl &&
            (identical(other.equity, equity) || other.equity == equity) &&
            (identical(other.costAverage, costAverage) ||
                other.costAverage == costAverage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, equity, costAverage);

  /// Create a copy of PeaForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PeaFormImplCopyWith<_$PeaFormImpl> get copyWith =>
      __$$PeaFormImplCopyWithImpl<_$PeaFormImpl>(this, _$identity);
}

abstract class _PeaForm implements PeaForm {
  const factory _PeaForm({final int? equity, final double? costAverage}) =
      _$PeaFormImpl;

  @override
  int? get equity;
  @override
  double? get costAverage;

  /// Create a copy of PeaForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PeaFormImplCopyWith<_$PeaFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

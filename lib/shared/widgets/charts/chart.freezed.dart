// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Chart {
  double get totalAmount => throw _privateConstructorUsedError;
  List<ChartData> get data => throw _privateConstructorUsedError;

  /// Create a copy of Chart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartCopyWith<Chart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartCopyWith<$Res> {
  factory $ChartCopyWith(Chart value, $Res Function(Chart) then) =
      _$ChartCopyWithImpl<$Res, Chart>;
  @useResult
  $Res call({double totalAmount, List<ChartData> data});
}

/// @nodoc
class _$ChartCopyWithImpl<$Res, $Val extends Chart>
    implements $ChartCopyWith<$Res> {
  _$ChartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Chart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAmount = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChartData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartImplCopyWith<$Res> implements $ChartCopyWith<$Res> {
  factory _$$ChartImplCopyWith(
          _$ChartImpl value, $Res Function(_$ChartImpl) then) =
      __$$ChartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double totalAmount, List<ChartData> data});
}

/// @nodoc
class __$$ChartImplCopyWithImpl<$Res>
    extends _$ChartCopyWithImpl<$Res, _$ChartImpl>
    implements _$$ChartImplCopyWith<$Res> {
  __$$ChartImplCopyWithImpl(
      _$ChartImpl _value, $Res Function(_$ChartImpl) _then)
      : super(_value, _then);

  /// Create a copy of Chart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalAmount = null,
    Object? data = null,
  }) {
    return _then(_$ChartImpl(
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ChartData>,
    ));
  }
}

/// @nodoc

class _$ChartImpl implements _Chart {
  const _$ChartImpl(
      {required this.totalAmount, required final List<ChartData> data})
      : _data = data;

  @override
  final double totalAmount;
  final List<ChartData> _data;
  @override
  List<ChartData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'Chart(totalAmount: $totalAmount, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartImpl &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, totalAmount, const DeepCollectionEquality().hash(_data));

  /// Create a copy of Chart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartImplCopyWith<_$ChartImpl> get copyWith =>
      __$$ChartImplCopyWithImpl<_$ChartImpl>(this, _$identity);
}

abstract class _Chart implements Chart {
  const factory _Chart(
      {required final double totalAmount,
      required final List<ChartData> data}) = _$ChartImpl;

  @override
  double get totalAmount;
  @override
  List<ChartData> get data;

  /// Create a copy of Chart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartImplCopyWith<_$ChartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChartData {
  double get portion => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  /// Create a copy of ChartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChartDataCopyWith<ChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChartDataCopyWith<$Res> {
  factory $ChartDataCopyWith(ChartData value, $Res Function(ChartData) then) =
      _$ChartDataCopyWithImpl<$Res, ChartData>;
  @useResult
  $Res call({double portion, Color color});
}

/// @nodoc
class _$ChartDataCopyWithImpl<$Res, $Val extends ChartData>
    implements $ChartDataCopyWith<$Res> {
  _$ChartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? portion = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      portion: null == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChartDataImplCopyWith<$Res>
    implements $ChartDataCopyWith<$Res> {
  factory _$$ChartDataImplCopyWith(
          _$ChartDataImpl value, $Res Function(_$ChartDataImpl) then) =
      __$$ChartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double portion, Color color});
}

/// @nodoc
class __$$ChartDataImplCopyWithImpl<$Res>
    extends _$ChartDataCopyWithImpl<$Res, _$ChartDataImpl>
    implements _$$ChartDataImplCopyWith<$Res> {
  __$$ChartDataImplCopyWithImpl(
      _$ChartDataImpl _value, $Res Function(_$ChartDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? portion = null,
    Object? color = null,
  }) {
    return _then(_$ChartDataImpl(
      portion: null == portion
          ? _value.portion
          : portion // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$ChartDataImpl implements _ChartData {
  const _$ChartDataImpl({required this.portion, required this.color});

  @override
  final double portion;
  @override
  final Color color;

  @override
  String toString() {
    return 'ChartData(portion: $portion, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChartDataImpl &&
            (identical(other.portion, portion) || other.portion == portion) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, portion, color);

  /// Create a copy of ChartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChartDataImplCopyWith<_$ChartDataImpl> get copyWith =>
      __$$ChartDataImplCopyWithImpl<_$ChartDataImpl>(this, _$identity);
}

abstract class _ChartData implements ChartData {
  const factory _ChartData(
      {required final double portion,
      required final Color color}) = _$ChartDataImpl;

  @override
  double get portion;
  @override
  Color get color;

  /// Create a copy of ChartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChartDataImplCopyWith<_$ChartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

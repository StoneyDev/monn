// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_cap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoinCapResponse _$CoinCapResponseFromJson(Map<String, dynamic> json) {
  return _CoinCapResponse.fromJson(json);
}

/// @nodoc
mixin _$CoinCapResponse {
  CoinCap get data => throw _privateConstructorUsedError;

  /// Serializes this CoinCapResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoinCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinCapResponseCopyWith<CoinCapResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinCapResponseCopyWith<$Res> {
  factory $CoinCapResponseCopyWith(
          CoinCapResponse value, $Res Function(CoinCapResponse) then) =
      _$CoinCapResponseCopyWithImpl<$Res, CoinCapResponse>;
  @useResult
  $Res call({CoinCap data});

  $CoinCapCopyWith<$Res> get data;
}

/// @nodoc
class _$CoinCapResponseCopyWithImpl<$Res, $Val extends CoinCapResponse>
    implements $CoinCapResponseCopyWith<$Res> {
  _$CoinCapResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CoinCap,
    ) as $Val);
  }

  /// Create a copy of CoinCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoinCapCopyWith<$Res> get data {
    return $CoinCapCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoinCapResponseImplCopyWith<$Res>
    implements $CoinCapResponseCopyWith<$Res> {
  factory _$$CoinCapResponseImplCopyWith(_$CoinCapResponseImpl value,
          $Res Function(_$CoinCapResponseImpl) then) =
      __$$CoinCapResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CoinCap data});

  @override
  $CoinCapCopyWith<$Res> get data;
}

/// @nodoc
class __$$CoinCapResponseImplCopyWithImpl<$Res>
    extends _$CoinCapResponseCopyWithImpl<$Res, _$CoinCapResponseImpl>
    implements _$$CoinCapResponseImplCopyWith<$Res> {
  __$$CoinCapResponseImplCopyWithImpl(
      _$CoinCapResponseImpl _value, $Res Function(_$CoinCapResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$CoinCapResponseImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CoinCap,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinCapResponseImpl implements _CoinCapResponse {
  const _$CoinCapResponseImpl({required this.data});

  factory _$CoinCapResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinCapResponseImplFromJson(json);

  @override
  final CoinCap data;

  @override
  String toString() {
    return 'CoinCapResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinCapResponseImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of CoinCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinCapResponseImplCopyWith<_$CoinCapResponseImpl> get copyWith =>
      __$$CoinCapResponseImplCopyWithImpl<_$CoinCapResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinCapResponseImplToJson(
      this,
    );
  }
}

abstract class _CoinCapResponse implements CoinCapResponse {
  const factory _CoinCapResponse({required final CoinCap data}) =
      _$CoinCapResponseImpl;

  factory _CoinCapResponse.fromJson(Map<String, dynamic> json) =
      _$CoinCapResponseImpl.fromJson;

  @override
  CoinCap get data;

  /// Create a copy of CoinCapResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinCapResponseImplCopyWith<_$CoinCapResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoinCap _$CoinCapFromJson(Map<String, dynamic> json) {
  return _CoinCap.fromJson(json);
}

/// @nodoc
mixin _$CoinCap {
  @JsonKey(fromJson: double.parse)
  double get priceUsd => throw _privateConstructorUsedError;

  /// Serializes this CoinCap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoinCap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoinCapCopyWith<CoinCap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinCapCopyWith<$Res> {
  factory $CoinCapCopyWith(CoinCap value, $Res Function(CoinCap) then) =
      _$CoinCapCopyWithImpl<$Res, CoinCap>;
  @useResult
  $Res call({@JsonKey(fromJson: double.parse) double priceUsd});
}

/// @nodoc
class _$CoinCapCopyWithImpl<$Res, $Val extends CoinCap>
    implements $CoinCapCopyWith<$Res> {
  _$CoinCapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoinCap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceUsd = null,
  }) {
    return _then(_value.copyWith(
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinCapImplCopyWith<$Res> implements $CoinCapCopyWith<$Res> {
  factory _$$CoinCapImplCopyWith(
          _$CoinCapImpl value, $Res Function(_$CoinCapImpl) then) =
      __$$CoinCapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(fromJson: double.parse) double priceUsd});
}

/// @nodoc
class __$$CoinCapImplCopyWithImpl<$Res>
    extends _$CoinCapCopyWithImpl<$Res, _$CoinCapImpl>
    implements _$$CoinCapImplCopyWith<$Res> {
  __$$CoinCapImplCopyWithImpl(
      _$CoinCapImpl _value, $Res Function(_$CoinCapImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoinCap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? priceUsd = null,
  }) {
    return _then(_$CoinCapImpl(
      priceUsd: null == priceUsd
          ? _value.priceUsd
          : priceUsd // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinCapImpl implements _CoinCap {
  _$CoinCapImpl({@JsonKey(fromJson: double.parse) required this.priceUsd});

  factory _$CoinCapImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinCapImplFromJson(json);

  @override
  @JsonKey(fromJson: double.parse)
  final double priceUsd;

  @override
  String toString() {
    return 'CoinCap(priceUsd: $priceUsd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinCapImpl &&
            (identical(other.priceUsd, priceUsd) ||
                other.priceUsd == priceUsd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, priceUsd);

  /// Create a copy of CoinCap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinCapImplCopyWith<_$CoinCapImpl> get copyWith =>
      __$$CoinCapImplCopyWithImpl<_$CoinCapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinCapImplToJson(
      this,
    );
  }
}

abstract class _CoinCap implements CoinCap {
  factory _CoinCap(
          {@JsonKey(fromJson: double.parse) required final double priceUsd}) =
      _$CoinCapImpl;

  factory _CoinCap.fromJson(Map<String, dynamic> json) = _$CoinCapImpl.fromJson;

  @override
  @JsonKey(fromJson: double.parse)
  double get priceUsd;

  /// Create a copy of CoinCap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoinCapImplCopyWith<_$CoinCapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

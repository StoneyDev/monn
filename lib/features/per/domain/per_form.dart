import 'package:freezed_annotation/freezed_annotation.dart';

part 'per_form.freezed.dart';

@freezed
abstract class PerForm with _$PerForm {
  const factory PerForm({
    required String invested,
    required String interests,
  }) = _PerForm;
}

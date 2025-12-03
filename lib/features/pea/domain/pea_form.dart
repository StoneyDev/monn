import 'package:freezed_annotation/freezed_annotation.dart';

part 'pea_form.freezed.dart';

@freezed
abstract class PeaForm with _$PeaForm {
  const factory PeaForm({
    required String equity,
    required String costAverage,
    @Default(false) bool isDirty,
  }) = _PeaForm;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pea_form.freezed.dart';

@freezed
class PeaForm with _$PeaForm {
  const factory PeaForm({
    int? equity,
    double? costAverage,
  }) = _PeaForm;
}

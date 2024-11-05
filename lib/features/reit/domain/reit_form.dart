import 'package:freezed_annotation/freezed_annotation.dart';

part 'reit_form.freezed.dart';

@freezed
class ReitForm with _$ReitForm {
  const factory ReitForm({
    String? reitName,
    DateTime? boughtOn,
    double? shares,
    double? price,
  }) = _ReitForm;
}

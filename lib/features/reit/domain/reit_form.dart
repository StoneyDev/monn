import 'package:freezed_annotation/freezed_annotation.dart';

part 'reit_form.freezed.dart';

@freezed
abstract class ReitForm with _$ReitForm {
  const factory ReitForm({
    required String reitName,
    required DateTime boughtOn,
    required String shares,
    required String price,
  }) = _ReitForm;
}

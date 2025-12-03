import 'package:freezed_annotation/freezed_annotation.dart';

part 'cash_form.freezed.dart';

@freezed
abstract class CashForm with _$CashForm {
  const factory CashForm({
    required String label,
    required String value,
    int? id,
  }) = _CashForm;
}

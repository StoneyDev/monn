import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_book_form.freezed.dart';

@freezed
class SavingsBookForm with _$SavingsBookForm {
  const factory SavingsBookForm({
    String? name,
    double? startAmount,
    double? withdrawal,
  }) = _SavingsBookForm;
}

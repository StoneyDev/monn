import 'package:freezed_annotation/freezed_annotation.dart';

part 'savings_book_form.freezed.dart';

@freezed
class SavingsBookForm with _$SavingsBookForm {
  const factory SavingsBookForm({
    required String name,
    required String startAmount,
    String? withdrawal,
  }) = _SavingsBookForm;
}

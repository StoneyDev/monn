import 'package:monn/features/savings_book/domain/savings_book_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_book_form_controller.g.dart';

@Riverpod(keepAlive: true)
class SavingsBookFormController extends _$SavingsBookFormController {
  @override
  SavingsBookForm build() => const SavingsBookForm();

  void edit({String? name, String? startAmount}) {
    state = state.copyWith(
      name: name ?? state.name,
      startAmount: double.tryParse(startAmount ?? '') ?? state.startAmount,
    );
  }
}

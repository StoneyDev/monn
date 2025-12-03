import 'package:monn/features/savings_book/domain/savings_book_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_book_form_controller.g.dart';

@Riverpod(keepAlive: true)
class SavingsBookFormController extends _$SavingsBookFormController {
  @override
  SavingsBookForm build() => const SavingsBookForm(name: '', startAmount: '');

  void name({required String name}) {
    state = state.copyWith(name: name);
  }

  void startAmount({required String startAmount}) {
    state = state.copyWith(startAmount: startAmount);
  }
}

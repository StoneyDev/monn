import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/domain/savings_book.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_book_interest_form_controller.g.dart';

typedef SavingsBookInterestForm = ({
  SavingsBook? savingsBook,
  String amount,
});

@Riverpod(keepAlive: true)
class SavingsBookInterestFormController
    extends _$SavingsBookInterestFormController {
  @override
  SavingsBookInterestForm build() => (savingsBook: null, amount: '');

  void set({SavingsBook? savingsBook, String? amount}) {
    state = (
      savingsBook: savingsBook ?? state.savingsBook,
      amount: amount ?? state.amount,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(savingsBookRepositoryProvider);
    final amount = double.parse(state.amount);
    final newSavingsBook = state.savingsBook!;

    if (amount.isNegative) {
      newSavingsBook.withdrawal = newSavingsBook.withdrawal + amount.abs();
    } else {
      newSavingsBook.interests = newSavingsBook.interests + amount;
    }

    final result = await AsyncValue.guard(
      () => repository.editSavingsBook(newSavingsBook),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}

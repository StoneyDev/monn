import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/domain/savings_book.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_savings_book_interest_form_controller.g.dart';

@riverpod
class SubmitSavingsBookInterestFormController
    extends _$SubmitSavingsBookInterestFormController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit({
    required SavingsBook savingsBook,
    required double amount,
  }) async {
    state = const AsyncLoading();

    final repository = ref.read(savingsBookRepositoryProvider);
    final newSavingsBook = savingsBook;

    if (amount.isNegative) {
      newSavingsBook.withdrawal = savingsBook.withdrawal + amount.abs();
    } else {
      newSavingsBook.interests = savingsBook.interests + amount;
    }

    state = await AsyncValue.guard(
      () => repository.editSavingsBook(newSavingsBook),
    );

    return !state.hasError;
  }
}

import 'package:drift/drift.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/shared/local/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_book_interest_form_controller.g.dart';

typedef SavingsBookInterestForm = ({
  SavingsBookEntry? savingsBook,
  String amount,
});

@Riverpod(keepAlive: true)
class SavingsBookInterestFormController
    extends _$SavingsBookInterestFormController {
  @override
  SavingsBookInterestForm build() => (savingsBook: null, amount: '');

  void set({SavingsBookEntry? savingsBook, String? amount}) {
    state = (
      savingsBook: savingsBook ?? state.savingsBook,
      amount: amount ?? state.amount,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(savingsBookRepositoryProvider);
    final amount = double.parse(state.amount);
    final sb = state.savingsBook!;

    final companion = SavingsBookEntriesCompanion(
      id: Value(sb.id),
      name: Value(sb.name),
      startAmount: Value(sb.startAmount),
      withdrawal: Value(
        amount.isNegative ? sb.withdrawal + amount.abs() : sb.withdrawal,
      ),
      interests: Value(
        amount.isNegative ? sb.interests : sb.interests + amount,
      ),
    );

    final result = await AsyncValue.guard(
      () => repository.editSavingsBook(companion),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}

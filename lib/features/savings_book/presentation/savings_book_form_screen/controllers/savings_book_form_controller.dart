import 'package:drift/drift.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/shared/local/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_book_form_controller.g.dart';

typedef SavingsBookForm = ({String name, String startAmount});

@Riverpod(keepAlive: true)
class SavingsBookFormController extends _$SavingsBookFormController {
  @override
  SavingsBookForm build() => (name: '', startAmount: '');

  void set({String? name, String? startAmount}) {
    state = (
      name: name ?? state.name,
      startAmount: startAmount ?? state.startAmount,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(savingsBookRepositoryProvider);

    final result = await AsyncValue.guard(
      () => repository.addSavingsBook(
        SavingsBookEntriesCompanion.insert(
          name: state.name,
          startAmount: Value(double.parse(state.startAmount)),
        ),
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}

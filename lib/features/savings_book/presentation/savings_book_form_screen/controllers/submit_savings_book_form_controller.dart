import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/domain/savings_book.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/savings_book_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_savings_book_form_controller.g.dart';

@riverpod
class SubmitSavingsBookFormController
    extends _$SubmitSavingsBookFormController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit() async {
    state = const AsyncLoading();

    final repository = ref.read(savingsBookRepositoryProvider);
    final formData = ref.read(savingsBookFormControllerProvider);

    state = await AsyncValue.guard(
      () => repository.editSavingsBook(
        SavingsBook()
          ..name = formData.name
          ..startAmount = double.parse(formData.startAmount),
      ),
    );

    return !state.hasError;
  }
}

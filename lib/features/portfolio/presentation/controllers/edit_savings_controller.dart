import 'dart:async';

import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/shared/local/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_savings_controller.g.dart';

@Riverpod(keepAlive: true)
class EditSavingsController extends _$EditSavingsController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit(SavingsEntriesCompanion saving) async {
    state = const AsyncLoading();

    final repository = ref.read(savingsRepositoryProvider);
    final result = await AsyncValue.guard(
      () => repository.editSaving(saving),
    );

    if (!ref.mounted) return false;

    state = result;
    return !result.hasError;
  }
}

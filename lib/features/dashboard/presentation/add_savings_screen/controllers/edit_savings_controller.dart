import 'dart:async';

import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_savings_controller.g.dart';

@Riverpod(keepAlive: true)
class EditSavingsController extends _$EditSavingsController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit(Savings saving) async {
    state = const AsyncLoading();

    final repository = ref.read(savingsRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.editSaving(saving),
    );

    return !state.hasError;
  }
}

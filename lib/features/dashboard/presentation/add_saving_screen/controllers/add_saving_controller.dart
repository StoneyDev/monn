import 'dart:async';

import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_saving_controller.g.dart';

@riverpod
class AddSavingController extends _$AddSavingController {
  @override
  FutureOr<void> build() {}

  Future<bool> submit(SavingsType type) async {
    state = const AsyncLoading();

    final repository = ref.read(savingsRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.updateSaving(Savings(type: type)),
    );

    return !state.hasError;
  }
}

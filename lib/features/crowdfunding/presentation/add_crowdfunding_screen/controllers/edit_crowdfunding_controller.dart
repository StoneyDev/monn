import 'dart:async';

import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_crowdfunding_controller.g.dart';

@riverpod
class EditCrowdfundingController extends _$EditCrowdfundingController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit(Crowdfunding crowdfunding) async {
    state = const AsyncLoading();

    final repository = ref.read(crowndfundingRepositoryProvider);

    state = await AsyncValue.guard(
      () => repository.editCrowdfunding(crowdfunding),
    );

    return !state.hasError;
  }
}

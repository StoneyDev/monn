import 'package:isar/isar.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:monn/features/crowdfunding/presentation/edit_crowdfunding_screen/controllers/crowdfunding_form_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_crowdfunding_form_controller.g.dart';

@riverpod
class SubmitCrowdfundingFormController
    extends _$SubmitCrowdfundingFormController {
  @override
  FutureOr<void> build() async {}

  Future<bool> submit() async {
    final repository = ref.read(crowdfundingRepositoryProvider);
    final formData = ref.read(crowdfundingFormControllerProvider);

    final id = formData.id ?? Isar.autoIncrement;
    final platformName = formData.platformName;
    final receivedAt = formData.receivedAt;
    final brutProfit = double.parse(formData.brutProfit);

    late Crowdfunding newCrowdfunding;

    if (brutProfit.isNegative) {
      newCrowdfunding = Crowdfunding(
        id: id,
        platformName: platformName,
        receivedAt: receivedAt,
        brutProfit: brutProfit,
      );
    } else if (formData.taxPercentage == null) {
      newCrowdfunding = Crowdfunding(
        id: id,
        platformName: platformName,
        receivedAt: receivedAt,
        brutProfit: brutProfit,
        netProfit: brutProfit,
      );
    } else {
      final taxPercentage = double.parse(formData.taxPercentage!);
      final taxProfit = double.parse(
        (brutProfit * (taxPercentage / 100)).toStringAsFixed(2),
      );
      final netProfit = double.parse(
        (brutProfit - taxProfit).toStringAsFixed(2),
      );

      newCrowdfunding = Crowdfunding(
        id: id,
        platformName: platformName,
        receivedAt: receivedAt,
        taxPercentage: taxPercentage,
        taxProfit: taxProfit,
        brutProfit: brutProfit,
        netProfit: netProfit,
      );
    }

    state = await AsyncValue.guard(
      () => repository.editCrowdfunding(newCrowdfunding),
    );

    return !state.hasError;
  }
}

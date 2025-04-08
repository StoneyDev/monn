import 'package:monn/features/crowdfunding/domain/crowdfunding_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crowdfunding_form_controller.g.dart';

@riverpod
class CrowdfundingFormController extends _$CrowdfundingFormController {
  @override
  CrowdfundingForm build() => CrowdfundingForm(
        platformName: 'La Première Brique',
        receivedAt: DateTime.now(),
        brutProfit: '',
      );

  void platformName({required String platformName}) {
    state = state.copyWith(platformName: platformName);
  }

  void receivedAt({required DateTime receivedAt}) {
    state = state.copyWith(receivedAt: receivedAt);
  }

  void brutProfit({required String brutProfit}) {
    state = state.copyWith(brutProfit: brutProfit);
  }

  void taxPercentage({String? taxPercentage}) {
    state = state.copyWith(taxPercentage: taxPercentage);
  }
}

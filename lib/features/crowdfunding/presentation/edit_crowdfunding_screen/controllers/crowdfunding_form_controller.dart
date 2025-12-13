import 'package:monn/features/crowdfunding/domain/crowdfunding_form.dart';
import 'package:monn/shared/extensions/ref_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crowdfunding_form_controller.g.dart';

@Riverpod(keepAlive: true)
class CrowdfundingFormController extends _$CrowdfundingFormController {
  @override
  CrowdfundingForm build() => CrowdfundingForm(
    platformName: 'LPB',
    receivedAt: DateTime.now(),
    brutProfit: '',
  );

  void id({int? id}) {
    // Maintains the value until next page is loaded
    ref.cacheFor(const Duration(seconds: 2));
    state = state.copyWith(id: id);
  }

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

import 'package:monn/features/crowdfunding/domain/crowdfunding_form.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crowdfunding_form_controller.g.dart';

@Riverpod(keepAlive: true)
class CrowdfundingFormController extends _$CrowdfundingFormController {
  @override
  CrowdfundingForm build() => const CrowdfundingForm();

  void edit({
    String? platformName,
    String? taxPercentage,
    String? brutProfit,
    DateTime? receivedAt,
  }) {
    state = state.copyWith(
      platformName: platformName ?? state.platformName,
      taxPercentage:
          double.tryParse(taxPercentage ?? '') ?? state.taxPercentage,
      brutProfit: double.tryParse(brutProfit ?? '') ?? state.brutProfit,
      receivedAt: receivedAt ?? state.receivedAt,
    );
  }
}

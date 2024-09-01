import 'package:freezed_annotation/freezed_annotation.dart';

part 'crowdfunding_form.freezed.dart';

@freezed
class CrowdfundingForm with _$CrowdfundingForm {
  const factory CrowdfundingForm({
    String? platformName,
    DateTime? receivedAt,
    double? taxPercentage,
    double? brutProfit,
  }) = _CrowdfundingForm;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'crowdfunding_form.freezed.dart';

@freezed
abstract class CrowdfundingForm with _$CrowdfundingForm {
  const factory CrowdfundingForm({
    required String platformName,
    required DateTime receivedAt,
    required String brutProfit,
    String? taxPercentage,
    int? id,
  }) = _CrowdfundingForm;
}

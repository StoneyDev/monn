import 'package:freezed_annotation/freezed_annotation.dart';

part 'payout_report_data.freezed.dart';

@freezed
abstract class PayoutReportData with _$PayoutReportData {
  const factory PayoutReportData({
    @Default(0.0) double totalNetProfit,
    @Default(0.0) double totalTaxProfit,
    @Default(0.0) double totalLoss,
    @Default(0.0) double finalAmount,
  }) = _PayoutReportData;
}

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pea_repository.g.dart';

@riverpod
Future<PayoutReportData> getPayoutReportPea(Ref ref) async {
  final startAmount = await ref.watch(
    getSavingsProvider(type: SavingsType.pea).selectAsync(
      (data) => data?.startAmount ?? 0,
    ),
  );

  return PayoutReportData(finalAmount: startAmount);
}

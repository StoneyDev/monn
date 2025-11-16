import 'dart:async';

import 'package:isar_community/isar.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/pea/domain/pea.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pea_repository.g.dart';

class PeaRepository {
  const PeaRepository(this._localDB);

  final Isar _localDB;

  Future<Pea?> getPea() => _localDB.peas.get(1);

  Future<void> editPea(Pea newPea) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.peas.put(newPea);
    });
  }
}

@Riverpod(keepAlive: true)
PeaRepository peaRepository(Ref ref) {
  return PeaRepository(LocalDatabase().database);
}

@riverpod
Future<Pea?> getPea(Ref ref) {
  final repository = ref.watch(peaRepositoryProvider);
  return repository.getPea();
}

@riverpod
Future<PayoutReportData> getPayoutReportPea(Ref ref) async {
  final data = await Future.wait([
    ref.watch(
      getSavingsProvider(type: SavingsType.pea).selectAsync(
        (data) => data?.startAmount ?? 0.0,
      ),
    ),
    ref.refresh(getPeaProvider.future),
  ]);

  final startAmount = data[0]! as double;
  final pea = data[1] as Pea?;

  if (pea == null) return PayoutReportData(finalAmount: startAmount);

  final currentValue = (pea.lastPrice ?? 0) * (pea.equity ?? 0);
  final latentValue =
      currentValue - ((pea.costAverage ?? 0) * (pea.equity ?? 0));

  return PayoutReportData(
    finalAmount: startAmount + latentValue,
    totalNetProfit: latentValue,
  );
}

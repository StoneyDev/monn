import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/shared/domain/payout_report_data.dart';
import 'package:monn/shared/domain/savings.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pea_repository.g.dart';

class PeaRepository {
  const PeaRepository(this._db);

  final AppDatabase _db;

  Future<PeaEntry?> getPea() {
    return (_db.select(
      _db.peaEntries,
    )..where((t) => t.id.equals(1))).getSingleOrNull();
  }

  Future<void> editPea(PeaEntriesCompanion newPea) {
    return _db.into(_db.peaEntries).insertOnConflictUpdate(newPea);
  }
}

@Riverpod(keepAlive: true)
PeaRepository peaRepository(Ref ref) {
  return PeaRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Future<PeaEntry?> getPea(Ref ref) {
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
    ref.watch(getPeaProvider.future),
  ]);

  final startAmount = data[0]! as double;
  final pea = data[1] as PeaEntry?;

  if (pea == null) return PayoutReportData(finalAmount: startAmount);

  final currentValue = (pea.lastPrice ?? 0) * (pea.equity ?? 0);
  final latentValue =
      currentValue - ((pea.costAverage ?? 0) * (pea.equity ?? 0));

  return PayoutReportData(
    finalAmount: startAmount + latentValue,
    totalNetProfit: latentValue,
  );
}

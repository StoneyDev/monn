import 'package:drift/drift.dart';
import 'package:monn/shared/domain/payout_report_data.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'life_insurance_repository.g.dart';

class LifeInsuranceRepository {
  const LifeInsuranceRepository(this._db);

  final AppDatabase _db;

  Stream<LifeInsuranceEntry?> watchLifeInsurance() {
    return (_db.select(
      _db.lifeInsuranceEntries,
    )..where((t) => t.id.equals(1))).watchSingleOrNull();
  }

  Future<void> editLifeInsurance(LifeInsuranceEntriesCompanion lifeInsurance) {
    return _db
        .into(_db.lifeInsuranceEntries)
        .insertOnConflictUpdate(
          lifeInsurance.copyWith(id: const Value(1)),
        );
  }
}

@Riverpod(keepAlive: true)
LifeInsuranceRepository lifeInsuranceRepository(Ref ref) {
  return LifeInsuranceRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<LifeInsuranceEntry?> watchLifeInsurance(Ref ref) {
  final repository = ref.watch(lifeInsuranceRepositoryProvider);
  return repository.watchLifeInsurance();
}

@riverpod
Stream<PayoutReportData> watchPayoutReportLifeInsurance(Ref ref) async* {
  final repository = ref.watch(lifeInsuranceRepositoryProvider);

  await for (final lifeInsurance in repository.watchLifeInsurance()) {
    yield PayoutReportData(
      finalAmount: lifeInsurance == null
          ? 0
          : lifeInsurance.invested + lifeInsurance.interests,
    );
  }
}

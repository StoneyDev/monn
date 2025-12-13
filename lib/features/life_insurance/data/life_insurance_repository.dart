import 'package:isar_community/isar.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/life_insurance/domain/life_insurance.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'life_insurance_repository.g.dart';

class LifeInsuranceRepository {
  const LifeInsuranceRepository(this._localDB);

  final Isar _localDB;

  Stream<LifeInsurance?> watchLifeInsurance() {
    return _localDB.lifeInsurances.watchObject(1, fireImmediately: true);
  }

  Future<void> editLifeInsurance(LifeInsurance lifeInsurance) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.lifeInsurances.put(lifeInsurance..id = 1);
    });
  }
}

@Riverpod(keepAlive: true)
LifeInsuranceRepository lifeInsuranceRepository(Ref ref) {
  return LifeInsuranceRepository(LocalDatabase().database);
}

@riverpod
Stream<LifeInsurance?> watchLifeInsurance(Ref ref) {
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

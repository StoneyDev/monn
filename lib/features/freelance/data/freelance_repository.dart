import 'package:isar_community/isar.dart';
import 'package:monn/features/freelance/domain/freelance.dart';
import 'package:monn/features/freelance/domain/freelance_calculator.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'freelance_repository.g.dart';

class FreelanceRepository {
  const FreelanceRepository(this._localDB);

  final Isar _localDB;

  Stream<Freelance?> watchFreelance() =>
      _localDB.freelances.watchObject(1, fireImmediately: true);

  Future<void> editFreelance(Freelance freelance) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.freelances.put(freelance..id = 1);
    });
  }
}

@Riverpod(keepAlive: true)
FreelanceRepository freelanceRepository(Ref ref) {
  return FreelanceRepository(LocalDatabase().database);
}

@riverpod
Stream<Freelance?> watchFreelance(Ref ref) {
  final repository = ref.watch(freelanceRepositoryProvider);
  return repository.watchFreelance();
}

@riverpod
FreelanceResult freelanceCalculation(Ref ref) {
  final freelance = ref.watch(watchFreelanceProvider).value;
  final annualRevenue = freelance?.annualRevenue ?? 0;
  return FreelanceCalculator.calculate(annualRevenue);
}

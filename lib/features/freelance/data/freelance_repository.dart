import 'package:drift/drift.dart';
import 'package:monn/features/freelance/domain/freelance_calculator.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'freelance_repository.g.dart';

class FreelanceRepository {
  const FreelanceRepository(this._db);

  final AppDatabase _db;

  Stream<FreelanceEntry?> watchFreelance() {
    return (_db.select(_db.freelanceEntries)..where((t) => t.id.equals(1)))
        .watchSingleOrNull();
  }

  Future<void> editFreelance(FreelanceEntriesCompanion freelance) {
    return _db.into(_db.freelanceEntries).insertOnConflictUpdate(
          freelance.copyWith(id: const Value(1)),
        );
  }
}

@Riverpod(keepAlive: true)
FreelanceRepository freelanceRepository(Ref ref) {
  return FreelanceRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<FreelanceEntry?> watchFreelance(Ref ref) {
  final repository = ref.watch(freelanceRepositoryProvider);
  return repository.watchFreelance();
}

@riverpod
FreelanceResult freelanceCalculation(Ref ref) {
  final freelance = ref.watch(watchFreelanceProvider).value;
  final annualRevenue = freelance?.annualRevenue ?? 0;
  return FreelanceCalculator.calculate(annualRevenue);
}

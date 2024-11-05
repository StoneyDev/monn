import 'package:isar/isar.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_repository.g.dart';

class SavingsRepository {
  const SavingsRepository(this._localDB);

  final Isar _localDB;

  Stream<List<Savings>> watchSavings() {
    final query = _localDB.savings.where().build();
    return query.watch(fireImmediately: true);
  }

  Stream<Savings> watchSaving(SavingsType type) {
    final query = _localDB.savings.filter().typeEqualTo(type).build();
    return query.watch(fireImmediately: true).expand((e) => e);
  }

  Future<void> editSaving(Savings newSaving) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.savings.put(newSaving);
    });
  }
}

@Riverpod(keepAlive: true)
SavingsRepository savingsRepository(SavingsRepositoryRef ref) {
  return SavingsRepository(LocalDatabase().database);
}

@riverpod
Stream<List<Savings>> watchSavings(WatchSavingsRef ref) {
  final repository = ref.watch(savingsRepositoryProvider);
  return repository.watchSavings();
}

@riverpod
Stream<Savings> watchSaving(
  WatchSavingRef ref, {
  required SavingsType type,
}) {
  final repository = ref.watch(savingsRepositoryProvider);
  return repository.watchSaving(type);
}

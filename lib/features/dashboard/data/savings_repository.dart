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

  Future<void> updateSaving(Savings newSaving) {
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
Stream<List<Savings>> watchSavings(WatchSavingsRef ref) async* {
  final repository = ref.watch(savingsRepositoryProvider);

  await for (final results in repository.watchSavings()) {
    yield results.isNotEmpty ? results : [];
  }
}

import 'package:isar_community/isar.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_repository.g.dart';

class SavingsRepository {
  const SavingsRepository(this._localDB);

  final Isar _localDB;

  Stream<List<Savings>> watchSavings({SavingsFilter? filter}) {
    final query = switch (filter) {
      SavingsFilter.sortByStartAmountAsc =>
        _localDB.savings.where().sortByStartAmount().build(),
      _ => _localDB.savings.where().sortByStartAmountDesc().build(),
    };

    return query.watch(fireImmediately: true);
  }

  Future<Savings?> getSavings(SavingsType type) {
    final query = _localDB.savings.filter().typeEqualTo(type).build();
    return query.findFirst();
  }

  Future<void> editSaving(Savings newSaving) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.savings.put(newSaving);
    });
  }
}

@Riverpod(keepAlive: true)
SavingsRepository savingsRepository(Ref ref) {
  return SavingsRepository(LocalDatabase().database);
}

@riverpod
Stream<List<Savings>> watchSavings(
  Ref ref, {
  SavingsFilter? filter,
}) {
  final repository = ref.watch(savingsRepositoryProvider);
  return repository.watchSavings(filter: filter);
}

@riverpod
Future<Savings?> getSavings(Ref ref, {required SavingsType type}) {
  final repository = ref.watch(savingsRepositoryProvider);
  return repository.getSavings(type);
}

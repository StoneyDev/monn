import 'package:isar_community/isar.dart';
import 'package:monn/features/expenses/domain/budget.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expenses_repository.g.dart';

class ExpensesRepository {
  const ExpensesRepository(this._db);

  final Isar _db;

  Future<Budget> getOrCreateBudget() async {
    var budget = await _db.budgets.get(1);

    if (budget == null) {
      budget = Budget();
      await _db.writeTxn(() => _db.budgets.put(budget!));
    }

    return budget;
  }

  Stream<Budget?> watchBudget() => _db.budgets
      .where()
      .idEqualTo(1)
      .watch(fireImmediately: true)
      .map((list) => list.firstOrNull);

  Future<void> saveBudget(Budget budget) =>
      _db.writeTxn(() => _db.budgets.put(budget));
}

@Riverpod(keepAlive: true)
ExpensesRepository expensesRepository(Ref ref) =>
    ExpensesRepository(LocalDatabase().database);

@riverpod
Stream<Budget?> watchBudget(Ref ref) =>
    ref.watch(expensesRepositoryProvider).watchBudget();

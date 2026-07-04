import 'package:drift/drift.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expenses_repository.g.dart';

class ExpensesRepository {
  const ExpensesRepository(this._db);

  final AppDatabase _db;

  Future<BudgetEntry> getOrCreateBudget() async {
    final existing = await (_db.select(_db.budgetEntries)
          ..where((t) => t.id.equals(1)))
        .getSingleOrNull();

    if (existing != null) return existing;

    await _db.into(_db.budgetEntries).insert(
          const BudgetEntriesCompanion(id: Value(1)),
        );
    return (_db.select(_db.budgetEntries)..where((t) => t.id.equals(1)))
        .getSingle();
  }

  Stream<BudgetEntry?> watchBudget() => (_db.select(_db.budgetEntries)
        ..where((t) => t.id.equals(1)))
      .watchSingleOrNull();

  Future<void> saveBudget(BudgetEntriesCompanion budget) =>
      _db.into(_db.budgetEntries).insertOnConflictUpdate(budget);
}

@Riverpod(keepAlive: true)
ExpensesRepository expensesRepository(Ref ref) =>
    ExpensesRepository(ref.watch(appDatabaseProvider));

@riverpod
Stream<BudgetEntry?> watchBudget(Ref ref) =>
    ref.watch(expensesRepositoryProvider).watchBudget();

import 'package:drift/drift.dart';
import 'package:monn/shared/domain/savings.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_repository.g.dart';

class SavingsRepository {
  const SavingsRepository(this._db);

  final AppDatabase _db;

  Stream<List<SavingsEntry>> watchSavings() =>
      _db.select(_db.savingsEntries).watch();

  Future<SavingsEntry?> getSavings(SavingsType type) {
    return (_db.select(
      _db.savingsEntries,
    )..where((t) => t.type.equals(type.name))).getSingleOrNull();
  }

  Future<void> editSaving(SavingsEntriesCompanion newSaving) {
    return _db.into(_db.savingsEntries).insertOnConflictUpdate(newSaving);
  }

  Future<void> setSavingsStartAmount(
    SavingsType type,
    double startAmount,
  ) async {
    final existing = await getSavings(type);
    await _writeSavingsStartAmount(type, startAmount, existing);
  }

  Future<void> incrementSavingsStartAmount(
    SavingsType type,
    double delta,
  ) async {
    final existing = await getSavings(type);
    await _writeSavingsStartAmount(
      type,
      (existing?.startAmount ?? 0) + delta,
      existing,
    );
  }

  Future<void> _writeSavingsStartAmount(
    SavingsType type,
    double startAmount,
    SavingsEntry? existing,
  ) {
    return editSaving(
      SavingsEntriesCompanion(
        id: existing != null ? Value(existing.id) : const Value.absent(),
        type: Value(type.name),
        startAmount: Value(startAmount),
      ),
    );
  }
}

@Riverpod(keepAlive: true)
SavingsRepository savingsRepository(Ref ref) {
  return SavingsRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<List<SavingsEntry>> watchSavings(Ref ref) {
  final repository = ref.watch(savingsRepositoryProvider);
  return repository.watchSavings();
}

@riverpod
Future<SavingsEntry?> getSavings(Ref ref, {required SavingsType type}) {
  final repository = ref.watch(savingsRepositoryProvider);
  return repository.getSavings(type);
}

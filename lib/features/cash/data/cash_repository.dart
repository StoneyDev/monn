import 'package:drift/drift.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cash_repository.g.dart';

class CashRepository {
  const CashRepository(this._db);

  final AppDatabase _db;

  Stream<List<CashEntry>> watchCashs() {
    final query = _db.select(_db.cashEntries)
      ..orderBy([(t) => OrderingTerm.desc(t.value)]);
    return query.watch();
  }

  Future<void> editCash(CashEntriesCompanion newCash) async {
    await _db.into(_db.cashEntries).insertOnConflictUpdate(newCash);
    await _syncStartAmount();
  }

  Future<void> deleteCash(int id) async {
    await (_db.delete(_db.cashEntries)..where((t) => t.id.equals(id))).go();
    await _syncStartAmount();
  }

  Future<void> _syncStartAmount() async {
    final cashs = await _db.select(_db.cashEntries).get();
    final total = cashs.fold<double>(0, (sum, e) => sum + e.value);
    final roundedTotal = double.parse(total.toStringAsFixed(2));

    final existingSavings = await (_db.select(_db.savingsEntries)
          ..where((t) => t.type.equals(SavingsType.cash.name)))
        .getSingleOrNull();

    await _db.into(_db.savingsEntries).insertOnConflictUpdate(
          SavingsEntriesCompanion(
            id: existingSavings != null
                ? Value(existingSavings.id)
                : const Value.absent(),
            type: Value(SavingsType.cash.name),
            startAmount: Value(roundedTotal),
          ),
        );
  }
}

@Riverpod(keepAlive: true)
CashRepository cashRepository(Ref ref) {
  return CashRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Future<void> deleteCash(Ref ref, int id) {
  final repository = ref.watch(cashRepositoryProvider);
  return repository.deleteCash(id);
}

@riverpod
Stream<List<CashEntry>> watchCashs(Ref ref) =>
    ref.watch(cashRepositoryProvider).watchCashs();

@riverpod
Stream<PayoutReportData> watchPayoutReportCash(Ref ref) async* {
  final repository = ref.watch(cashRepositoryProvider);

  await for (final results in repository.watchCashs()) {
    final total = results.fold<double>(0, (total, e) => total + e.value);

    yield PayoutReportData(
      finalAmount: double.parse(total.toStringAsFixed(2)),
    );
  }
}

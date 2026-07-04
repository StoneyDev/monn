import 'package:drift/drift.dart';
import 'package:monn/shared/domain/payout_report_data.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'per_repository.g.dart';

class PerRepository {
  const PerRepository(this._db);

  final AppDatabase _db;

  Stream<PerEntry?> watchPer() {
    return (_db.select(
      _db.perEntries,
    )..where((t) => t.id.equals(1))).watchSingleOrNull();
  }

  Future<void> editPer(PerEntriesCompanion per) {
    return _db
        .into(_db.perEntries)
        .insertOnConflictUpdate(per.copyWith(id: const Value(1)));
  }
}

@Riverpod(keepAlive: true)
PerRepository perRepository(Ref ref) {
  return PerRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<PerEntry?> watchPer(Ref ref) {
  final repository = ref.watch(perRepositoryProvider);
  return repository.watchPer();
}

@riverpod
Stream<PayoutReportData> watchPayoutReportPer(Ref ref) async* {
  final repository = ref.watch(perRepositoryProvider);

  await for (final per in repository.watchPer()) {
    yield PayoutReportData(
      finalAmount: per == null ? 0 : per.invested + per.interests,
    );
  }
}

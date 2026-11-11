import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'net_worth_history_repository.g.dart';

class NetWorthHistoryRepository {
  const NetWorthHistoryRepository(this._db);

  final AppDatabase _db;

  Future<void> record(double total, DateTime date) async {
    if (!total.isFinite) throw ArgumentError.value(total, 'total');
    await _db
        .into(_db.netWorthSnapshots)
        .insertOnConflictUpdate(
          NetWorthSnapshotsCompanion.insert(
            // UTC midnight keeps one row per calendar day across time zones.
            day: DateTime.utc(date.year, date.month, date.day),
            total: total,
          ),
        );
  }

  Stream<List<NetWorthSnapshot>> watchHistory() =>
      (_db.select(
        _db.netWorthSnapshots,
      )..orderBy([(t) => .asc(t.day)])).watch().map(
        (rows) => rows.map((row) {
          final day = row.day.toUtc();
          return row.copyWith(day: DateTime(day.year, day.month, day.day));
        }).toList(),
      );
}

@Riverpod(keepAlive: true)
NetWorthHistoryRepository netWorthHistoryRepository(Ref ref) =>
    NetWorthHistoryRepository(ref.watch(appDatabaseProvider));

@riverpod
Stream<List<NetWorthSnapshot>> watchNetWorthHistory(Ref ref) {
  return ref.watch(netWorthHistoryRepositoryProvider).watchHistory();
}

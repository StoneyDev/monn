import 'package:isar_community/isar.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/per/domain/per.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'per_repository.g.dart';

class PerRepository {
  const PerRepository(this._localDB);

  final Isar _localDB;

  Stream<Per?> watchPer() {
    return _localDB.pers.watchObject(1, fireImmediately: true);
  }

  Future<void> editPer(Per per) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.pers.put(per..id = 1);
    });
  }
}

@Riverpod(keepAlive: true)
PerRepository perRepository(Ref ref) {
  return PerRepository(LocalDatabase().database);
}

@riverpod
Stream<Per?> watchPer(Ref ref) {
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

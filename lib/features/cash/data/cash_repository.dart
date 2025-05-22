import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:monn/features/cash/domain/cash.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cash_repository.g.dart';

class CashRepository {
  const CashRepository(this._localDB);

  final Isar _localDB;

  Stream<List<Cash>> watchCashs() {
    final query = _localDB.cashs.where().sortByValueDesc().build();
    return query.watch(fireImmediately: true);
  }

  Future<void> editCash(Cash newCash) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.cashs.put(newCash);
    });
  }

  Future<void> deleteCash(int id) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.cashs.delete(id);
    });
  }
}

@Riverpod(keepAlive: true)
CashRepository cashRepository(Ref ref) {
  return CashRepository(LocalDatabase().database);
}

@riverpod
Future<void> deleteCash(Ref ref, int id) {
  final repository = ref.watch(cashRepositoryProvider);
  return repository.deleteCash(id);
}

@riverpod
Stream<List<Cash>> watchCashs(Ref ref) async* {
  final repository = ref.watch(cashRepositoryProvider);

  await for (final results in repository.watchCashs()) {
    yield results;
  }
}

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

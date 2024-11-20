import 'package:isar/isar.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/savings_book/domain/savings_book.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_book_repository.g.dart';

class SavingsBookRepository {
  const SavingsBookRepository(this._localDB);

  final Isar _localDB;

  Stream<List<SavingsBook>> watchSavingsBooks() {
    final query = _localDB.savingsBooks.where().build();
    return query.watch(fireImmediately: true);
  }

  Future<void> editSavingsBook(SavingsBook savingsBook) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.savingsBooks.put(savingsBook);
    });
  }
}

@Riverpod(keepAlive: true)
SavingsBookRepository savingsBookRepository(SavingsBookRepositoryRef ref) {
  return SavingsBookRepository(LocalDatabase().database);
}

@riverpod
Stream<List<SavingsBook>> watchSavingsBooks(WatchSavingsBooksRef ref) {
  final repository = ref.watch(savingsBookRepositoryProvider);
  return repository.watchSavingsBooks();
}

@riverpod
Stream<PayoutReportData> watchPayoutReportSavingsBook(
  WatchPayoutReportSavingsBookRef ref,
) async* {
  final repository = ref.watch(savingsBookRepositoryProvider);
  final startAmount = await ref.watch(
    getSavingsProvider(type: SavingsType.savingsBook).selectAsync(
      (data) => data?.startAmount ?? 0,
    ),
  );

  await for (final results in repository.watchSavingsBooks()) {
    final totalInterests = results.fold<double>(
      0,
      (total, e) => (total + e.interests) - e.withdrawal,
    );

    final finalAmount = totalInterests + startAmount;

    yield PayoutReportData(finalAmount: finalAmount);
  }
}

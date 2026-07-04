import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_book_repository.g.dart';

class SavingsBookRepository {
  const SavingsBookRepository(this._db);

  final AppDatabase _db;

  Stream<List<SavingsBookEntry>> watchSavingsBooks() {
    return _db.select(_db.savingsBookEntries).watch();
  }

  Future<void> editSavingsBook(SavingsBookEntriesCompanion savingsBook) {
    return _db.into(_db.savingsBookEntries).insertOnConflictUpdate(savingsBook);
  }
}

@Riverpod(keepAlive: true)
SavingsBookRepository savingsBookRepository(Ref ref) {
  return SavingsBookRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<List<SavingsBookEntry>> watchSavingsBooks(Ref ref) {
  final repository = ref.watch(savingsBookRepositoryProvider);
  return repository.watchSavingsBooks();
}

@riverpod
Stream<PayoutReportData> watchPayoutReportSavingsBook(Ref ref) async* {
  final repository = ref.watch(savingsBookRepositoryProvider);

  await for (final results in repository.watchSavingsBooks()) {
    final totalInterests = results.fold<double>(
      0,
      (total, e) => (total + e.interests + e.startAmount) - e.withdrawal,
    );

    yield PayoutReportData(finalAmount: totalInterests);
  }
}

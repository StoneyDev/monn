import 'package:isar/isar.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/pea/presentation/data/pea_repository.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_repository.g.dart';

class SavingsRepository {
  const SavingsRepository(this._localDB);

  final Isar _localDB;

  Stream<List<Savings>> watchSavings() {
    final query = _localDB.savings.where().build();
    return query.watch(fireImmediately: true);
  }

  Future<Savings?> getSavings(SavingsType type) {
    final query = _localDB.savings.filter().typeEqualTo(type).build();
    return query.findFirst();
  }

  Future<void> editSaving(Savings newSaving) {
    return _localDB.writeTxn<void>(() async {
      await _localDB.savings.put(newSaving);
    });
  }
}

@Riverpod(keepAlive: true)
SavingsRepository savingsRepository(SavingsRepositoryRef ref) {
  return SavingsRepository(LocalDatabase().database);
}

@riverpod
Stream<List<Savings>> watchSavings(WatchSavingsRef ref) {
  final repository = ref.watch(savingsRepositoryProvider);
  return repository.watchSavings();
}

@riverpod
Future<Savings?> getSavings(
  GetSavingsRef ref, {
  required SavingsType type,
}) {
  final repository = ref.watch(savingsRepositoryProvider);
  return repository.getSavings(type);
}

@riverpod
Future<double> watchPayoutReportSavings(WatchPayoutReportSavingsRef ref) async {
  final report = await Future.wait([
    ref.watch(
      watchPayoutReportCrowdfundingProvider.selectAsync(
        (crowdfunding) => crowdfunding.finalAmount,
      ),
    ),
    ref.watch(
      watchPayoutReportCryptoProvider.selectAsync(
        (crypto) => crypto.finalAmount,
      ),
    ),
    ref.watch(
      watchPayoutReportSavingsBookProvider.selectAsync(
        (savingsBook) => savingsBook.finalAmount,
      ),
    ),
    ref.watch(
      watchPayoutReportReitProvider.selectAsync(
        (reit) => reit.finalAmount,
      ),
    ),
    ref.watch(
      getPayoutReportPeaProvider.selectAsync(
        (pea) => pea.finalAmount,
      ),
    ),
  ]);

  final total = report.fold<double>(0, (total, value) => total + value);

  return total;
}

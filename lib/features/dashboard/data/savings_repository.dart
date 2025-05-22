import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:monn/features/cash/data/cash_repository.dart';
import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/cryptocurrency/data/coin_market_cap_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/pea/data/google_finance_repository.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'savings_repository.g.dart';

class SavingsRepository {
  const SavingsRepository(this._localDB);

  final Isar _localDB;

  Stream<List<Savings>> watchSavings({SavingsFilter? filter}) {
    final query = switch (filter) {
      SavingsFilter.sortByStartAmountAsc =>
        _localDB.savings.where().sortByStartAmount().build(),
      _ => _localDB.savings.where().sortByStartAmountDesc().build(),
    };

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
SavingsRepository savingsRepository(Ref ref) {
  return SavingsRepository(LocalDatabase().database);
}

@riverpod
Stream<List<Savings>> watchSavings(
  Ref ref, {
  SavingsFilter? filter,
}) {
  final repository = ref.watch(savingsRepositoryProvider);
  return repository.watchSavings(filter: filter);
}

@riverpod
Future<Savings?> getSavings(Ref ref, {required SavingsType type}) {
  final repository = ref.watch(savingsRepositoryProvider);
  return repository.getSavings(type);
}

@riverpod
Future<double> watchPayoutReportSavings(Ref ref) async {
  // Update data on app startup
  ref
    ..invalidate(getEtfPriceMarketProvider(stock: 'ESE:EPA'))
    ..invalidate(getCryptoPriceMarketProvider);

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
    ref.watch(
      watchPayoutReportCounterStrikeProvider.selectAsync(
        (cs) => cs.finalAmount,
      ),
    ),
    ref.watch(
      watchPayoutReportCashProvider.selectAsync(
        (cash) => cash.finalAmount,
      ),
    ),
  ]);

  final total = report.fold<double>(0, (total, value) => total + value);

  return total;
}

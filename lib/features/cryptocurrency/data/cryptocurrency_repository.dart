import 'package:isar/isar.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:monn/shared/widgets/charts/chart.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cryptocurrency_repository.g.dart';

class CryptocurrencyRepository {
  const CryptocurrencyRepository(this._localDB);

  final Isar _localDB;

  Stream<List<Cryptocurrency>> watchCryptocurrencies() {
    final query = _localDB.cryptocurrencys.where().build();
    return query.watch(fireImmediately: true);
  }

  Future<void> editCryptocurrency({
    required Cryptocurrency crypto,
    required CryptocurrencyTransaction transaction,
  }) async {
    crypto.transactions.add(transaction);

    return _localDB.writeTxn<void>(() async {
      await _localDB.cryptocurrencys.put(crypto);
      await _localDB.cryptocurrencyTransactions.put(transaction);
      await crypto.transactions.save();
    });
  }
}

@Riverpod(keepAlive: true)
CryptocurrencyRepository cryptocurrencyRepository(
  CryptocurrencyRepositoryRef ref,
) {
  return CryptocurrencyRepository(LocalDatabase().database);
}

@riverpod
Stream<List<Cryptocurrency>> watchCryptocurrencies(
  WatchCryptocurrenciesRef ref,
) {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);
  return repository.watchCryptocurrencies();
}

@riverpod
Stream<Chart> watchCryptoChart(WatchCryptoChartRef ref) async* {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);

  await for (final results in repository.watchCryptocurrencies()) {
    final totalAmount = results.isEmpty
        ? 0.0
        : results.fold<double>(0, (total, crypto) => total + crypto.totalFiat);

    final data = results.isEmpty
        ? [const ChartData(portion: 1, color: AppColors.extraLightGray)]
        : results.map((crypto) {
            final total = totalAmount == 0 ? 1 : totalAmount;
            final portion = (crypto.totalFiat * 100) / total;

            return ChartData(
              portion: double.parse(portion.toStringAsFixed(2)),
              color: crypto.type.color,
            );
          }).toList();

    yield Chart(totalAmount: totalAmount, data: data);
  }
}

@riverpod
Stream<PayoutReportData> watchPayoutReportCrypto(
  WatchPayoutReportCryptoRef ref,
) async* {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);

  await for (final results in repository.watchCryptocurrencies()) {
    final finalAmount =
        results.fold<double>(0, (total, crypto) => total + crypto.totalFiat);

    yield PayoutReportData(finalAmount: finalAmount);
  }
}

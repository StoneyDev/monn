import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/settings/presentation/settings_screen/controllers/theme_switch_controller.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:monn/shared/widgets/charts/chart.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cryptocurrency_repository.g.dart';

class CryptocurrencyRepository {
  const CryptocurrencyRepository(this._localDB);

  final Isar _localDB;

  Stream<List<Cryptocurrency>> watchCryptocurrencies() {
    final query =
        _localDB.cryptocurrencys.filter().totalCryptoGreaterThan(0).build();
    return query.watch(fireImmediately: true);
  }

  Future<Cryptocurrency?> getCryptocurrency(CryptoType type) {
    final query = _localDB.cryptocurrencys.filter().typeEqualTo(type).build();
    return query.findFirst();
  }

  Future<void> editCryptocurrency({
    required Cryptocurrency crypto,
    CryptocurrencyTransaction? transaction,
  }) async {
    if (transaction == null) {
      await _localDB.writeTxn<void>(() async {
        await _localDB.cryptocurrencys.put(crypto);
      });
    } else {
      crypto.transactions.add(transaction);

      await _localDB.writeTxn<void>(() async {
        await _localDB.cryptocurrencys.put(crypto);
        await _localDB.cryptocurrencyTransactions.put(transaction);
        await crypto.transactions.save();
      });
    }
  }
}

@Riverpod(keepAlive: true)
CryptocurrencyRepository cryptocurrencyRepository(Ref ref) {
  return CryptocurrencyRepository(LocalDatabase().database);
}

@riverpod
Stream<List<Cryptocurrency>> watchCryptocurrencies(Ref ref) {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);
  return repository.watchCryptocurrencies();
}

@riverpod
Future<Cryptocurrency> getCryptocurrency(
  Ref ref,
  CryptoType type,
) async {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);
  final crypto = await repository.getCryptocurrency(type);

  return crypto ?? Cryptocurrency()
    ..type = type;
}

@riverpod
Stream<Chart> watchCryptoChart(Ref ref) async* {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);
  final theme = await ref.watch(
    themeSwitchControllerProvider.selectAsync((theme) => theme),
  );

  await for (final results in repository.watchCryptocurrencies()) {
    final (totalCryptoValue, totalLog) = results.fold<(double, double)>(
      (0, 0),
      (totals, crypto) => (
        totals.$1 + (crypto.totalCrypto * crypto.priceMarket),
        totals.$2 + log(crypto.totalCrypto),
      ),
    );

    final data = totalCryptoValue > 0
        ? results.map((crypto) {
            final logValue = log(crypto.totalCrypto);
            final portion = (logValue * 100) / totalLog;

            return ChartData(
              portion: double.parse(portion.toStringAsFixed(2)),
              color: crypto.type.color,
            );
          }).toList()
        : [
            ChartData(
              portion: 100,
              color: theme == ThemeMode.dark
                  ? AppColors.gray300
                  : AppColors.white600,
            ),
          ];

    yield Chart(
      totalAmount: double.parse(totalCryptoValue.toStringAsFixed(2)),
      data: data,
    );
  }
}

@riverpod
Stream<PayoutReportData> watchPayoutReportCrypto(Ref ref) async* {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);

  await for (final results in repository.watchCryptocurrencies()) {
    final finalAmount = results.fold<double>(
      0,
      (total, crypto) => total + (crypto.totalCrypto * crypto.priceMarket),
    );

    yield PayoutReportData(
      finalAmount: double.parse(finalAmount.toStringAsFixed(2)),
    );
  }
}

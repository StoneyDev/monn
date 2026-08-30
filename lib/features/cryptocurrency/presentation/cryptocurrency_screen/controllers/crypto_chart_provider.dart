import 'dart:math';

import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/cryptocurrency/presentation/cryptocurrency_ui.dart';
import 'package:monn/shared/widgets/charts/chart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crypto_chart_provider.g.dart';

@riverpod
Stream<Chart> watchCryptoChart(Ref ref) async* {
  final repository = ref.watch(cryptocurrencyRepositoryProvider);

  await for (final results in repository.watchCryptocurrencies()) {
    final (totalCryptoValue, totalLog) = results.fold<(double, double)>(
      (0, 0),
      (totals, crypto) => (
        totals.$1 + (crypto.totalCrypto * crypto.priceMarket),
        totals.$2 + log((crypto.totalCrypto * crypto.priceMarket) + 1.2),
      ),
    );

    final data = results.map((crypto) {
      final logValue = log(
        (crypto.totalCrypto * crypto.priceMarket) + 1.2,
      );
      final portion = (logValue * 100) / totalLog;

      return ChartData(
        portion: double.parse(portion.toStringAsFixed(2)),
        color: crypto.cryptoType.color,
      );
    }).toList();

    yield Chart(
      totalAmount: double.parse(totalCryptoValue.toStringAsFixed(2)),
      data: data,
    );
  }
}

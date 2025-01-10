import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cryptocurrency/data/coin_cap_api.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coin_cap_repository.g.dart';

class CoinCapRepository {
  const CoinCapRepository(this._api);

  final CoinCapApi _api;

  Future<double> getCryptoPriceMarket(String id) async {
    final response = await _api.getCryptoPriceMarket(id);
    return response.data.priceUsd;
  }
}

@Riverpod(keepAlive: true)
CoinCapRepository coinCapRepository(Ref ref) {
  return CoinCapRepository(CoinCapApi(Dio()));
}

@riverpod
Future<double> getCryptoPriceMarket(
  Ref ref, {
  required String id,
  Cryptocurrency? crypto,
}) async {
  final repository = ref.watch(coinCapRepositoryProvider);
  final cryptoRepository = ref.watch(cryptocurrencyRepositoryProvider);

  final now = DateTime.now();
  final lastUpdate = (crypto?.lastUpdate ?? DateTime(now.year)).add(
    const Duration(minutes: 30),
  );
  double? priceMarket;

  if (now.isAfter(lastUpdate)) {
    priceMarket = await repository.getCryptoPriceMarket(id);

    if (crypto != null) {
      await cryptoRepository.editCryptocurrency(
        crypto: crypto
          ..priceMarket = priceMarket
          ..lastUpdate = now,
      );
    }
  }

  return priceMarket ?? crypto!.priceMarket;
}

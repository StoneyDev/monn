import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/pea/data/google_finance_api.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/domain/pea.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_finance_repository.g.dart';

class GoogleFinanceRepository {
  const GoogleFinanceRepository(this._api);

  final GoogleFinanceApi _api;

  Future<double> getEtfPriceMarket(String stock) async {
    final response = await _api.getEftPriceMarket(stock);
    final regex = RegExp('data-last-price="([^"]+)"');
    final price = regex.firstMatch(response)?.group(1) ?? '0';

    return double.tryParse(price)!;
  }
}

@Riverpod(keepAlive: true)
GoogleFinanceRepository googleFinanceRepository(Ref ref) {
  return GoogleFinanceRepository(GoogleFinanceApi(Dio()));
}

@riverpod
Future<double> getEtfPriceMarket(Ref ref, {required String stock}) async {
  final googleFinanceRepository = ref.watch(googleFinanceRepositoryProvider);
  final peaRepository = ref.watch(peaRepositoryProvider);
  final pea = await ref.refresh(getPeaProvider.future);

  final now = DateTime.now();
  final lastUpdate = (pea?.lastUpdate ?? DateTime(now.year)).add(
    const Duration(minutes: 30),
  );
  double? priceMarket;

  if (now.isAfter(lastUpdate)) {
    priceMarket = await googleFinanceRepository.getEtfPriceMarket(stock);

    await peaRepository.editPea(
      pea ?? Pea()
        ..lastPrice = priceMarket
        ..lastUpdate = now,
    );
  }

  return priceMarket ?? pea?.lastPrice ?? 0;
}

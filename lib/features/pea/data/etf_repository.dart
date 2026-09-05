import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:monn/features/pea/data/etf_api.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/shared/local/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'etf_repository.g.dart';

const _apiKey = String.fromEnvironment('ALPHA_VANTAGE_KEY');

class EtfRepository {
  const EtfRepository(this._api);

  final EtfApi _api;

  Future<double?> getEtfPriceMarket() async {
    final response = await _api.getQuote('GLOBAL_QUOTE', 'ESE.PAR', _apiKey);
    final priceStr = response.globalQuote?.price;

    if (priceStr == null) return null;

    return double.tryParse(priceStr);
  }
}

@Riverpod(keepAlive: true)
EtfRepository etfRepository(Ref ref) {
  return EtfRepository(EtfApi(Dio()));
}

@riverpod
Future<double> getEtfPriceMarket(Ref ref) async {
  final etfRepository = ref.read(etfRepositoryProvider);
  final peaRepository = ref.read(peaRepositoryProvider);
  final pea = await ref.watch(getPeaProvider.future);

  if (!ref.mounted) return 0;

  final now = DateTime.now();
  final lastUpdate = (pea?.lastUpdate ?? DateTime(now.year)).add(
    const Duration(hours: 1),
  );

  if (now.isAfter(lastUpdate)) {
    final priceMarket = await etfRepository.getEtfPriceMarket();

    if (priceMarket != null) {
      await peaRepository.editPea(
        PeaEntriesCompanion(
          id: Value(pea?.id ?? 1),
          equity: Value(pea?.equity),
          costAverage: Value(pea?.costAverage),
          lastPrice: Value(priceMarket),
          lastUpdate: Value(now),
        ),
      );

      if (!ref.mounted) return priceMarket;

      ref.invalidate(getPeaProvider);

      return priceMarket;
    }
  }

  return pea?.lastPrice ?? 0;
}

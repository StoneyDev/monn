import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:monn/features/pea/data/etf_api.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/shared/local/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'etf_repository.g.dart';

const _apiKey = String.fromEnvironment('ALPHA_VANTAGE_KEY');

class EtfRepository {
  EtfRepository(this._api);

  final EtfApi _api;

  Future<void> _queue = .value();

  Future<double?> getEtfPriceMarket(String symbol) {
    final price = _queue.then((_) => _fetchPrice(symbol));
    _queue = price
        .then<void>((_) {}, onError: (_) {})
        .then((_) => Future<void>.delayed(const Duration(seconds: 1)));

    return price;
  }

  Future<double?> _fetchPrice(String symbol) async {
    final response = await _api.getQuote('GLOBAL_QUOTE', symbol, _apiKey);
    final quote = response.globalQuote;

    // No quote at all: Alpha Vantage refused the request (spent quota).
    if (quote == null) return null;

    final priceStr = quote.price;
    // An empty quote: Alpha Vantage does not know this ticker.
    if (priceStr == null) throw FormatException('Unknown ticker', symbol);

    return double.tryParse(priceStr);
  }
}

@Riverpod(keepAlive: true)
EtfRepository etfRepository(Ref ref) {
  const timeout = Duration(seconds: 15);
  return EtfRepository(
    EtfApi(Dio(BaseOptions(connectTimeout: timeout, receiveTimeout: timeout))),
  );
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

  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: <String>{'lastEtfEmptyQuote'},
    ),
  );
  // Alpha Vantage answers without a price once its daily quota is spent;
  // asking again on every resume would keep it spent.
  final lastEmptyQuote = prefs.getString('lastEtfEmptyQuote');
  final retryAt = lastEmptyQuote != null
      ? DateTime.parse(lastEmptyQuote).add(const Duration(hours: 1))
      : lastUpdate;

  if (now.isAfter(lastUpdate) && now.isAfter(retryAt)) {
    double? priceMarket;
    try {
      priceMarket = await etfRepository.getEtfPriceMarket('ESE.PAR');
    } on FormatException {
      // An empty quote for the PEA's ETF waits like a spent quota.
    }

    if (priceMarket != null) {
      await peaRepository.editPea(
        PeaEntriesCompanion(
          id: Value(pea?.id ?? 1),
          lastPrice: Value(priceMarket),
          lastUpdate: Value(now),
        ),
      );

      if (!ref.mounted) return priceMarket;

      ref.invalidate(getPeaProvider);

      return priceMarket;
    }

    await prefs.setString('lastEtfEmptyQuote', now.toIso8601String());
  }

  return pea?.lastPrice ?? 0;
}

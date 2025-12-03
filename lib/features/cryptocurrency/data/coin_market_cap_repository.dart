import 'package:dio/dio.dart';
import 'package:monn/features/cryptocurrency/data/coin_market_cap_api.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/cryptocurrency/domain/coin_market_cap.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'coin_market_cap_repository.g.dart';

class CoinMarketCapRepository {
  const CoinMarketCapRepository(this._api);

  final CoinMarketCapApi _api;

  Future<List<CoinMarketCapCrypto>> getCryptoPriceMarket(String slug) async {
    final response = await _api.getCryptoPriceMarket(slug);
    final cryptocurrencies = response.data.entries.map((e) => e.value).toList();
    return cryptocurrencies;
  }
}

@Riverpod(keepAlive: true)
CoinMarketCapRepository coinMarketCapRepository(Ref ref) {
  final dio = Dio();
  dio.options.headers['X-CMC_PRO_API_KEY'] = const String.fromEnvironment(
    'COIN_MARKET_CAP_KEY',
  );
  return CoinMarketCapRepository(CoinMarketCapApi(dio));
}

@riverpod
Future<List<Cryptocurrency>> getCryptoPriceMarket(Ref ref) async {
  final repository = ref.watch(coinMarketCapRepositoryProvider);
  final cryptoRepository = ref.watch(cryptocurrencyRepositoryProvider);
  final now = DateTime.now();
  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: <String>{'lastCryptoUpdate'},
    ),
  );

  final lastCryptoUpdate = prefs.getString('lastCryptoUpdate');
  final lastUpdate = lastCryptoUpdate != null
      ? DateTime.parse(lastCryptoUpdate).add(const Duration(minutes: 30))
      : now.subtract(const Duration(hours: 1));

  var cryptoMarket = <CoinMarketCapCrypto>[];

  if (now.isAfter(lastUpdate)) {
    cryptoMarket = await repository.getCryptoPriceMarket(
      CryptoType.values.map((e) => e.name.toKebabCase()).join(','),
    );
    await prefs.setString('lastCryptoUpdate', now.toIso8601String());
  }

  final cryptocurrencies = <Cryptocurrency>[];
  final cryptoMarketMap = {for (final e in cryptoMarket) e.slug: e};

  for (final cryptoType in CryptoType.values) {
    final crypto = await ref.watch(
      getCryptocurrencyProvider(cryptoType).selectAsync((crypto) => crypto),
    );

    if (cryptoMarket.isNotEmpty) {
      final cryptoMarket = cryptoMarketMap[cryptoType.name.toKebabCase()];

      final newCrypto = crypto
        ..priceMarket = cryptoMarket!.quote.priceUsd.price
        ..lastUpdate = now;
      await cryptoRepository.editCryptocurrency(crypto: newCrypto);
      cryptocurrencies.add(newCrypto);
    } else {
      cryptocurrencies.add(crypto);
    }
  }

  return cryptocurrencies;
}

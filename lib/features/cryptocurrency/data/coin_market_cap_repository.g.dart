// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_market_cap_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coinMarketCapRepository)
const coinMarketCapRepositoryProvider = CoinMarketCapRepositoryProvider._();

final class CoinMarketCapRepositoryProvider
    extends
        $FunctionalProvider<
          CoinMarketCapRepository,
          CoinMarketCapRepository,
          CoinMarketCapRepository
        >
    with $Provider<CoinMarketCapRepository> {
  const CoinMarketCapRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coinMarketCapRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coinMarketCapRepositoryHash();

  @$internal
  @override
  $ProviderElement<CoinMarketCapRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CoinMarketCapRepository create(Ref ref) {
    return coinMarketCapRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoinMarketCapRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoinMarketCapRepository>(value),
    );
  }
}

String _$coinMarketCapRepositoryHash() =>
    r'29fd3483b68c550210e7285f7ad54f6f1feaa73c';

@ProviderFor(getCryptoPriceMarket)
const getCryptoPriceMarketProvider = GetCryptoPriceMarketProvider._();

final class GetCryptoPriceMarketProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CryptocurrencyEntry>>,
          List<CryptocurrencyEntry>,
          FutureOr<List<CryptocurrencyEntry>>
        >
    with
        $FutureModifier<List<CryptocurrencyEntry>>,
        $FutureProvider<List<CryptocurrencyEntry>> {
  const GetCryptoPriceMarketProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCryptoPriceMarketProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCryptoPriceMarketHash();

  @$internal
  @override
  $FutureProviderElement<List<CryptocurrencyEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CryptocurrencyEntry>> create(Ref ref) {
    return getCryptoPriceMarket(ref);
  }
}

String _$getCryptoPriceMarketHash() =>
    r'3d5a426670920054fce6dc44dcdfd5a50e47a624';

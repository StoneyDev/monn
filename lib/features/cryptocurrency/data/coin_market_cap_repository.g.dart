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
          AsyncValue<List<Cryptocurrency>>,
          List<Cryptocurrency>,
          FutureOr<List<Cryptocurrency>>
        >
    with
        $FutureModifier<List<Cryptocurrency>>,
        $FutureProvider<List<Cryptocurrency>> {
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
  $FutureProviderElement<List<Cryptocurrency>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Cryptocurrency>> create(Ref ref) {
    return getCryptoPriceMarket(ref);
  }
}

String _$getCryptoPriceMarketHash() =>
    r'92313ee49ef9d571f94558cbefa589ba062b22ef';

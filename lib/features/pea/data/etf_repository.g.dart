// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etf_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(etfRepository)
const etfRepositoryProvider = EtfRepositoryProvider._();

final class EtfRepositoryProvider
    extends $FunctionalProvider<EtfRepository, EtfRepository, EtfRepository>
    with $Provider<EtfRepository> {
  const EtfRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'etfRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$etfRepositoryHash();

  @$internal
  @override
  $ProviderElement<EtfRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  EtfRepository create(Ref ref) {
    return etfRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EtfRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EtfRepository>(value),
    );
  }
}

String _$etfRepositoryHash() => r'e62d4f0af112530f98d3d39e860c2afaec1b4e95';

@ProviderFor(getEtfPriceMarket)
const getEtfPriceMarketProvider = GetEtfPriceMarketProvider._();

final class GetEtfPriceMarketProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  const GetEtfPriceMarketProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getEtfPriceMarketProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getEtfPriceMarketHash();

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return getEtfPriceMarket(ref);
  }
}

String _$getEtfPriceMarketHash() => r'950d47b0db3081fd7568830b7b20f8a32f7fd53e';

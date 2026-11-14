// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'etf_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(etfRepository)
final etfRepositoryProvider = EtfRepositoryProvider._();

final class EtfRepositoryProvider
    extends $FunctionalProvider<EtfRepository, EtfRepository, EtfRepository>
    with $Provider<EtfRepository> {
  EtfRepositoryProvider._()
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

String _$etfRepositoryHash() => r'e8ff6f83ecb039bb31d5fbe948614948ede59801';

@ProviderFor(getEtfPriceMarket)
final getEtfPriceMarketProvider = GetEtfPriceMarketProvider._();

final class GetEtfPriceMarketProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  GetEtfPriceMarketProvider._()
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

String _$getEtfPriceMarketHash() => r'0e189f1e324cfeaaa6f04e93d29e20ada1b804b7';

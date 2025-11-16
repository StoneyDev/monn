// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptocurrency_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cryptocurrencyRepository)
const cryptocurrencyRepositoryProvider = CryptocurrencyRepositoryProvider._();

final class CryptocurrencyRepositoryProvider
    extends
        $FunctionalProvider<
          CryptocurrencyRepository,
          CryptocurrencyRepository,
          CryptocurrencyRepository
        >
    with $Provider<CryptocurrencyRepository> {
  const CryptocurrencyRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cryptocurrencyRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cryptocurrencyRepositoryHash();

  @$internal
  @override
  $ProviderElement<CryptocurrencyRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CryptocurrencyRepository create(Ref ref) {
    return cryptocurrencyRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CryptocurrencyRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CryptocurrencyRepository>(value),
    );
  }
}

String _$cryptocurrencyRepositoryHash() =>
    r'1b02d44b0048a8fe0e6d9186929203ace4b6e43f';

@ProviderFor(watchCryptocurrencies)
const watchCryptocurrenciesProvider = WatchCryptocurrenciesProvider._();

final class WatchCryptocurrenciesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Cryptocurrency>>,
          List<Cryptocurrency>,
          Stream<List<Cryptocurrency>>
        >
    with
        $FutureModifier<List<Cryptocurrency>>,
        $StreamProvider<List<Cryptocurrency>> {
  const WatchCryptocurrenciesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchCryptocurrenciesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchCryptocurrenciesHash();

  @$internal
  @override
  $StreamProviderElement<List<Cryptocurrency>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Cryptocurrency>> create(Ref ref) {
    return watchCryptocurrencies(ref);
  }
}

String _$watchCryptocurrenciesHash() =>
    r'7d3db601fd12d61dd01ab55609cf157ee9010f6a';

@ProviderFor(getCryptocurrency)
const getCryptocurrencyProvider = GetCryptocurrencyFamily._();

final class GetCryptocurrencyProvider
    extends
        $FunctionalProvider<
          AsyncValue<Cryptocurrency>,
          Cryptocurrency,
          FutureOr<Cryptocurrency>
        >
    with $FutureModifier<Cryptocurrency>, $FutureProvider<Cryptocurrency> {
  const GetCryptocurrencyProvider._({
    required GetCryptocurrencyFamily super.from,
    required CryptoType super.argument,
  }) : super(
         retry: null,
         name: r'getCryptocurrencyProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getCryptocurrencyHash();

  @override
  String toString() {
    return r'getCryptocurrencyProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Cryptocurrency> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Cryptocurrency> create(Ref ref) {
    final argument = this.argument as CryptoType;
    return getCryptocurrency(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCryptocurrencyProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getCryptocurrencyHash() => r'21b065fd53f7814b6e0d77b3b19cf1847edc3709';

final class GetCryptocurrencyFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Cryptocurrency>, CryptoType> {
  const GetCryptocurrencyFamily._()
    : super(
        retry: null,
        name: r'getCryptocurrencyProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetCryptocurrencyProvider call(CryptoType type) =>
      GetCryptocurrencyProvider._(argument: type, from: this);

  @override
  String toString() => r'getCryptocurrencyProvider';
}

@ProviderFor(watchCryptoChart)
const watchCryptoChartProvider = WatchCryptoChartProvider._();

final class WatchCryptoChartProvider
    extends $FunctionalProvider<AsyncValue<Chart>, Chart, Stream<Chart>>
    with $FutureModifier<Chart>, $StreamProvider<Chart> {
  const WatchCryptoChartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchCryptoChartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchCryptoChartHash();

  @$internal
  @override
  $StreamProviderElement<Chart> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Chart> create(Ref ref) {
    return watchCryptoChart(ref);
  }
}

String _$watchCryptoChartHash() => r'4997850470e5a362eee30787cca53562f976496d';

@ProviderFor(watchPayoutReportCrypto)
const watchPayoutReportCryptoProvider = WatchPayoutReportCryptoProvider._();

final class WatchPayoutReportCryptoProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  const WatchPayoutReportCryptoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPayoutReportCryptoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPayoutReportCryptoHash();

  @$internal
  @override
  $StreamProviderElement<PayoutReportData> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PayoutReportData> create(Ref ref) {
    return watchPayoutReportCrypto(ref);
  }
}

String _$watchPayoutReportCryptoHash() =>
    r'32747a4a42720493cfbdd8ecc4fe87d3918dd310';

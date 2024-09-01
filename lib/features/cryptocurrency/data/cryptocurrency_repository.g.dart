// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cryptocurrency_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cryptocurrencyRepositoryHash() =>
    r'0f08e7cb4d08d964a8823684beb310dccc2d5bd1';

/// See also [cryptocurrencyRepository].
@ProviderFor(cryptocurrencyRepository)
final cryptocurrencyRepositoryProvider =
    Provider<CryptocurrencyRepository>.internal(
  cryptocurrencyRepository,
  name: r'cryptocurrencyRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cryptocurrencyRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CryptocurrencyRepositoryRef = ProviderRef<CryptocurrencyRepository>;
String _$watchCryptocurrenciesHash() =>
    r'2452c3e060f043f196b0127d35e2c429969befb9';

/// See also [watchCryptocurrencies].
@ProviderFor(watchCryptocurrencies)
final watchCryptocurrenciesProvider =
    AutoDisposeStreamProvider<List<Cryptocurrency>>.internal(
  watchCryptocurrencies,
  name: r'watchCryptocurrenciesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchCryptocurrenciesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchCryptocurrenciesRef
    = AutoDisposeStreamProviderRef<List<Cryptocurrency>>;
String _$watchCryptoChartHash() => r'06d3ad9bee0b909d86e134c0eb6c38540ce566e5';

/// See also [watchCryptoChart].
@ProviderFor(watchCryptoChart)
final watchCryptoChartProvider = AutoDisposeStreamProvider<Chart>.internal(
  watchCryptoChart,
  name: r'watchCryptoChartProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchCryptoChartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchCryptoChartRef = AutoDisposeStreamProviderRef<Chart>;
String _$watchPayoutReportCryptoHash() =>
    r'af4aec79cd51e6c87bf401ed402085dc26da1b28';

/// See also [watchPayoutReportCrypto].
@ProviderFor(watchPayoutReportCrypto)
final watchPayoutReportCryptoProvider =
    AutoDisposeStreamProvider<PayoutReportData>.internal(
  watchPayoutReportCrypto,
  name: r'watchPayoutReportCryptoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchPayoutReportCryptoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchPayoutReportCryptoRef
    = AutoDisposeStreamProviderRef<PayoutReportData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

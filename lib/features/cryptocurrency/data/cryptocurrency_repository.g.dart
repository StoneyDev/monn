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
String _$getCryptocurrencyHash() => r'4bba44e9d79718c0e1d4288e3fbb6cec4d589360';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getCryptocurrency].
@ProviderFor(getCryptocurrency)
const getCryptocurrencyProvider = GetCryptocurrencyFamily();

/// See also [getCryptocurrency].
class GetCryptocurrencyFamily extends Family<AsyncValue<Cryptocurrency>> {
  /// See also [getCryptocurrency].
  const GetCryptocurrencyFamily();

  /// See also [getCryptocurrency].
  GetCryptocurrencyProvider call(
    CryptoType type,
  ) {
    return GetCryptocurrencyProvider(
      type,
    );
  }

  @override
  GetCryptocurrencyProvider getProviderOverride(
    covariant GetCryptocurrencyProvider provider,
  ) {
    return call(
      provider.type,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getCryptocurrencyProvider';
}

/// See also [getCryptocurrency].
class GetCryptocurrencyProvider
    extends AutoDisposeFutureProvider<Cryptocurrency> {
  /// See also [getCryptocurrency].
  GetCryptocurrencyProvider(
    CryptoType type,
  ) : this._internal(
          (ref) => getCryptocurrency(
            ref as GetCryptocurrencyRef,
            type,
          ),
          from: getCryptocurrencyProvider,
          name: r'getCryptocurrencyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCryptocurrencyHash,
          dependencies: GetCryptocurrencyFamily._dependencies,
          allTransitiveDependencies:
              GetCryptocurrencyFamily._allTransitiveDependencies,
          type: type,
        );

  GetCryptocurrencyProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final CryptoType type;

  @override
  Override overrideWith(
    FutureOr<Cryptocurrency> Function(GetCryptocurrencyRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCryptocurrencyProvider._internal(
        (ref) => create(ref as GetCryptocurrencyRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Cryptocurrency> createElement() {
    return _GetCryptocurrencyProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCryptocurrencyProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCryptocurrencyRef on AutoDisposeFutureProviderRef<Cryptocurrency> {
  /// The parameter `type` of this provider.
  CryptoType get type;
}

class _GetCryptocurrencyProviderElement
    extends AutoDisposeFutureProviderElement<Cryptocurrency>
    with GetCryptocurrencyRef {
  _GetCryptocurrencyProviderElement(super.provider);

  @override
  CryptoType get type => (origin as GetCryptocurrencyProvider).type;
}

String _$watchCryptoChartHash() => r'a93e313f611fd6d4cc34dea026f25deb788c8b9c';

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
    r'761ddff56c68e747b44cca0f99271d4f09f8c4cc';

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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_cap_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$coinCapRepositoryHash() => r'e8995699f26a6e6862138cc1fdf99f5bfc78ad9d';

/// See also [coinCapRepository].
@ProviderFor(coinCapRepository)
final coinCapRepositoryProvider = Provider<CoinCapRepository>.internal(
  coinCapRepository,
  name: r'coinCapRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$coinCapRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CoinCapRepositoryRef = ProviderRef<CoinCapRepository>;
String _$getCryptoPriceMarketHash() =>
    r'3218f74789eafe057be3813b1ed99bdae41c3cef';

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

/// See also [getCryptoPriceMarket].
@ProviderFor(getCryptoPriceMarket)
const getCryptoPriceMarketProvider = GetCryptoPriceMarketFamily();

/// See also [getCryptoPriceMarket].
class GetCryptoPriceMarketFamily extends Family<AsyncValue<double>> {
  /// See also [getCryptoPriceMarket].
  const GetCryptoPriceMarketFamily();

  /// See also [getCryptoPriceMarket].
  GetCryptoPriceMarketProvider call({
    required String id,
    Cryptocurrency? crypto,
  }) {
    return GetCryptoPriceMarketProvider(
      id: id,
      crypto: crypto,
    );
  }

  @override
  GetCryptoPriceMarketProvider getProviderOverride(
    covariant GetCryptoPriceMarketProvider provider,
  ) {
    return call(
      id: provider.id,
      crypto: provider.crypto,
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
  String? get name => r'getCryptoPriceMarketProvider';
}

/// See also [getCryptoPriceMarket].
class GetCryptoPriceMarketProvider extends AutoDisposeFutureProvider<double> {
  /// See also [getCryptoPriceMarket].
  GetCryptoPriceMarketProvider({
    required String id,
    Cryptocurrency? crypto,
  }) : this._internal(
          (ref) => getCryptoPriceMarket(
            ref as GetCryptoPriceMarketRef,
            id: id,
            crypto: crypto,
          ),
          from: getCryptoPriceMarketProvider,
          name: r'getCryptoPriceMarketProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCryptoPriceMarketHash,
          dependencies: GetCryptoPriceMarketFamily._dependencies,
          allTransitiveDependencies:
              GetCryptoPriceMarketFamily._allTransitiveDependencies,
          id: id,
          crypto: crypto,
        );

  GetCryptoPriceMarketProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.crypto,
  }) : super.internal();

  final String id;
  final Cryptocurrency? crypto;

  @override
  Override overrideWith(
    FutureOr<double> Function(GetCryptoPriceMarketRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCryptoPriceMarketProvider._internal(
        (ref) => create(ref as GetCryptoPriceMarketRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        crypto: crypto,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<double> createElement() {
    return _GetCryptoPriceMarketProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCryptoPriceMarketProvider &&
        other.id == id &&
        other.crypto == crypto;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, crypto.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCryptoPriceMarketRef on AutoDisposeFutureProviderRef<double> {
  /// The parameter `id` of this provider.
  String get id;

  /// The parameter `crypto` of this provider.
  Cryptocurrency? get crypto;
}

class _GetCryptoPriceMarketProviderElement
    extends AutoDisposeFutureProviderElement<double>
    with GetCryptoPriceMarketRef {
  _GetCryptoPriceMarketProviderElement(super.provider);

  @override
  String get id => (origin as GetCryptoPriceMarketProvider).id;
  @override
  Cryptocurrency? get crypto => (origin as GetCryptoPriceMarketProvider).crypto;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

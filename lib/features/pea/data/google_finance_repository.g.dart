// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_finance_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$googleFinanceRepositoryHash() =>
    r'cc26f2be6027b847de42a7b5caef75009f56d5c9';

/// See also [googleFinanceRepository].
@ProviderFor(googleFinanceRepository)
final googleFinanceRepositoryProvider =
    Provider<GoogleFinanceRepository>.internal(
  googleFinanceRepository,
  name: r'googleFinanceRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$googleFinanceRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GoogleFinanceRepositoryRef = ProviderRef<GoogleFinanceRepository>;
String _$getEtfPriceMarketHash() => r'f928ac93a4343844af35e56e8b77d5b421df58f1';

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

/// See also [getEtfPriceMarket].
@ProviderFor(getEtfPriceMarket)
const getEtfPriceMarketProvider = GetEtfPriceMarketFamily();

/// See also [getEtfPriceMarket].
class GetEtfPriceMarketFamily extends Family<AsyncValue<double>> {
  /// See also [getEtfPriceMarket].
  const GetEtfPriceMarketFamily();

  /// See also [getEtfPriceMarket].
  GetEtfPriceMarketProvider call({
    required String stock,
  }) {
    return GetEtfPriceMarketProvider(
      stock: stock,
    );
  }

  @override
  GetEtfPriceMarketProvider getProviderOverride(
    covariant GetEtfPriceMarketProvider provider,
  ) {
    return call(
      stock: provider.stock,
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
  String? get name => r'getEtfPriceMarketProvider';
}

/// See also [getEtfPriceMarket].
class GetEtfPriceMarketProvider extends AutoDisposeFutureProvider<double> {
  /// See also [getEtfPriceMarket].
  GetEtfPriceMarketProvider({
    required String stock,
  }) : this._internal(
          (ref) => getEtfPriceMarket(
            ref as GetEtfPriceMarketRef,
            stock: stock,
          ),
          from: getEtfPriceMarketProvider,
          name: r'getEtfPriceMarketProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getEtfPriceMarketHash,
          dependencies: GetEtfPriceMarketFamily._dependencies,
          allTransitiveDependencies:
              GetEtfPriceMarketFamily._allTransitiveDependencies,
          stock: stock,
        );

  GetEtfPriceMarketProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.stock,
  }) : super.internal();

  final String stock;

  @override
  Override overrideWith(
    FutureOr<double> Function(GetEtfPriceMarketRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetEtfPriceMarketProvider._internal(
        (ref) => create(ref as GetEtfPriceMarketRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        stock: stock,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<double> createElement() {
    return _GetEtfPriceMarketProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetEtfPriceMarketProvider && other.stock == stock;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, stock.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetEtfPriceMarketRef on AutoDisposeFutureProviderRef<double> {
  /// The parameter `stock` of this provider.
  String get stock;
}

class _GetEtfPriceMarketProviderElement
    extends AutoDisposeFutureProviderElement<double> with GetEtfPriceMarketRef {
  _GetEtfPriceMarketProviderElement(super.provider);

  @override
  String get stock => (origin as GetEtfPriceMarketProvider).stock;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

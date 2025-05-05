// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savingsRepositoryHash() => r'f91e71a5fba2ff21e67786f0b95fc4a3a6631b2d';

/// See also [savingsRepository].
@ProviderFor(savingsRepository)
final savingsRepositoryProvider = Provider<SavingsRepository>.internal(
  savingsRepository,
  name: r'savingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavingsRepositoryRef = ProviderRef<SavingsRepository>;
String _$watchSavingsHash() => r'd167f759454c535778290c332f82dbac2388f3c4';

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

/// See also [watchSavings].
@ProviderFor(watchSavings)
const watchSavingsProvider = WatchSavingsFamily();

/// See also [watchSavings].
class WatchSavingsFamily extends Family<AsyncValue<List<Savings>>> {
  /// See also [watchSavings].
  const WatchSavingsFamily();

  /// See also [watchSavings].
  WatchSavingsProvider call({
    SavingsFilter? filter,
  }) {
    return WatchSavingsProvider(
      filter: filter,
    );
  }

  @override
  WatchSavingsProvider getProviderOverride(
    covariant WatchSavingsProvider provider,
  ) {
    return call(
      filter: provider.filter,
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
  String? get name => r'watchSavingsProvider';
}

/// See also [watchSavings].
class WatchSavingsProvider extends AutoDisposeStreamProvider<List<Savings>> {
  /// See also [watchSavings].
  WatchSavingsProvider({
    SavingsFilter? filter,
  }) : this._internal(
          (ref) => watchSavings(
            ref as WatchSavingsRef,
            filter: filter,
          ),
          from: watchSavingsProvider,
          name: r'watchSavingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSavingsHash,
          dependencies: WatchSavingsFamily._dependencies,
          allTransitiveDependencies:
              WatchSavingsFamily._allTransitiveDependencies,
          filter: filter,
        );

  WatchSavingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
  }) : super.internal();

  final SavingsFilter? filter;

  @override
  Override overrideWith(
    Stream<List<Savings>> Function(WatchSavingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSavingsProvider._internal(
        (ref) => create(ref as WatchSavingsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Savings>> createElement() {
    return _WatchSavingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSavingsProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchSavingsRef on AutoDisposeStreamProviderRef<List<Savings>> {
  /// The parameter `filter` of this provider.
  SavingsFilter? get filter;
}

class _WatchSavingsProviderElement
    extends AutoDisposeStreamProviderElement<List<Savings>>
    with WatchSavingsRef {
  _WatchSavingsProviderElement(super.provider);

  @override
  SavingsFilter? get filter => (origin as WatchSavingsProvider).filter;
}

String _$getSavingsHash() => r'ed5d6e5976aaed5e202ea478abc353b3ade330ae';

/// See also [getSavings].
@ProviderFor(getSavings)
const getSavingsProvider = GetSavingsFamily();

/// See also [getSavings].
class GetSavingsFamily extends Family<AsyncValue<Savings?>> {
  /// See also [getSavings].
  const GetSavingsFamily();

  /// See also [getSavings].
  GetSavingsProvider call({
    required SavingsType type,
  }) {
    return GetSavingsProvider(
      type: type,
    );
  }

  @override
  GetSavingsProvider getProviderOverride(
    covariant GetSavingsProvider provider,
  ) {
    return call(
      type: provider.type,
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
  String? get name => r'getSavingsProvider';
}

/// See also [getSavings].
class GetSavingsProvider extends AutoDisposeFutureProvider<Savings?> {
  /// See also [getSavings].
  GetSavingsProvider({
    required SavingsType type,
  }) : this._internal(
          (ref) => getSavings(
            ref as GetSavingsRef,
            type: type,
          ),
          from: getSavingsProvider,
          name: r'getSavingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSavingsHash,
          dependencies: GetSavingsFamily._dependencies,
          allTransitiveDependencies:
              GetSavingsFamily._allTransitiveDependencies,
          type: type,
        );

  GetSavingsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final SavingsType type;

  @override
  Override overrideWith(
    FutureOr<Savings?> Function(GetSavingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSavingsProvider._internal(
        (ref) => create(ref as GetSavingsRef),
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
  AutoDisposeFutureProviderElement<Savings?> createElement() {
    return _GetSavingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSavingsProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetSavingsRef on AutoDisposeFutureProviderRef<Savings?> {
  /// The parameter `type` of this provider.
  SavingsType get type;
}

class _GetSavingsProviderElement
    extends AutoDisposeFutureProviderElement<Savings?> with GetSavingsRef {
  _GetSavingsProviderElement(super.provider);

  @override
  SavingsType get type => (origin as GetSavingsProvider).type;
}

String _$watchPayoutReportSavingsHash() =>
    r'4952341098204a925a6e52fa6370aee2675074da';

/// See also [watchPayoutReportSavings].
@ProviderFor(watchPayoutReportSavings)
final watchPayoutReportSavingsProvider =
    AutoDisposeFutureProvider<double>.internal(
  watchPayoutReportSavings,
  name: r'watchPayoutReportSavingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchPayoutReportSavingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchPayoutReportSavingsRef = AutoDisposeFutureProviderRef<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

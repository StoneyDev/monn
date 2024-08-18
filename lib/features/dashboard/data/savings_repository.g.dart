// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savingsRepositoryHash() => r'925c78b80d718ddda9c437808af6a585a16ed1ae';

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

typedef SavingsRepositoryRef = ProviderRef<SavingsRepository>;
String _$watchSavingsHash() => r'24038eee6db3df114aade09cf710bf3c00466f46';

/// See also [watchSavings].
@ProviderFor(watchSavings)
final watchSavingsProvider = AutoDisposeStreamProvider<List<Savings>>.internal(
  watchSavings,
  name: r'watchSavingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$watchSavingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchSavingsRef = AutoDisposeStreamProviderRef<List<Savings>>;
String _$watchSavingHash() => r'4021856427d209d442067cf339da7e7a91f70cb9';

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

/// See also [watchSaving].
@ProviderFor(watchSaving)
const watchSavingProvider = WatchSavingFamily();

/// See also [watchSaving].
class WatchSavingFamily extends Family<AsyncValue<Savings>> {
  /// See also [watchSaving].
  const WatchSavingFamily();

  /// See also [watchSaving].
  WatchSavingProvider call({
    required SavingsType type,
  }) {
    return WatchSavingProvider(
      type: type,
    );
  }

  @override
  WatchSavingProvider getProviderOverride(
    covariant WatchSavingProvider provider,
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
  String? get name => r'watchSavingProvider';
}

/// See also [watchSaving].
class WatchSavingProvider extends AutoDisposeStreamProvider<Savings> {
  /// See also [watchSaving].
  WatchSavingProvider({
    required SavingsType type,
  }) : this._internal(
          (ref) => watchSaving(
            ref as WatchSavingRef,
            type: type,
          ),
          from: watchSavingProvider,
          name: r'watchSavingProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchSavingHash,
          dependencies: WatchSavingFamily._dependencies,
          allTransitiveDependencies:
              WatchSavingFamily._allTransitiveDependencies,
          type: type,
        );

  WatchSavingProvider._internal(
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
    Stream<Savings> Function(WatchSavingRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchSavingProvider._internal(
        (ref) => create(ref as WatchSavingRef),
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
  AutoDisposeStreamProviderElement<Savings> createElement() {
    return _WatchSavingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSavingProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WatchSavingRef on AutoDisposeStreamProviderRef<Savings> {
  /// The parameter `type` of this provider.
  SavingsType get type;
}

class _WatchSavingProviderElement
    extends AutoDisposeStreamProviderElement<Savings> with WatchSavingRef {
  _WatchSavingProviderElement(super.provider);

  @override
  SavingsType get type => (origin as WatchSavingProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

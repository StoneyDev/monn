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
String _$getSavingsHash() => r'63c15b702d07bcdd68fcc04f494fab2491bcb0d1';

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
    r'4b5f270daa4e332480976348afe8ddd796095dce';

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

typedef WatchPayoutReportSavingsRef = AutoDisposeFutureProviderRef<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

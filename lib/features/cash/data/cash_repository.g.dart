// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cashRepositoryHash() => r'8d0ab430e60024b0bb61b79ac48a4e69746dc01a';

/// See also [cashRepository].
@ProviderFor(cashRepository)
final cashRepositoryProvider = Provider<CashRepository>.internal(
  cashRepository,
  name: r'cashRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cashRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CashRepositoryRef = ProviderRef<CashRepository>;
String _$deleteCashHash() => r'b9f4136c64c6b6bc607c0664b4ea166fa1d35c26';

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

/// See also [deleteCash].
@ProviderFor(deleteCash)
const deleteCashProvider = DeleteCashFamily();

/// See also [deleteCash].
class DeleteCashFamily extends Family<AsyncValue<void>> {
  /// See also [deleteCash].
  const DeleteCashFamily();

  /// See also [deleteCash].
  DeleteCashProvider call(
    int id,
  ) {
    return DeleteCashProvider(
      id,
    );
  }

  @override
  DeleteCashProvider getProviderOverride(
    covariant DeleteCashProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'deleteCashProvider';
}

/// See also [deleteCash].
class DeleteCashProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteCash].
  DeleteCashProvider(
    int id,
  ) : this._internal(
          (ref) => deleteCash(
            ref as DeleteCashRef,
            id,
          ),
          from: deleteCashProvider,
          name: r'deleteCashProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteCashHash,
          dependencies: DeleteCashFamily._dependencies,
          allTransitiveDependencies:
              DeleteCashFamily._allTransitiveDependencies,
          id: id,
        );

  DeleteCashProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteCashRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteCashProvider._internal(
        (ref) => create(ref as DeleteCashRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteCashProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteCashProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteCashRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _DeleteCashProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteCashRef {
  _DeleteCashProviderElement(super.provider);

  @override
  int get id => (origin as DeleteCashProvider).id;
}

String _$watchCashsHash() => r'b0f3ac255da0ce9f9bb4521a1861a1f1d4de3498';

/// See also [watchCashs].
@ProviderFor(watchCashs)
final watchCashsProvider = AutoDisposeStreamProvider<List<Cash>>.internal(
  watchCashs,
  name: r'watchCashsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$watchCashsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchCashsRef = AutoDisposeStreamProviderRef<List<Cash>>;
String _$watchPayoutReportCashHash() =>
    r'6030a8d11c0986c31116149ef7efdd25baceeb95';

/// See also [watchPayoutReportCash].
@ProviderFor(watchPayoutReportCash)
final watchPayoutReportCashProvider =
    AutoDisposeStreamProvider<PayoutReportData>.internal(
  watchPayoutReportCash,
  name: r'watchPayoutReportCashProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchPayoutReportCashHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchPayoutReportCashRef
    = AutoDisposeStreamProviderRef<PayoutReportData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

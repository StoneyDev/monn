// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reitRepositoryHash() => r'875422e2e78d82bb0680a7a7ff72315de6a22bd0';

/// See also [reitRepository].
@ProviderFor(reitRepository)
final reitRepositoryProvider = Provider<ReitRepository>.internal(
  reitRepository,
  name: r'reitRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reitRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ReitRepositoryRef = ProviderRef<ReitRepository>;
String _$watchReitsHash() => r'dc0ffb32bab22fa8dfb5ed25d502775b10f7443f';

/// See also [watchReits].
@ProviderFor(watchReits)
final watchReitsProvider = AutoDisposeStreamProvider<List<Reit>>.internal(
  watchReits,
  name: r'watchReitsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$watchReitsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchReitsRef = AutoDisposeStreamProviderRef<List<Reit>>;
String _$deleteReitHash() => r'b7ceda8ee00fdfc3ed262ccf0ff8bcf66b5db0f0';

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

/// See also [deleteReit].
@ProviderFor(deleteReit)
const deleteReitProvider = DeleteReitFamily();

/// See also [deleteReit].
class DeleteReitFamily extends Family<AsyncValue<void>> {
  /// See also [deleteReit].
  const DeleteReitFamily();

  /// See also [deleteReit].
  DeleteReitProvider call(
    Reit reit,
  ) {
    return DeleteReitProvider(
      reit,
    );
  }

  @override
  DeleteReitProvider getProviderOverride(
    covariant DeleteReitProvider provider,
  ) {
    return call(
      provider.reit,
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
  String? get name => r'deleteReitProvider';
}

/// See also [deleteReit].
class DeleteReitProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deleteReit].
  DeleteReitProvider(
    Reit reit,
  ) : this._internal(
          (ref) => deleteReit(
            ref as DeleteReitRef,
            reit,
          ),
          from: deleteReitProvider,
          name: r'deleteReitProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteReitHash,
          dependencies: DeleteReitFamily._dependencies,
          allTransitiveDependencies:
              DeleteReitFamily._allTransitiveDependencies,
          reit: reit,
        );

  DeleteReitProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.reit,
  }) : super.internal();

  final Reit reit;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeleteReitRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteReitProvider._internal(
        (ref) => create(ref as DeleteReitRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        reit: reit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeleteReitProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteReitProvider && other.reit == reit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, reit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DeleteReitRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `reit` of this provider.
  Reit get reit;
}

class _DeleteReitProviderElement extends AutoDisposeFutureProviderElement<void>
    with DeleteReitRef {
  _DeleteReitProviderElement(super.provider);

  @override
  Reit get reit => (origin as DeleteReitProvider).reit;
}

String _$watchPayoutReportReitHash() =>
    r'fbf8b0068cf70656341875348185f05293b6defd';

/// See also [watchPayoutReportReit].
@ProviderFor(watchPayoutReportReit)
final watchPayoutReportReitProvider =
    AutoDisposeStreamProvider<PayoutReportData>.internal(
  watchPayoutReportReit,
  name: r'watchPayoutReportReitProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchPayoutReportReitHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchPayoutReportReitRef
    = AutoDisposeStreamProviderRef<PayoutReportData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

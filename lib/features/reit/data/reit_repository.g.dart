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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reitRepositoryHash() => r'5d8c7c0cf12738a2a0ba7ea1b0e1439e310156b7';

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

typedef ReitRepositoryRef = ProviderRef<ReitRepository>;
String _$watchReitsHash() => r'0528a69ce04ad222bd46fb5bf7135dc18645b11a';

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

typedef WatchReitsRef = AutoDisposeStreamProviderRef<List<Reit>>;
String _$watchPayoutReportReitHash() =>
    r'ae93004031eb601deaee42992feb7d8b99a528a2';

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

typedef WatchPayoutReportReitRef
    = AutoDisposeStreamProviderRef<PayoutReportData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

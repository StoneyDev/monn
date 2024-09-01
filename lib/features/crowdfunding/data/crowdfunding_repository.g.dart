// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crowdfunding_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crowndfundingRepositoryHash() =>
    r'b1cffbb2b6a2f17a118909e012d0e5fe49116dd4';

/// See also [crowndfundingRepository].
@ProviderFor(crowndfundingRepository)
final crowndfundingRepositoryProvider =
    Provider<CrowndfundingRepository>.internal(
  crowndfundingRepository,
  name: r'crowndfundingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$crowndfundingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CrowndfundingRepositoryRef = ProviderRef<CrowndfundingRepository>;
String _$watchCrowdfundingsHash() =>
    r'daad7192c946326022b23db7d5ef123affd2a5f3';

/// See also [watchCrowdfundings].
@ProviderFor(watchCrowdfundings)
final watchCrowdfundingsProvider =
    AutoDisposeStreamProvider<List<Crowdfunding>>.internal(
  watchCrowdfundings,
  name: r'watchCrowdfundingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchCrowdfundingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchCrowdfundingsRef
    = AutoDisposeStreamProviderRef<List<Crowdfunding>>;
String _$watchPayoutReportCrowdfundingHash() =>
    r'3ec9f0baa2be72f5c40c447ba14f341145e9f0c0';

/// See also [watchPayoutReportCrowdfunding].
@ProviderFor(watchPayoutReportCrowdfunding)
final watchPayoutReportCrowdfundingProvider =
    AutoDisposeStreamProvider<PayoutReportData>.internal(
  watchPayoutReportCrowdfunding,
  name: r'watchPayoutReportCrowdfundingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchPayoutReportCrowdfundingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchPayoutReportCrowdfundingRef
    = AutoDisposeStreamProviderRef<PayoutReportData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

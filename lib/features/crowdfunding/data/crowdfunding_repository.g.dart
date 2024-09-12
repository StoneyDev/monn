// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crowdfunding_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$crowdfundingRepositoryHash() =>
    r'7e516e1152f5eee26354959a9d2a75ad454f8029';

/// See also [crowdfundingRepository].
@ProviderFor(crowdfundingRepository)
final crowdfundingRepositoryProvider =
    Provider<CrowdfundingRepository>.internal(
  crowdfundingRepository,
  name: r'crowdfundingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$crowdfundingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CrowdfundingRepositoryRef = ProviderRef<CrowdfundingRepository>;
String _$watchCrowdfundingsHash() =>
    r'ced066c6a1638529e2086d3fb6f7d73938da92fa';

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
    r'8757f437e6abc8967fded48b86128172632a8133';

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

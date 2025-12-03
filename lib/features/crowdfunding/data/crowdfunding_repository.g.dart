// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crowdfunding_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(crowdfundingRepository)
const crowdfundingRepositoryProvider = CrowdfundingRepositoryProvider._();

final class CrowdfundingRepositoryProvider
    extends
        $FunctionalProvider<
          CrowdfundingRepository,
          CrowdfundingRepository,
          CrowdfundingRepository
        >
    with $Provider<CrowdfundingRepository> {
  const CrowdfundingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'crowdfundingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$crowdfundingRepositoryHash();

  @$internal
  @override
  $ProviderElement<CrowdfundingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CrowdfundingRepository create(Ref ref) {
    return crowdfundingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CrowdfundingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CrowdfundingRepository>(value),
    );
  }
}

String _$crowdfundingRepositoryHash() =>
    r'b03231041718953e8cf9a85f2c9675487a59d7a4';

@ProviderFor(watchCrowdfundings)
const watchCrowdfundingsProvider = WatchCrowdfundingsProvider._();

final class WatchCrowdfundingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Crowdfunding>>,
          List<Crowdfunding>,
          Stream<List<Crowdfunding>>
        >
    with
        $FutureModifier<List<Crowdfunding>>,
        $StreamProvider<List<Crowdfunding>> {
  const WatchCrowdfundingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchCrowdfundingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchCrowdfundingsHash();

  @$internal
  @override
  $StreamProviderElement<List<Crowdfunding>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Crowdfunding>> create(Ref ref) {
    return watchCrowdfundings(ref);
  }
}

String _$watchCrowdfundingsHash() =>
    r'2fd175ef4d7195f1faf7553291e9b59adddb7bbb';

@ProviderFor(watchPayoutReportCrowdfunding)
const watchPayoutReportCrowdfundingProvider =
    WatchPayoutReportCrowdfundingProvider._();

final class WatchPayoutReportCrowdfundingProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  const WatchPayoutReportCrowdfundingProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPayoutReportCrowdfundingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPayoutReportCrowdfundingHash();

  @$internal
  @override
  $StreamProviderElement<PayoutReportData> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PayoutReportData> create(Ref ref) {
    return watchPayoutReportCrowdfunding(ref);
  }
}

String _$watchPayoutReportCrowdfundingHash() =>
    r'88b2cd5083df91f4cefe3b85ab3ebdeab8308e30';

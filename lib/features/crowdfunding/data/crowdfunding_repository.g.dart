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
    r'ee5166bcd8aad33bbee8a2274f28a1b1ec61efc4';

@ProviderFor(watchCrowdfundings)
const watchCrowdfundingsProvider = WatchCrowdfundingsProvider._();

final class WatchCrowdfundingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CrowdfundingEntry>>,
          List<CrowdfundingEntry>,
          Stream<List<CrowdfundingEntry>>
        >
    with
        $FutureModifier<List<CrowdfundingEntry>>,
        $StreamProvider<List<CrowdfundingEntry>> {
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
  $StreamProviderElement<List<CrowdfundingEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CrowdfundingEntry>> create(Ref ref) {
    return watchCrowdfundings(ref);
  }
}

String _$watchCrowdfundingsHash() =>
    r'a48b0cdc090e7c36338c8badf2b6dd8af967aee3';

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

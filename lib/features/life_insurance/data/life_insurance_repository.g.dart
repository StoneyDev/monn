// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_insurance_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lifeInsuranceRepository)
const lifeInsuranceRepositoryProvider = LifeInsuranceRepositoryProvider._();

final class LifeInsuranceRepositoryProvider
    extends
        $FunctionalProvider<
          LifeInsuranceRepository,
          LifeInsuranceRepository,
          LifeInsuranceRepository
        >
    with $Provider<LifeInsuranceRepository> {
  const LifeInsuranceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lifeInsuranceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lifeInsuranceRepositoryHash();

  @$internal
  @override
  $ProviderElement<LifeInsuranceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LifeInsuranceRepository create(Ref ref) {
    return lifeInsuranceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LifeInsuranceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LifeInsuranceRepository>(value),
    );
  }
}

String _$lifeInsuranceRepositoryHash() =>
    r'165935c6000f4dc3f4071c5076e0efd65824c74c';

@ProviderFor(watchLifeInsurance)
const watchLifeInsuranceProvider = WatchLifeInsuranceProvider._();

final class WatchLifeInsuranceProvider
    extends
        $FunctionalProvider<
          AsyncValue<LifeInsurance?>,
          LifeInsurance?,
          Stream<LifeInsurance?>
        >
    with $FutureModifier<LifeInsurance?>, $StreamProvider<LifeInsurance?> {
  const WatchLifeInsuranceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchLifeInsuranceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchLifeInsuranceHash();

  @$internal
  @override
  $StreamProviderElement<LifeInsurance?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<LifeInsurance?> create(Ref ref) {
    return watchLifeInsurance(ref);
  }
}

String _$watchLifeInsuranceHash() =>
    r'5f0c819d3f4749492fa685c933ab783b7e8fca5f';

@ProviderFor(watchPayoutReportLifeInsurance)
const watchPayoutReportLifeInsuranceProvider =
    WatchPayoutReportLifeInsuranceProvider._();

final class WatchPayoutReportLifeInsuranceProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  const WatchPayoutReportLifeInsuranceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPayoutReportLifeInsuranceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPayoutReportLifeInsuranceHash();

  @$internal
  @override
  $StreamProviderElement<PayoutReportData> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PayoutReportData> create(Ref ref) {
    return watchPayoutReportLifeInsurance(ref);
  }
}

String _$watchPayoutReportLifeInsuranceHash() =>
    r'3584d2ba5669ebf66ee1b4589a4f542c6f794ba3';

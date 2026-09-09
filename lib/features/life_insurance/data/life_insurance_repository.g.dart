// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_insurance_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lifeInsuranceRepository)
final lifeInsuranceRepositoryProvider = LifeInsuranceRepositoryProvider._();

final class LifeInsuranceRepositoryProvider
    extends
        $FunctionalProvider<
          LifeInsuranceRepository,
          LifeInsuranceRepository,
          LifeInsuranceRepository
        >
    with $Provider<LifeInsuranceRepository> {
  LifeInsuranceRepositoryProvider._()
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
    r'10ebd62b12a576d9ac615ab1df1f6d5f7e3b4476';

@ProviderFor(watchLifeInsurance)
final watchLifeInsuranceProvider = WatchLifeInsuranceProvider._();

final class WatchLifeInsuranceProvider
    extends
        $FunctionalProvider<
          AsyncValue<LifeInsuranceEntry?>,
          LifeInsuranceEntry?,
          Stream<LifeInsuranceEntry?>
        >
    with
        $FutureModifier<LifeInsuranceEntry?>,
        $StreamProvider<LifeInsuranceEntry?> {
  WatchLifeInsuranceProvider._()
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
  $StreamProviderElement<LifeInsuranceEntry?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<LifeInsuranceEntry?> create(Ref ref) {
    return watchLifeInsurance(ref);
  }
}

String _$watchLifeInsuranceHash() =>
    r'06051b023bbaa8e9625eae9acd02e38fe5aea69c';

@ProviderFor(watchPayoutReportLifeInsurance)
final watchPayoutReportLifeInsuranceProvider =
    WatchPayoutReportLifeInsuranceProvider._();

final class WatchPayoutReportLifeInsuranceProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  WatchPayoutReportLifeInsuranceProvider._()
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

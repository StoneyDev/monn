// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelance_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(freelanceRepository)
final freelanceRepositoryProvider = FreelanceRepositoryProvider._();

final class FreelanceRepositoryProvider
    extends
        $FunctionalProvider<
          FreelanceRepository,
          FreelanceRepository,
          FreelanceRepository
        >
    with $Provider<FreelanceRepository> {
  FreelanceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'freelanceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$freelanceRepositoryHash();

  @$internal
  @override
  $ProviderElement<FreelanceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FreelanceRepository create(Ref ref) {
    return freelanceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FreelanceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FreelanceRepository>(value),
    );
  }
}

String _$freelanceRepositoryHash() =>
    r'5b4a275f9851fc9fd12e08ade02f80548e7d97e6';

@ProviderFor(watchFreelance)
final watchFreelanceProvider = WatchFreelanceProvider._();

final class WatchFreelanceProvider
    extends
        $FunctionalProvider<
          AsyncValue<FreelanceEntry?>,
          FreelanceEntry?,
          Stream<FreelanceEntry?>
        >
    with $FutureModifier<FreelanceEntry?>, $StreamProvider<FreelanceEntry?> {
  WatchFreelanceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchFreelanceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchFreelanceHash();

  @$internal
  @override
  $StreamProviderElement<FreelanceEntry?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<FreelanceEntry?> create(Ref ref) {
    return watchFreelance(ref);
  }
}

String _$watchFreelanceHash() => r'1c4fa26d11be91b0055a933e20cfa34333f13076';

@ProviderFor(freelanceCalculation)
final freelanceCalculationProvider = FreelanceCalculationProvider._();

final class FreelanceCalculationProvider
    extends
        $FunctionalProvider<FreelanceResult, FreelanceResult, FreelanceResult>
    with $Provider<FreelanceResult> {
  FreelanceCalculationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'freelanceCalculationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$freelanceCalculationHash();

  @$internal
  @override
  $ProviderElement<FreelanceResult> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FreelanceResult create(Ref ref) {
    return freelanceCalculation(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FreelanceResult value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FreelanceResult>(value),
    );
  }
}

String _$freelanceCalculationHash() =>
    r'60e5e08132efb11e4f4cde513ebb8fe1c5b09182';

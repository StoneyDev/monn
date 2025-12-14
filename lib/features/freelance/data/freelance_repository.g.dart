// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelance_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(freelanceRepository)
const freelanceRepositoryProvider = FreelanceRepositoryProvider._();

final class FreelanceRepositoryProvider
    extends
        $FunctionalProvider<
          FreelanceRepository,
          FreelanceRepository,
          FreelanceRepository
        >
    with $Provider<FreelanceRepository> {
  const FreelanceRepositoryProvider._()
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
    r'97bfa5b4c26c2280cce03ee6b09ce171c70ebe42';

@ProviderFor(watchFreelance)
const watchFreelanceProvider = WatchFreelanceProvider._();

final class WatchFreelanceProvider
    extends
        $FunctionalProvider<
          AsyncValue<Freelance?>,
          Freelance?,
          Stream<Freelance?>
        >
    with $FutureModifier<Freelance?>, $StreamProvider<Freelance?> {
  const WatchFreelanceProvider._()
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
  $StreamProviderElement<Freelance?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Freelance?> create(Ref ref) {
    return watchFreelance(ref);
  }
}

String _$watchFreelanceHash() => r'a8efaf21784508669e629fc9c1e9ebd456f9f34f';

@ProviderFor(freelanceCalculation)
const freelanceCalculationProvider = FreelanceCalculationProvider._();

final class FreelanceCalculationProvider
    extends
        $FunctionalProvider<FreelanceResult, FreelanceResult, FreelanceResult>
    with $Provider<FreelanceResult> {
  const FreelanceCalculationProvider._()
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

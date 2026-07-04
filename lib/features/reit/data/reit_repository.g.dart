// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reitRepository)
const reitRepositoryProvider = ReitRepositoryProvider._();

final class ReitRepositoryProvider
    extends $FunctionalProvider<ReitRepository, ReitRepository, ReitRepository>
    with $Provider<ReitRepository> {
  const ReitRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reitRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reitRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReitRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReitRepository create(Ref ref) {
    return reitRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReitRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReitRepository>(value),
    );
  }
}

String _$reitRepositoryHash() => r'a906ea22e118d246b0f76070bff23367b425154c';

@ProviderFor(watchReits)
const watchReitsProvider = WatchReitsProvider._();

final class WatchReitsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ReitWithDividends>>,
          List<ReitWithDividends>,
          Stream<List<ReitWithDividends>>
        >
    with
        $FutureModifier<List<ReitWithDividends>>,
        $StreamProvider<List<ReitWithDividends>> {
  const WatchReitsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchReitsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchReitsHash();

  @$internal
  @override
  $StreamProviderElement<List<ReitWithDividends>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ReitWithDividends>> create(Ref ref) {
    return watchReits(ref);
  }
}

String _$watchReitsHash() => r'6b2e7aaa35b42695cc58dff727ed05fbbd73de3c';

@ProviderFor(deleteReit)
const deleteReitProvider = DeleteReitFamily._();

final class DeleteReitProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const DeleteReitProvider._({
    required DeleteReitFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'deleteReitProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteReitHash();

  @override
  String toString() {
    return r'deleteReitProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as int;
    return deleteReit(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteReitProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteReitHash() => r'27c6409aecfe9252b39bcc36f470bc7617ee30b1';

final class DeleteReitFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, int> {
  const DeleteReitFamily._()
    : super(
        retry: null,
        name: r'deleteReitProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteReitProvider call(int id) =>
      DeleteReitProvider._(argument: id, from: this);

  @override
  String toString() => r'deleteReitProvider';
}

@ProviderFor(watchPayoutReportReit)
const watchPayoutReportReitProvider = WatchPayoutReportReitProvider._();

final class WatchPayoutReportReitProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  const WatchPayoutReportReitProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPayoutReportReitProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPayoutReportReitHash();

  @$internal
  @override
  $StreamProviderElement<PayoutReportData> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PayoutReportData> create(Ref ref) {
    return watchPayoutReportReit(ref);
  }
}

String _$watchPayoutReportReitHash() =>
    r'fbf8b0068cf70656341875348185f05293b6defd';

@ProviderFor(reitTaxCalculation)
const reitTaxCalculationProvider = ReitTaxCalculationProvider._();

final class ReitTaxCalculationProvider
    extends $FunctionalProvider<ReitTaxResult, ReitTaxResult, ReitTaxResult>
    with $Provider<ReitTaxResult> {
  const ReitTaxCalculationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reitTaxCalculationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reitTaxCalculationHash();

  @$internal
  @override
  $ProviderElement<ReitTaxResult> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReitTaxResult create(Ref ref) {
    return reitTaxCalculation(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReitTaxResult value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReitTaxResult>(value),
    );
  }
}

String _$reitTaxCalculationHash() =>
    r'f69d54ee78e502d12f2db5ca937b8a362174fe6e';

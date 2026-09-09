// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reitRepository)
final reitRepositoryProvider = ReitRepositoryProvider._();

final class ReitRepositoryProvider
    extends $FunctionalProvider<ReitRepository, ReitRepository, ReitRepository>
    with $Provider<ReitRepository> {
  ReitRepositoryProvider._()
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

String _$reitRepositoryHash() => r'a3e0fae30a474b3e4b6838ceb361c261f33c418a';

@ProviderFor(watchReits)
final watchReitsProvider = WatchReitsProvider._();

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
  WatchReitsProvider._()
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
final deleteReitProvider = DeleteReitFamily._();

final class DeleteReitProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  DeleteReitProvider._({
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
  DeleteReitFamily._()
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
final watchPayoutReportReitProvider = WatchPayoutReportReitProvider._();

final class WatchPayoutReportReitProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  WatchPayoutReportReitProvider._()
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cto_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ctoRepository)
final ctoRepositoryProvider = CtoRepositoryProvider._();

final class CtoRepositoryProvider
    extends $FunctionalProvider<CtoRepository, CtoRepository, CtoRepository>
    with $Provider<CtoRepository> {
  CtoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ctoRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ctoRepositoryHash();

  @$internal
  @override
  $ProviderElement<CtoRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CtoRepository create(Ref ref) {
    return ctoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CtoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CtoRepository>(value),
    );
  }
}

String _$ctoRepositoryHash() => r'c8baffe53413bd96d77b976e716ca793a185a857';

@ProviderFor(watchCtos)
final watchCtosProvider = WatchCtosProvider._();

final class WatchCtosProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CtoEntry>>,
          List<CtoEntry>,
          Stream<List<CtoEntry>>
        >
    with $FutureModifier<List<CtoEntry>>, $StreamProvider<List<CtoEntry>> {
  WatchCtosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchCtosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchCtosHash();

  @$internal
  @override
  $StreamProviderElement<List<CtoEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CtoEntry>> create(Ref ref) {
    return watchCtos(ref);
  }
}

String _$watchCtosHash() => r'66bc9edce570b6d47558e89ea02996dddb32064e';

@ProviderFor(refreshCtoPrices)
final refreshCtoPricesProvider = RefreshCtoPricesProvider._();

final class RefreshCtoPricesProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  RefreshCtoPricesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'refreshCtoPricesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$refreshCtoPricesHash();

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    return refreshCtoPrices(ref);
  }
}

String _$refreshCtoPricesHash() => r'3ecd6cf618c0551ce453d0579341763f2c449a1e';

@ProviderFor(watchPayoutReportCto)
final watchPayoutReportCtoProvider = WatchPayoutReportCtoProvider._();

final class WatchPayoutReportCtoProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  WatchPayoutReportCtoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPayoutReportCtoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPayoutReportCtoHash();

  @$internal
  @override
  $StreamProviderElement<PayoutReportData> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PayoutReportData> create(Ref ref) {
    return watchPayoutReportCto(ref);
  }
}

String _$watchPayoutReportCtoHash() =>
    r'45036084deadbda4f1a88d001945808fc83b6b92';

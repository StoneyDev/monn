// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pea_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(peaRepository)
const peaRepositoryProvider = PeaRepositoryProvider._();

final class PeaRepositoryProvider
    extends $FunctionalProvider<PeaRepository, PeaRepository, PeaRepository>
    with $Provider<PeaRepository> {
  const PeaRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'peaRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$peaRepositoryHash();

  @$internal
  @override
  $ProviderElement<PeaRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PeaRepository create(Ref ref) {
    return peaRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PeaRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PeaRepository>(value),
    );
  }
}

String _$peaRepositoryHash() => r'b6729e77b19b056b2fcae1676daeb4792b2072bf';

@ProviderFor(getPea)
const getPeaProvider = GetPeaProvider._();

final class GetPeaProvider
    extends
        $FunctionalProvider<
          AsyncValue<PeaEntry?>,
          PeaEntry?,
          FutureOr<PeaEntry?>
        >
    with $FutureModifier<PeaEntry?>, $FutureProvider<PeaEntry?> {
  const GetPeaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPeaProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPeaHash();

  @$internal
  @override
  $FutureProviderElement<PeaEntry?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<PeaEntry?> create(Ref ref) {
    return getPea(ref);
  }
}

String _$getPeaHash() => r'527e7f3867342204757630dcf5f7f2e3962bcaa7';

@ProviderFor(getPayoutReportPea)
const getPayoutReportPeaProvider = GetPayoutReportPeaProvider._();

final class GetPayoutReportPeaProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          FutureOr<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $FutureProvider<PayoutReportData> {
  const GetPayoutReportPeaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPayoutReportPeaProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPayoutReportPeaHash();

  @$internal
  @override
  $FutureProviderElement<PayoutReportData> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PayoutReportData> create(Ref ref) {
    return getPayoutReportPea(ref);
  }
}

String _$getPayoutReportPeaHash() =>
    r'562f685d7539f5c0ab35903eb86e1ca4f54a57c5';

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

String _$peaRepositoryHash() => r'46f15a02f111a1eed0834449ccab835e01df9526';

@ProviderFor(getPea)
const getPeaProvider = GetPeaProvider._();

final class GetPeaProvider
    extends $FunctionalProvider<AsyncValue<Pea?>, Pea?, FutureOr<Pea?>>
    with $FutureModifier<Pea?>, $FutureProvider<Pea?> {
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
  $FutureProviderElement<Pea?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Pea?> create(Ref ref) {
    return getPea(ref);
  }
}

String _$getPeaHash() => r'36a208facf7acb501ac42cf517c7e569aeccbd9b';

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
    r'ca5e13700c7d52c8fa16dee3551f969b90c6f20e';

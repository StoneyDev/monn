// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'per_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(perRepository)
const perRepositoryProvider = PerRepositoryProvider._();

final class PerRepositoryProvider
    extends $FunctionalProvider<PerRepository, PerRepository, PerRepository>
    with $Provider<PerRepository> {
  const PerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'perRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$perRepositoryHash();

  @$internal
  @override
  $ProviderElement<PerRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PerRepository create(Ref ref) {
    return perRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PerRepository>(value),
    );
  }
}

String _$perRepositoryHash() => r'ca37ffdbc62c8130c540088e190f313eba8babf9';

@ProviderFor(watchPer)
const watchPerProvider = WatchPerProvider._();

final class WatchPerProvider
    extends $FunctionalProvider<AsyncValue<Per?>, Per?, Stream<Per?>>
    with $FutureModifier<Per?>, $StreamProvider<Per?> {
  const WatchPerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPerHash();

  @$internal
  @override
  $StreamProviderElement<Per?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Per?> create(Ref ref) {
    return watchPer(ref);
  }
}

String _$watchPerHash() => r'719299057a11f2037bb2d676f249bdf15c5482a2';

@ProviderFor(watchPayoutReportPer)
const watchPayoutReportPerProvider = WatchPayoutReportPerProvider._();

final class WatchPayoutReportPerProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  const WatchPayoutReportPerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPayoutReportPerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPayoutReportPerHash();

  @$internal
  @override
  $StreamProviderElement<PayoutReportData> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PayoutReportData> create(Ref ref) {
    return watchPayoutReportPer(ref);
  }
}

String _$watchPayoutReportPerHash() =>
    r'5494d0820f3342ed364d45676b7950960c315347';

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

String _$perRepositoryHash() => r'bf7852c2a984bbec5f96222e0a3f1b9ab57c2528';

@ProviderFor(watchPer)
const watchPerProvider = WatchPerProvider._();

final class WatchPerProvider
    extends
        $FunctionalProvider<AsyncValue<PerEntry?>, PerEntry?, Stream<PerEntry?>>
    with $FutureModifier<PerEntry?>, $StreamProvider<PerEntry?> {
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
  $StreamProviderElement<PerEntry?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<PerEntry?> create(Ref ref) {
    return watchPer(ref);
  }
}

String _$watchPerHash() => r'f29aae1069ad1e23b65345b56ef107059a2f7f10';

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

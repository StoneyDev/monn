// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_worth_history_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(netWorthHistoryRepository)
final netWorthHistoryRepositoryProvider = NetWorthHistoryRepositoryProvider._();

final class NetWorthHistoryRepositoryProvider
    extends
        $FunctionalProvider<
          NetWorthHistoryRepository,
          NetWorthHistoryRepository,
          NetWorthHistoryRepository
        >
    with $Provider<NetWorthHistoryRepository> {
  NetWorthHistoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'netWorthHistoryRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$netWorthHistoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<NetWorthHistoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NetWorthHistoryRepository create(Ref ref) {
    return netWorthHistoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetWorthHistoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetWorthHistoryRepository>(value),
    );
  }
}

String _$netWorthHistoryRepositoryHash() =>
    r'aa49d0912338fcd9bdf10d6c29a9f66ce83c4554';

@ProviderFor(watchNetWorthHistory)
final watchNetWorthHistoryProvider = WatchNetWorthHistoryProvider._();

final class WatchNetWorthHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<NetWorthSnapshot>>,
          List<NetWorthSnapshot>,
          Stream<List<NetWorthSnapshot>>
        >
    with
        $FutureModifier<List<NetWorthSnapshot>>,
        $StreamProvider<List<NetWorthSnapshot>> {
  WatchNetWorthHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchNetWorthHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchNetWorthHistoryHash();

  @$internal
  @override
  $StreamProviderElement<List<NetWorthSnapshot>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<NetWorthSnapshot>> create(Ref ref) {
    return watchNetWorthHistory(ref);
  }
}

String _$watchNetWorthHistoryHash() =>
    r'148246a63cd190d612b85a566e2c274e0abb3800';

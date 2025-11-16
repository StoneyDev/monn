// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_strike_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(counterStrikeRepository)
const counterStrikeRepositoryProvider = CounterStrikeRepositoryProvider._();

final class CounterStrikeRepositoryProvider
    extends
        $FunctionalProvider<
          CounterStrikeRepository,
          CounterStrikeRepository,
          CounterStrikeRepository
        >
    with $Provider<CounterStrikeRepository> {
  const CounterStrikeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterStrikeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterStrikeRepositoryHash();

  @$internal
  @override
  $ProviderElement<CounterStrikeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CounterStrikeRepository create(Ref ref) {
    return counterStrikeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CounterStrikeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CounterStrikeRepository>(value),
    );
  }
}

String _$counterStrikeRepositoryHash() =>
    r'e648adf8fb332485d0a64152b76cf79655ad7c20';

@ProviderFor(watchCounterStrikes)
const watchCounterStrikesProvider = WatchCounterStrikesProvider._();

final class WatchCounterStrikesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CounterStrike>>,
          List<CounterStrike>,
          Stream<List<CounterStrike>>
        >
    with
        $FutureModifier<List<CounterStrike>>,
        $StreamProvider<List<CounterStrike>> {
  const WatchCounterStrikesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchCounterStrikesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchCounterStrikesHash();

  @$internal
  @override
  $StreamProviderElement<List<CounterStrike>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CounterStrike>> create(Ref ref) {
    return watchCounterStrikes(ref);
  }
}

String _$watchCounterStrikesHash() =>
    r'523856e5651eceea82b3c2d66fb0ebc80b6b91b2';

@ProviderFor(watchPayoutReportCounterStrike)
const watchPayoutReportCounterStrikeProvider =
    WatchPayoutReportCounterStrikeProvider._();

final class WatchPayoutReportCounterStrikeProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  const WatchPayoutReportCounterStrikeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPayoutReportCounterStrikeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPayoutReportCounterStrikeHash();

  @$internal
  @override
  $StreamProviderElement<PayoutReportData> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PayoutReportData> create(Ref ref) {
    return watchPayoutReportCounterStrike(ref);
  }
}

String _$watchPayoutReportCounterStrikeHash() =>
    r'07b85248c9b352b8d155d48ddc5fb73cb3611408';

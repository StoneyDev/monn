// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_strike_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(counterStrikeRepository)
final counterStrikeRepositoryProvider = CounterStrikeRepositoryProvider._();

final class CounterStrikeRepositoryProvider
    extends
        $FunctionalProvider<
          CounterStrikeRepository,
          CounterStrikeRepository,
          CounterStrikeRepository
        >
    with $Provider<CounterStrikeRepository> {
  CounterStrikeRepositoryProvider._()
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
    r'8d9dda1c5ea5e06193424d02f32eeb08ae8fa764';

@ProviderFor(watchCounterStrikes)
final watchCounterStrikesProvider = WatchCounterStrikesProvider._();

final class WatchCounterStrikesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CounterStrikeEntry>>,
          List<CounterStrikeEntry>,
          Stream<List<CounterStrikeEntry>>
        >
    with
        $FutureModifier<List<CounterStrikeEntry>>,
        $StreamProvider<List<CounterStrikeEntry>> {
  WatchCounterStrikesProvider._()
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
  $StreamProviderElement<List<CounterStrikeEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CounterStrikeEntry>> create(Ref ref) {
    return watchCounterStrikes(ref);
  }
}

String _$watchCounterStrikesHash() =>
    r'aefe4b1c55754c0af8bf3e5ba0af8015c3bb5888';

@ProviderFor(watchPayoutReportCounterStrike)
final watchPayoutReportCounterStrikeProvider =
    WatchPayoutReportCounterStrikeProvider._();

final class WatchPayoutReportCounterStrikeProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  WatchPayoutReportCounterStrikeProvider._()
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
    r'2dd7c635db61cf6f68c8976fa40bc01014d35023';

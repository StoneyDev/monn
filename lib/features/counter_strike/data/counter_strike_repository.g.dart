// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_strike_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$counterStrikeRepositoryHash() =>
    r'670116348d99247f99c81ce8d68804ffabe934a0';

/// See also [counterStrikeRepository].
@ProviderFor(counterStrikeRepository)
final counterStrikeRepositoryProvider =
    Provider<CounterStrikeRepository>.internal(
  counterStrikeRepository,
  name: r'counterStrikeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$counterStrikeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CounterStrikeRepositoryRef = ProviderRef<CounterStrikeRepository>;
String _$watchCounterStrikesHash() =>
    r'b75151e1f9bdbda42fc51b6e08c0b47c5362e82e';

/// See also [watchCounterStrikes].
@ProviderFor(watchCounterStrikes)
final watchCounterStrikesProvider =
    AutoDisposeStreamProvider<List<CounterStrike>>.internal(
  watchCounterStrikes,
  name: r'watchCounterStrikesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchCounterStrikesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchCounterStrikesRef
    = AutoDisposeStreamProviderRef<List<CounterStrike>>;
String _$watchPayoutReportCounterStrikeHash() =>
    r'7514223a29b9555132f9429de4a0ce17869a5249';

/// See also [watchPayoutReportCounterStrike].
@ProviderFor(watchPayoutReportCounterStrike)
final watchPayoutReportCounterStrikeProvider =
    AutoDisposeStreamProvider<PayoutReportData>.internal(
  watchPayoutReportCounterStrike,
  name: r'watchPayoutReportCounterStrikeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchPayoutReportCounterStrikeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchPayoutReportCounterStrikeRef
    = AutoDisposeStreamProviderRef<PayoutReportData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

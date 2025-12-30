// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_worth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(watchTotalNetWorth)
const watchTotalNetWorthProvider = WatchTotalNetWorthProvider._();

final class WatchTotalNetWorthProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  const WatchTotalNetWorthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchTotalNetWorthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchTotalNetWorthHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return watchTotalNetWorth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$watchTotalNetWorthHash() =>
    r'07dabcc665be091fb16538499eb334511f491e50';

@ProviderFor(watchSortedSavings)
const watchSortedSavingsProvider = WatchSortedSavingsFamily._();

final class WatchSortedSavingsProvider
    extends $FunctionalProvider<List<Savings>, List<Savings>, List<Savings>>
    with $Provider<List<Savings>> {
  const WatchSortedSavingsProvider._({
    required WatchSortedSavingsFamily super.from,
    required SavingsFilter super.argument,
  }) : super(
         retry: null,
         name: r'watchSortedSavingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchSortedSavingsHash();

  @override
  String toString() {
    return r'watchSortedSavingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Savings>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Savings> create(Ref ref) {
    final argument = this.argument as SavingsFilter;
    return watchSortedSavings(ref, filter: argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Savings> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Savings>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSortedSavingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchSortedSavingsHash() =>
    r'e03bc03d5ab7b840613c97632603ba4a01f6b200';

final class WatchSortedSavingsFamily extends $Family
    with $FunctionalFamilyOverride<List<Savings>, SavingsFilter> {
  const WatchSortedSavingsFamily._()
    : super(
        retry: null,
        name: r'watchSortedSavingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WatchSortedSavingsProvider call({required SavingsFilter filter}) =>
      WatchSortedSavingsProvider._(argument: filter, from: this);

  @override
  String toString() => r'watchSortedSavingsProvider';
}

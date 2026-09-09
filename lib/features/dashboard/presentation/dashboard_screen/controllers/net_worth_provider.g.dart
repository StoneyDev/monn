// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_worth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getFinalAmount)
final getFinalAmountProvider = GetFinalAmountFamily._();

final class GetFinalAmountProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  GetFinalAmountProvider._({
    required GetFinalAmountFamily super.from,
    required SavingsType super.argument,
  }) : super(
         retry: null,
         name: r'getFinalAmountProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getFinalAmountHash();

  @override
  String toString() {
    return r'getFinalAmountProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    final argument = this.argument as SavingsType;
    return getFinalAmount(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFinalAmountProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getFinalAmountHash() => r'ca0ca54b43bd41fe2e420498aa63c3a06b0c8534';

final class GetFinalAmountFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<double>, SavingsType> {
  GetFinalAmountFamily._()
    : super(
        retry: null,
        name: r'getFinalAmountProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetFinalAmountProvider call(SavingsType type) =>
      GetFinalAmountProvider._(argument: type, from: this);

  @override
  String toString() => r'getFinalAmountProvider';
}

@ProviderFor(watchTotalNetWorth)
final watchTotalNetWorthProvider = WatchTotalNetWorthProvider._();

final class WatchTotalNetWorthProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  WatchTotalNetWorthProvider._()
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
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return watchTotalNetWorth(ref);
  }
}

String _$watchTotalNetWorthHash() =>
    r'f3bbc6ee5c6e60de02e373c2f59143bef2783794';

@ProviderFor(watchSortedSavings)
final watchSortedSavingsProvider = WatchSortedSavingsFamily._();

final class WatchSortedSavingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SortedSaving>>,
          List<SortedSaving>,
          FutureOr<List<SortedSaving>>
        >
    with
        $FutureModifier<List<SortedSaving>>,
        $FutureProvider<List<SortedSaving>> {
  WatchSortedSavingsProvider._({
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
  $FutureProviderElement<List<SortedSaving>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SortedSaving>> create(Ref ref) {
    final argument = this.argument as SavingsFilter;
    return watchSortedSavings(ref, filter: argument);
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
    r'4b207b596c94e95f8adf303d80f07d324919cb4a';

final class WatchSortedSavingsFamily extends $Family
    with
        $FunctionalFamilyOverride<FutureOr<List<SortedSaving>>, SavingsFilter> {
  WatchSortedSavingsFamily._()
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

@ProviderFor(watchFinalAmounts)
final watchFinalAmountsProvider = WatchFinalAmountsProvider._();

final class WatchFinalAmountsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<SavingsType, double>>,
          Map<SavingsType, double>,
          FutureOr<Map<SavingsType, double>>
        >
    with
        $FutureModifier<Map<SavingsType, double>>,
        $FutureProvider<Map<SavingsType, double>> {
  WatchFinalAmountsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchFinalAmountsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchFinalAmountsHash();

  @$internal
  @override
  $FutureProviderElement<Map<SavingsType, double>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<SavingsType, double>> create(Ref ref) {
    return watchFinalAmounts(ref);
  }
}

String _$watchFinalAmountsHash() => r'b0abf2061cf16f87fbf4c8d6abf65c18da147209';

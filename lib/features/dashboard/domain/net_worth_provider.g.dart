// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_worth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getFinalAmount)
const getFinalAmountProvider = GetFinalAmountFamily._();

final class GetFinalAmountProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  const GetFinalAmountProvider._({
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
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    final argument = this.argument as SavingsType;
    return getFinalAmount(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
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

String _$getFinalAmountHash() => r'c04fd76633439b4901b31f8f835e98cba5f7f44a';

final class GetFinalAmountFamily extends $Family
    with $FunctionalFamilyOverride<double, SavingsType> {
  const GetFinalAmountFamily._()
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
    r'c8e9e1542c5021f56fd45009e611c5bb1e4a390b';

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
    r'f2c095e0ce3ef2c56399a040aba31d0d3f9486c1';

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

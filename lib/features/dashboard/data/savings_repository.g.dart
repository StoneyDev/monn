// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(savingsRepository)
const savingsRepositoryProvider = SavingsRepositoryProvider._();

final class SavingsRepositoryProvider
    extends
        $FunctionalProvider<
          SavingsRepository,
          SavingsRepository,
          SavingsRepository
        >
    with $Provider<SavingsRepository> {
  const SavingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SavingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SavingsRepository create(Ref ref) {
    return savingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavingsRepository>(value),
    );
  }
}

String _$savingsRepositoryHash() => r'f91e71a5fba2ff21e67786f0b95fc4a3a6631b2d';

@ProviderFor(watchSavings)
const watchSavingsProvider = WatchSavingsFamily._();

final class WatchSavingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Savings>>,
          List<Savings>,
          Stream<List<Savings>>
        >
    with $FutureModifier<List<Savings>>, $StreamProvider<List<Savings>> {
  const WatchSavingsProvider._({
    required WatchSavingsFamily super.from,
    required SavingsFilter? super.argument,
  }) : super(
         retry: null,
         name: r'watchSavingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$watchSavingsHash();

  @override
  String toString() {
    return r'watchSavingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Savings>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Savings>> create(Ref ref) {
    final argument = this.argument as SavingsFilter?;
    return watchSavings(ref, filter: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchSavingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$watchSavingsHash() => r'd167f759454c535778290c332f82dbac2388f3c4';

final class WatchSavingsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Savings>>, SavingsFilter?> {
  const WatchSavingsFamily._()
    : super(
        retry: null,
        name: r'watchSavingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WatchSavingsProvider call({SavingsFilter? filter}) =>
      WatchSavingsProvider._(argument: filter, from: this);

  @override
  String toString() => r'watchSavingsProvider';
}

@ProviderFor(getSavings)
const getSavingsProvider = GetSavingsFamily._();

final class GetSavingsProvider
    extends
        $FunctionalProvider<AsyncValue<Savings?>, Savings?, FutureOr<Savings?>>
    with $FutureModifier<Savings?>, $FutureProvider<Savings?> {
  const GetSavingsProvider._({
    required GetSavingsFamily super.from,
    required SavingsType super.argument,
  }) : super(
         retry: null,
         name: r'getSavingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getSavingsHash();

  @override
  String toString() {
    return r'getSavingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Savings?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Savings?> create(Ref ref) {
    final argument = this.argument as SavingsType;
    return getSavings(ref, type: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSavingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getSavingsHash() => r'ed5d6e5976aaed5e202ea478abc353b3ade330ae';

final class GetSavingsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Savings?>, SavingsType> {
  const GetSavingsFamily._()
    : super(
        retry: null,
        name: r'getSavingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetSavingsProvider call({required SavingsType type}) =>
      GetSavingsProvider._(argument: type, from: this);

  @override
  String toString() => r'getSavingsProvider';
}

@ProviderFor(watchPayoutReportSavings)
const watchPayoutReportSavingsProvider = WatchPayoutReportSavingsProvider._();

final class WatchPayoutReportSavingsProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  const WatchPayoutReportSavingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPayoutReportSavingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPayoutReportSavingsHash();

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    return watchPayoutReportSavings(ref);
  }
}

String _$watchPayoutReportSavingsHash() =>
    r'264ee4bf0fbda51f8f7dbd89b30894079149ee9c';

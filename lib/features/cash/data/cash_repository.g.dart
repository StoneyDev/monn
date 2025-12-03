// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cashRepository)
const cashRepositoryProvider = CashRepositoryProvider._();

final class CashRepositoryProvider
    extends $FunctionalProvider<CashRepository, CashRepository, CashRepository>
    with $Provider<CashRepository> {
  const CashRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cashRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cashRepositoryHash();

  @$internal
  @override
  $ProviderElement<CashRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CashRepository create(Ref ref) {
    return cashRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CashRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CashRepository>(value),
    );
  }
}

String _$cashRepositoryHash() => r'8d0ab430e60024b0bb61b79ac48a4e69746dc01a';

@ProviderFor(deleteCash)
const deleteCashProvider = DeleteCashFamily._();

final class DeleteCashProvider
    extends $FunctionalProvider<AsyncValue<void>, void, FutureOr<void>>
    with $FutureModifier<void>, $FutureProvider<void> {
  const DeleteCashProvider._({
    required DeleteCashFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'deleteCashProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deleteCashHash();

  @override
  String toString() {
    return r'deleteCashProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<void> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<void> create(Ref ref) {
    final argument = this.argument as int;
    return deleteCash(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteCashProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deleteCashHash() => r'b9f4136c64c6b6bc607c0664b4ea166fa1d35c26';

final class DeleteCashFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<void>, int> {
  const DeleteCashFamily._()
    : super(
        retry: null,
        name: r'deleteCashProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  DeleteCashProvider call(int id) =>
      DeleteCashProvider._(argument: id, from: this);

  @override
  String toString() => r'deleteCashProvider';
}

@ProviderFor(watchCashs)
const watchCashsProvider = WatchCashsProvider._();

final class WatchCashsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Cash>>,
          List<Cash>,
          Stream<List<Cash>>
        >
    with $FutureModifier<List<Cash>>, $StreamProvider<List<Cash>> {
  const WatchCashsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchCashsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchCashsHash();

  @$internal
  @override
  $StreamProviderElement<List<Cash>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Cash>> create(Ref ref) {
    return watchCashs(ref);
  }
}

String _$watchCashsHash() => r'b0f3ac255da0ce9f9bb4521a1861a1f1d4de3498';

@ProviderFor(watchPayoutReportCash)
const watchPayoutReportCashProvider = WatchPayoutReportCashProvider._();

final class WatchPayoutReportCashProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  const WatchPayoutReportCashProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPayoutReportCashProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPayoutReportCashHash();

  @$internal
  @override
  $StreamProviderElement<PayoutReportData> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PayoutReportData> create(Ref ref) {
    return watchPayoutReportCash(ref);
  }
}

String _$watchPayoutReportCashHash() =>
    r'6030a8d11c0986c31116149ef7efdd25baceeb95';

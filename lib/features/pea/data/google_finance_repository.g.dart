// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_finance_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(googleFinanceRepository)
const googleFinanceRepositoryProvider = GoogleFinanceRepositoryProvider._();

final class GoogleFinanceRepositoryProvider
    extends
        $FunctionalProvider<
          GoogleFinanceRepository,
          GoogleFinanceRepository,
          GoogleFinanceRepository
        >
    with $Provider<GoogleFinanceRepository> {
  const GoogleFinanceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleFinanceRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleFinanceRepositoryHash();

  @$internal
  @override
  $ProviderElement<GoogleFinanceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GoogleFinanceRepository create(Ref ref) {
    return googleFinanceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleFinanceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleFinanceRepository>(value),
    );
  }
}

String _$googleFinanceRepositoryHash() =>
    r'cc26f2be6027b847de42a7b5caef75009f56d5c9';

@ProviderFor(getEtfPriceMarket)
const getEtfPriceMarketProvider = GetEtfPriceMarketFamily._();

final class GetEtfPriceMarketProvider
    extends $FunctionalProvider<AsyncValue<double>, double, FutureOr<double>>
    with $FutureModifier<double>, $FutureProvider<double> {
  const GetEtfPriceMarketProvider._({
    required GetEtfPriceMarketFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'getEtfPriceMarketProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getEtfPriceMarketHash();

  @override
  String toString() {
    return r'getEtfPriceMarketProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<double> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<double> create(Ref ref) {
    final argument = this.argument as String?;
    return getEtfPriceMarket(ref, stock: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetEtfPriceMarketProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getEtfPriceMarketHash() => r'dbf84d771da564e009dee4dacad2a8d915d0b7b0';

final class GetEtfPriceMarketFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<double>, String?> {
  const GetEtfPriceMarketFamily._()
    : super(
        retry: null,
        name: r'getEtfPriceMarketProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetEtfPriceMarketProvider call({String? stock}) =>
      GetEtfPriceMarketProvider._(argument: stock, from: this);

  @override
  String toString() => r'getEtfPriceMarketProvider';
}

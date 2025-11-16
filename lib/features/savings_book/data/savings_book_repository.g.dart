// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_book_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(savingsBookRepository)
const savingsBookRepositoryProvider = SavingsBookRepositoryProvider._();

final class SavingsBookRepositoryProvider
    extends
        $FunctionalProvider<
          SavingsBookRepository,
          SavingsBookRepository,
          SavingsBookRepository
        >
    with $Provider<SavingsBookRepository> {
  const SavingsBookRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savingsBookRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savingsBookRepositoryHash();

  @$internal
  @override
  $ProviderElement<SavingsBookRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SavingsBookRepository create(Ref ref) {
    return savingsBookRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavingsBookRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavingsBookRepository>(value),
    );
  }
}

String _$savingsBookRepositoryHash() =>
    r'690661e5461d384b33d960b9f14ac57ed537b20e';

@ProviderFor(watchSavingsBooks)
const watchSavingsBooksProvider = WatchSavingsBooksProvider._();

final class WatchSavingsBooksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SavingsBook>>,
          List<SavingsBook>,
          Stream<List<SavingsBook>>
        >
    with
        $FutureModifier<List<SavingsBook>>,
        $StreamProvider<List<SavingsBook>> {
  const WatchSavingsBooksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchSavingsBooksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchSavingsBooksHash();

  @$internal
  @override
  $StreamProviderElement<List<SavingsBook>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SavingsBook>> create(Ref ref) {
    return watchSavingsBooks(ref);
  }
}

String _$watchSavingsBooksHash() => r'5661c67a2ce0bebd9c0d3221c3856d9db7f67b09';

@ProviderFor(watchPayoutReportSavingsBook)
const watchPayoutReportSavingsBookProvider =
    WatchPayoutReportSavingsBookProvider._();

final class WatchPayoutReportSavingsBookProvider
    extends
        $FunctionalProvider<
          AsyncValue<PayoutReportData>,
          PayoutReportData,
          Stream<PayoutReportData>
        >
    with $FutureModifier<PayoutReportData>, $StreamProvider<PayoutReportData> {
  const WatchPayoutReportSavingsBookProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchPayoutReportSavingsBookProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchPayoutReportSavingsBookHash();

  @$internal
  @override
  $StreamProviderElement<PayoutReportData> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PayoutReportData> create(Ref ref) {
    return watchPayoutReportSavingsBook(ref);
  }
}

String _$watchPayoutReportSavingsBookHash() =>
    r'7588be93a953c971546e05b04c19d2f39b86dc7f';

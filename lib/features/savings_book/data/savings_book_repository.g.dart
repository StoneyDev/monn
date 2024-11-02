// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_book_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savingsBookRepositoryHash() =>
    r'b7c636e94668f20701e36e53883b036f661503a9';

/// See also [savingsBookRepository].
@ProviderFor(savingsBookRepository)
final savingsBookRepositoryProvider = Provider<SavingsBookRepository>.internal(
  savingsBookRepository,
  name: r'savingsBookRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savingsBookRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavingsBookRepositoryRef = ProviderRef<SavingsBookRepository>;
String _$watchSavingsBooksHash() => r'b069958dba3b41ffb87b2061df38712a7d7dea63';

/// See also [watchSavingsBooks].
@ProviderFor(watchSavingsBooks)
final watchSavingsBooksProvider =
    AutoDisposeStreamProvider<List<SavingsBook>>.internal(
  watchSavingsBooks,
  name: r'watchSavingsBooksProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchSavingsBooksHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchSavingsBooksRef = AutoDisposeStreamProviderRef<List<SavingsBook>>;
String _$watchPayoutReportSavingsBookHash() =>
    r'ae13a34451d6771293fd3628f4d5abe1c1dbee13';

/// See also [watchPayoutReportSavingsBook].
@ProviderFor(watchPayoutReportSavingsBook)
final watchPayoutReportSavingsBookProvider =
    AutoDisposeStreamProvider<PayoutReportData>.internal(
  watchPayoutReportSavingsBook,
  name: r'watchPayoutReportSavingsBookProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchPayoutReportSavingsBookHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchPayoutReportSavingsBookRef
    = AutoDisposeStreamProviderRef<PayoutReportData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

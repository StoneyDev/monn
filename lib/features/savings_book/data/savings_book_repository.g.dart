// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_book_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savingsBookRepositoryHash() =>
    r'690661e5461d384b33d960b9f14ac57ed537b20e';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SavingsBookRepositoryRef = ProviderRef<SavingsBookRepository>;
String _$watchSavingsBooksHash() => r'5661c67a2ce0bebd9c0d3221c3856d9db7f67b09';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchSavingsBooksRef = AutoDisposeStreamProviderRef<List<SavingsBook>>;
String _$watchPayoutReportSavingsBookHash() =>
    r'7588be93a953c971546e05b04c19d2f39b86dc7f';

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

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchPayoutReportSavingsBookRef
    = AutoDisposeStreamProviderRef<PayoutReportData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

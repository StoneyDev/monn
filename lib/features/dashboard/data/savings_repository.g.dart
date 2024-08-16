// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savingsRepositoryHash() => r'925c78b80d718ddda9c437808af6a585a16ed1ae';

/// See also [savingsRepository].
@ProviderFor(savingsRepository)
final savingsRepositoryProvider = Provider<SavingsRepository>.internal(
  savingsRepository,
  name: r'savingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$savingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SavingsRepositoryRef = ProviderRef<SavingsRepository>;
String _$watchSavingsHash() => r'ad9253c832abc85270c8872fca5286369c7ab3f5';

/// See also [watchSavings].
@ProviderFor(watchSavings)
final watchSavingsProvider = AutoDisposeStreamProvider<List<Savings>>.internal(
  watchSavings,
  name: r'watchSavingsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$watchSavingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WatchSavingsRef = AutoDisposeStreamProviderRef<List<Savings>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

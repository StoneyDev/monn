// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expenses_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(expensesRepository)
const expensesRepositoryProvider = ExpensesRepositoryProvider._();

final class ExpensesRepositoryProvider
    extends
        $FunctionalProvider<
          ExpensesRepository,
          ExpensesRepository,
          ExpensesRepository
        >
    with $Provider<ExpensesRepository> {
  const ExpensesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'expensesRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$expensesRepositoryHash();

  @$internal
  @override
  $ProviderElement<ExpensesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ExpensesRepository create(Ref ref) {
    return expensesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ExpensesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ExpensesRepository>(value),
    );
  }
}

String _$expensesRepositoryHash() =>
    r'ba3352c23d5ce8d3222a52425ad78efbc40a73c9';

@ProviderFor(watchBudget)
const watchBudgetProvider = WatchBudgetProvider._();

final class WatchBudgetProvider
    extends $FunctionalProvider<AsyncValue<Budget?>, Budget?, Stream<Budget?>>
    with $FutureModifier<Budget?>, $StreamProvider<Budget?> {
  const WatchBudgetProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchBudgetProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchBudgetHash();

  @$internal
  @override
  $StreamProviderElement<Budget?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Budget?> create(Ref ref) {
    return watchBudget(ref);
  }
}

String _$watchBudgetHash() => r'd32d4d1dbaf8230b517389b7ebf65d7cd5db0d0f';

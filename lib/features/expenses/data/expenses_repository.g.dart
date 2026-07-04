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
    r'4ef20680e3bed71a34cc3e2988b818c6c7f5c9e7';

@ProviderFor(watchBudget)
const watchBudgetProvider = WatchBudgetProvider._();

final class WatchBudgetProvider
    extends
        $FunctionalProvider<
          AsyncValue<BudgetEntry?>,
          BudgetEntry?,
          Stream<BudgetEntry?>
        >
    with $FutureModifier<BudgetEntry?>, $StreamProvider<BudgetEntry?> {
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
  $StreamProviderElement<BudgetEntry?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<BudgetEntry?> create(Ref ref) {
    return watchBudget(ref);
  }
}

String _$watchBudgetHash() => r'a28d80b3ff47bd17b64f34e9e2576e2d856bf4c6';

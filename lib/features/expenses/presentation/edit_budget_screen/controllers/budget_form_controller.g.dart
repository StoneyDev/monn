// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BudgetFormController)
const budgetFormControllerProvider = BudgetFormControllerProvider._();

final class BudgetFormControllerProvider
    extends $AsyncNotifierProvider<BudgetFormController, BudgetForm> {
  const BudgetFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'budgetFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$budgetFormControllerHash();

  @$internal
  @override
  BudgetFormController create() => BudgetFormController();
}

String _$budgetFormControllerHash() =>
    r'24af39709ef5d7180f6e13f8450b247e87fd5398';

abstract class _$BudgetFormController extends $AsyncNotifier<BudgetForm> {
  FutureOr<BudgetForm> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<BudgetForm>, BudgetForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BudgetForm>, BudgetForm>,
              AsyncValue<BudgetForm>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

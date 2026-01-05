// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_book_interest_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SavingsBookInterestFormController)
const savingsBookInterestFormControllerProvider =
    SavingsBookInterestFormControllerProvider._();

final class SavingsBookInterestFormControllerProvider
    extends
        $NotifierProvider<
          SavingsBookInterestFormController,
          SavingsBookInterestForm
        > {
  const SavingsBookInterestFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savingsBookInterestFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$savingsBookInterestFormControllerHash();

  @$internal
  @override
  SavingsBookInterestFormController create() =>
      SavingsBookInterestFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavingsBookInterestForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavingsBookInterestForm>(value),
    );
  }
}

String _$savingsBookInterestFormControllerHash() =>
    r'5d0ff566f7683d8d187ac06f342aca54c6f31944';

abstract class _$SavingsBookInterestFormController
    extends $Notifier<SavingsBookInterestForm> {
  SavingsBookInterestForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<SavingsBookInterestForm, SavingsBookInterestForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SavingsBookInterestForm, SavingsBookInterestForm>,
              SavingsBookInterestForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

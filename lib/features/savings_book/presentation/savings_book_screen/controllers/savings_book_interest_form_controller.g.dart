// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_book_interest_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SavingsBookInterestFormController)
final savingsBookInterestFormControllerProvider =
    SavingsBookInterestFormControllerProvider._();

final class SavingsBookInterestFormControllerProvider
    extends
        $NotifierProvider<
          SavingsBookInterestFormController,
          SavingsBookInterestForm
        > {
  SavingsBookInterestFormControllerProvider._()
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
    r'a09508a1f45509bf91c22754d270139377923802';

abstract class _$SavingsBookInterestFormController
    extends $Notifier<SavingsBookInterestForm> {
  SavingsBookInterestForm build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
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
    return element.handleCreate(ref, build);
  }
}

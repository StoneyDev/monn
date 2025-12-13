// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_life_insurance_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitLifeInsuranceFormController)
const submitLifeInsuranceFormControllerProvider =
    SubmitLifeInsuranceFormControllerProvider._();

final class SubmitLifeInsuranceFormControllerProvider
    extends $AsyncNotifierProvider<SubmitLifeInsuranceFormController, void> {
  const SubmitLifeInsuranceFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitLifeInsuranceFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$submitLifeInsuranceFormControllerHash();

  @$internal
  @override
  SubmitLifeInsuranceFormController create() =>
      SubmitLifeInsuranceFormController();
}

String _$submitLifeInsuranceFormControllerHash() =>
    r'7c175c1a7fc119e82f43016f486d0342dba07f05';

abstract class _$SubmitLifeInsuranceFormController
    extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

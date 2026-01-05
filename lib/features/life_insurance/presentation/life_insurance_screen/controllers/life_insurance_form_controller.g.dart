// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_insurance_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LifeInsuranceFormController)
const lifeInsuranceFormControllerProvider =
    LifeInsuranceFormControllerProvider._();

final class LifeInsuranceFormControllerProvider
    extends $NotifierProvider<LifeInsuranceFormController, LifeInsuranceForm> {
  const LifeInsuranceFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lifeInsuranceFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lifeInsuranceFormControllerHash();

  @$internal
  @override
  LifeInsuranceFormController create() => LifeInsuranceFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LifeInsuranceForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LifeInsuranceForm>(value),
    );
  }
}

String _$lifeInsuranceFormControllerHash() =>
    r'8e7592585f27aa8aa0c427647d13e62a072f0f82';

abstract class _$LifeInsuranceFormController
    extends $Notifier<LifeInsuranceForm> {
  LifeInsuranceForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LifeInsuranceForm, LifeInsuranceForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LifeInsuranceForm, LifeInsuranceForm>,
              LifeInsuranceForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

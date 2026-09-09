// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_insurance_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LifeInsuranceFormController)
final lifeInsuranceFormControllerProvider =
    LifeInsuranceFormControllerProvider._();

final class LifeInsuranceFormControllerProvider
    extends $NotifierProvider<LifeInsuranceFormController, LifeInsuranceForm> {
  LifeInsuranceFormControllerProvider._()
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
    r'7a8274bd56f23454081e45dbe57308466ff9401c';

abstract class _$LifeInsuranceFormController
    extends $Notifier<LifeInsuranceForm> {
  LifeInsuranceForm build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<LifeInsuranceForm, LifeInsuranceForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LifeInsuranceForm, LifeInsuranceForm>,
              LifeInsuranceForm,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

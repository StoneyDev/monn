// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crowdfunding_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CrowdfundingFormController)
const crowdfundingFormControllerProvider =
    CrowdfundingFormControllerProvider._();

final class CrowdfundingFormControllerProvider
    extends $NotifierProvider<CrowdfundingFormController, CrowdfundingForm> {
  const CrowdfundingFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'crowdfundingFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$crowdfundingFormControllerHash();

  @$internal
  @override
  CrowdfundingFormController create() => CrowdfundingFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CrowdfundingForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CrowdfundingForm>(value),
    );
  }
}

String _$crowdfundingFormControllerHash() =>
    r'b3b097eb78db6409e26cf4aa3addfc6ac101932a';

abstract class _$CrowdfundingFormController
    extends $Notifier<CrowdfundingForm> {
  CrowdfundingForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CrowdfundingForm, CrowdfundingForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CrowdfundingForm, CrowdfundingForm>,
              CrowdfundingForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

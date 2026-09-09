// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crowdfunding_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CrowdfundingFormController)
final crowdfundingFormControllerProvider =
    CrowdfundingFormControllerProvider._();

final class CrowdfundingFormControllerProvider
    extends $NotifierProvider<CrowdfundingFormController, CrowdfundingForm> {
  CrowdfundingFormControllerProvider._()
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
    r'4934346e65039eab028af20b406cd9c1f81a4273';

abstract class _$CrowdfundingFormController
    extends $Notifier<CrowdfundingForm> {
  CrowdfundingForm build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CrowdfundingForm, CrowdfundingForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CrowdfundingForm, CrowdfundingForm>,
              CrowdfundingForm,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

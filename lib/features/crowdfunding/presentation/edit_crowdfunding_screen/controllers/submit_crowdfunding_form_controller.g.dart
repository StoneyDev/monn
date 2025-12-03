// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_crowdfunding_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitCrowdfundingFormController)
const submitCrowdfundingFormControllerProvider =
    SubmitCrowdfundingFormControllerProvider._();

final class SubmitCrowdfundingFormControllerProvider
    extends $AsyncNotifierProvider<SubmitCrowdfundingFormController, void> {
  const SubmitCrowdfundingFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitCrowdfundingFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitCrowdfundingFormControllerHash();

  @$internal
  @override
  SubmitCrowdfundingFormController create() =>
      SubmitCrowdfundingFormController();
}

String _$submitCrowdfundingFormControllerHash() =>
    r'73bb87c362bb591ae073b26bc99c70eedd6471e2';

abstract class _$SubmitCrowdfundingFormController extends $AsyncNotifier<void> {
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

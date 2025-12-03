// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_pea_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitPeaFormController)
const submitPeaFormControllerProvider = SubmitPeaFormControllerProvider._();

final class SubmitPeaFormControllerProvider
    extends $AsyncNotifierProvider<SubmitPeaFormController, void> {
  const SubmitPeaFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitPeaFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitPeaFormControllerHash();

  @$internal
  @override
  SubmitPeaFormController create() => SubmitPeaFormController();
}

String _$submitPeaFormControllerHash() =>
    r'fccb36630197632ee76f32c04eaec642259ee062';

abstract class _$SubmitPeaFormController extends $AsyncNotifier<void> {
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

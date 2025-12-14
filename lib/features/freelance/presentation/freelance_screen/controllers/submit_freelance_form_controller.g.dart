// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_freelance_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitFreelanceFormController)
const submitFreelanceFormControllerProvider =
    SubmitFreelanceFormControllerProvider._();

final class SubmitFreelanceFormControllerProvider
    extends $AsyncNotifierProvider<SubmitFreelanceFormController, void> {
  const SubmitFreelanceFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitFreelanceFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitFreelanceFormControllerHash();

  @$internal
  @override
  SubmitFreelanceFormController create() => SubmitFreelanceFormController();
}

String _$submitFreelanceFormControllerHash() =>
    r'8128609a58bd79a77fc6f147e4f246e27dfd56dd';

abstract class _$SubmitFreelanceFormController extends $AsyncNotifier<void> {
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

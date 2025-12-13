// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_per_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitPerFormController)
const submitPerFormControllerProvider = SubmitPerFormControllerProvider._();

final class SubmitPerFormControllerProvider
    extends $AsyncNotifierProvider<SubmitPerFormController, void> {
  const SubmitPerFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitPerFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitPerFormControllerHash();

  @$internal
  @override
  SubmitPerFormController create() => SubmitPerFormController();
}

String _$submitPerFormControllerHash() =>
    r'3b9909a6f5e56689c0ad20e89c15bd797ed1cbb8';

abstract class _$SubmitPerFormController extends $AsyncNotifier<void> {
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_reit_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitReitFormController)
const submitReitFormControllerProvider = SubmitReitFormControllerProvider._();

final class SubmitReitFormControllerProvider
    extends $AsyncNotifierProvider<SubmitReitFormController, void> {
  const SubmitReitFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitReitFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitReitFormControllerHash();

  @$internal
  @override
  SubmitReitFormController create() => SubmitReitFormController();
}

String _$submitReitFormControllerHash() =>
    r'0b032f449f9eeeabbacfde98a83a10f2b635204a';

abstract class _$SubmitReitFormController extends $AsyncNotifier<void> {
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

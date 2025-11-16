// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_cash_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitCashFormController)
const submitCashFormControllerProvider = SubmitCashFormControllerProvider._();

final class SubmitCashFormControllerProvider
    extends $AsyncNotifierProvider<SubmitCashFormController, void> {
  const SubmitCashFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitCashFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitCashFormControllerHash();

  @$internal
  @override
  SubmitCashFormController create() => SubmitCashFormController();
}

String _$submitCashFormControllerHash() =>
    r'e8160b14a872f9a56ca0eda5d8a233b91a7e20ca';

abstract class _$SubmitCashFormController extends $AsyncNotifier<void> {
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

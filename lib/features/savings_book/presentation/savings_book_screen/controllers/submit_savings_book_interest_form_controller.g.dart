// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_savings_book_interest_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitSavingsBookInterestFormController)
const submitSavingsBookInterestFormControllerProvider =
    SubmitSavingsBookInterestFormControllerProvider._();

final class SubmitSavingsBookInterestFormControllerProvider
    extends
        $AsyncNotifierProvider<SubmitSavingsBookInterestFormController, void> {
  const SubmitSavingsBookInterestFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitSavingsBookInterestFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$submitSavingsBookInterestFormControllerHash();

  @$internal
  @override
  SubmitSavingsBookInterestFormController create() =>
      SubmitSavingsBookInterestFormController();
}

String _$submitSavingsBookInterestFormControllerHash() =>
    r'9cef504314d9d789bdb898efe5b58fda31b896c1';

abstract class _$SubmitSavingsBookInterestFormController
    extends $AsyncNotifier<void> {
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

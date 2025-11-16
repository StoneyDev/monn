// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_savings_book_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitSavingsBookFormController)
const submitSavingsBookFormControllerProvider =
    SubmitSavingsBookFormControllerProvider._();

final class SubmitSavingsBookFormControllerProvider
    extends $AsyncNotifierProvider<SubmitSavingsBookFormController, void> {
  const SubmitSavingsBookFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitSavingsBookFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitSavingsBookFormControllerHash();

  @$internal
  @override
  SubmitSavingsBookFormController create() => SubmitSavingsBookFormController();
}

String _$submitSavingsBookFormControllerHash() =>
    r'fc27dbf75803b2674efa2ec98307592eeeafa9ea';

abstract class _$SubmitSavingsBookFormController extends $AsyncNotifier<void> {
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

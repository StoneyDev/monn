// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_crypto_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitCryptoFormController)
const submitCryptoFormControllerProvider =
    SubmitCryptoFormControllerProvider._();

final class SubmitCryptoFormControllerProvider
    extends $AsyncNotifierProvider<SubmitCryptoFormController, void> {
  const SubmitCryptoFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitCryptoFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitCryptoFormControllerHash();

  @$internal
  @override
  SubmitCryptoFormController create() => SubmitCryptoFormController();
}

String _$submitCryptoFormControllerHash() =>
    r'8f83200448cc30623525772baf8d7a6d8ac8a48a';

abstract class _$SubmitCryptoFormController extends $AsyncNotifier<void> {
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

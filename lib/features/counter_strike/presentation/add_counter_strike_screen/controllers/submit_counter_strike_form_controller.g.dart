// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_counter_strike_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitCounterStrikeFormController)
const submitCounterStrikeFormControllerProvider =
    SubmitCounterStrikeFormControllerProvider._();

final class SubmitCounterStrikeFormControllerProvider
    extends $AsyncNotifierProvider<SubmitCounterStrikeFormController, void> {
  const SubmitCounterStrikeFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitCounterStrikeFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$submitCounterStrikeFormControllerHash();

  @$internal
  @override
  SubmitCounterStrikeFormController create() =>
      SubmitCounterStrikeFormController();
}

String _$submitCounterStrikeFormControllerHash() =>
    r'6b527cf4248519de1274c9eb006467f74d00101e';

abstract class _$SubmitCounterStrikeFormController
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

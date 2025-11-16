// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_reit_dividend_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SubmitReitDividendFormController)
const submitReitDividendFormControllerProvider =
    SubmitReitDividendFormControllerProvider._();

final class SubmitReitDividendFormControllerProvider
    extends $AsyncNotifierProvider<SubmitReitDividendFormController, void> {
  const SubmitReitDividendFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitReitDividendFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitReitDividendFormControllerHash();

  @$internal
  @override
  SubmitReitDividendFormController create() =>
      SubmitReitDividendFormController();
}

String _$submitReitDividendFormControllerHash() =>
    r'eafeb20b8c365ed8638f2f5cd6a6c649e0577443';

abstract class _$SubmitReitDividendFormController extends $AsyncNotifier<void> {
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

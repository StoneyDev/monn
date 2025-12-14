// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelance_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FreelanceFormController)
const freelanceFormControllerProvider = FreelanceFormControllerProvider._();

final class FreelanceFormControllerProvider
    extends $NotifierProvider<FreelanceFormController, FreelanceForm> {
  const FreelanceFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'freelanceFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$freelanceFormControllerHash();

  @$internal
  @override
  FreelanceFormController create() => FreelanceFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FreelanceForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FreelanceForm>(value),
    );
  }
}

String _$freelanceFormControllerHash() =>
    r'18c8e6506e25c8272da94ebf0b5aba3455b1d4b3';

abstract class _$FreelanceFormController extends $Notifier<FreelanceForm> {
  FreelanceForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<FreelanceForm, FreelanceForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FreelanceForm, FreelanceForm>,
              FreelanceForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

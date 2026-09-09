// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freelance_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FreelanceFormController)
final freelanceFormControllerProvider = FreelanceFormControllerProvider._();

final class FreelanceFormControllerProvider
    extends $NotifierProvider<FreelanceFormController, FreelanceForm> {
  FreelanceFormControllerProvider._()
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
    r'd5da41a2b4bf9b4541fd4831384ad3ab84454c4e';

abstract class _$FreelanceFormController extends $Notifier<FreelanceForm> {
  FreelanceForm build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<FreelanceForm, FreelanceForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FreelanceForm, FreelanceForm>,
              FreelanceForm,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

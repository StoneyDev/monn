// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pea_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PeaFormController)
const peaFormControllerProvider = PeaFormControllerProvider._();

final class PeaFormControllerProvider
    extends $NotifierProvider<PeaFormController, PeaForm> {
  const PeaFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'peaFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$peaFormControllerHash();

  @$internal
  @override
  PeaFormController create() => PeaFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PeaForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PeaForm>(value),
    );
  }
}

String _$peaFormControllerHash() => r'6d37e7b3d4b98fe82cdc7930a4d3dcafe6f04f86';

abstract class _$PeaFormController extends $Notifier<PeaForm> {
  PeaForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PeaForm, PeaForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PeaForm, PeaForm>,
              PeaForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pea_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PeaFormController)
final peaFormControllerProvider = PeaFormControllerProvider._();

final class PeaFormControllerProvider
    extends $NotifierProvider<PeaFormController, PeaForm> {
  PeaFormControllerProvider._()
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

String _$peaFormControllerHash() => r'a9353d889fb8e1896eba704d579c583ab3c5caf4';

abstract class _$PeaFormController extends $Notifier<PeaForm> {
  PeaForm build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PeaForm, PeaForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PeaForm, PeaForm>,
              PeaForm,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

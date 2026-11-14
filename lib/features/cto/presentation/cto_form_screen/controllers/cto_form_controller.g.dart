// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cto_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CtoFormController)
final ctoFormControllerProvider = CtoFormControllerProvider._();

final class CtoFormControllerProvider
    extends $NotifierProvider<CtoFormController, CtoForm> {
  CtoFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ctoFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ctoFormControllerHash();

  @$internal
  @override
  CtoFormController create() => CtoFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CtoForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CtoForm>(value),
    );
  }
}

String _$ctoFormControllerHash() => r'36f82bbd3a736d522c3618c62a0a9ea3eec9b797';

abstract class _$CtoFormController extends $Notifier<CtoForm> {
  CtoForm build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CtoForm, CtoForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CtoForm, CtoForm>,
              CtoForm,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

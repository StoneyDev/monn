// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'per_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PerFormController)
final perFormControllerProvider = PerFormControllerProvider._();

final class PerFormControllerProvider
    extends $NotifierProvider<PerFormController, PerForm> {
  PerFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'perFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$perFormControllerHash();

  @$internal
  @override
  PerFormController create() => PerFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PerForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PerForm>(value),
    );
  }
}

String _$perFormControllerHash() => r'c0218062b5761826f2d4aa825a718e87ee602ebd';

abstract class _$PerFormController extends $Notifier<PerForm> {
  PerForm build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PerForm, PerForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PerForm, PerForm>,
              PerForm,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

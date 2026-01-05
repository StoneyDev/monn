// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'per_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PerFormController)
const perFormControllerProvider = PerFormControllerProvider._();

final class PerFormControllerProvider
    extends $NotifierProvider<PerFormController, PerForm> {
  const PerFormControllerProvider._()
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

String _$perFormControllerHash() => r'f883d555e2b3effb084652b704ec2033bb305ab1';

abstract class _$PerFormController extends $Notifier<PerForm> {
  PerForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<PerForm, PerForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PerForm, PerForm>,
              PerForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

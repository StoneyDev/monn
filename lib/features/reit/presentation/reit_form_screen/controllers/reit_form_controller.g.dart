// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReitFormController)
const reitFormControllerProvider = ReitFormControllerProvider._();

final class ReitFormControllerProvider
    extends $NotifierProvider<ReitFormController, ReitForm> {
  const ReitFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reitFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reitFormControllerHash();

  @$internal
  @override
  ReitFormController create() => ReitFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReitForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReitForm>(value),
    );
  }
}

String _$reitFormControllerHash() =>
    r'5470de06b7422dc2ea823c9e05e9bbeeaa82df5c';

abstract class _$ReitFormController extends $Notifier<ReitForm> {
  ReitForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ReitForm, ReitForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReitForm, ReitForm>,
              ReitForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

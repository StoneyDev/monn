// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReitFormController)
final reitFormControllerProvider = ReitFormControllerProvider._();

final class ReitFormControllerProvider
    extends $NotifierProvider<ReitFormController, ReitForm> {
  ReitFormControllerProvider._()
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
    r'c7e5b625935216e95b4e0f8aa9c5a431f18adf94';

abstract class _$ReitFormController extends $Notifier<ReitForm> {
  ReitForm build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ReitForm, ReitForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReitForm, ReitForm>,
              ReitForm,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

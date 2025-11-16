// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_dividend_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReitDividendFormController)
const reitDividendFormControllerProvider =
    ReitDividendFormControllerProvider._();

final class ReitDividendFormControllerProvider
    extends $NotifierProvider<ReitDividendFormController, ReitDividendForm> {
  const ReitDividendFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reitDividendFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reitDividendFormControllerHash();

  @$internal
  @override
  ReitDividendFormController create() => ReitDividendFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReitDividendForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReitDividendForm>(value),
    );
  }
}

String _$reitDividendFormControllerHash() =>
    r'6e8daddccb865e78543b65d2ae2ee1ea87ce44ce';

abstract class _$ReitDividendFormController
    extends $Notifier<ReitDividendForm> {
  ReitDividendForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ReitDividendForm, ReitDividendForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ReitDividendForm, ReitDividendForm>,
              ReitDividendForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

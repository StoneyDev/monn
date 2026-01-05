// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cash_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CashFormController)
const cashFormControllerProvider = CashFormControllerProvider._();

final class CashFormControllerProvider
    extends $NotifierProvider<CashFormController, CashForm> {
  const CashFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cashFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cashFormControllerHash();

  @$internal
  @override
  CashFormController create() => CashFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CashForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CashForm>(value),
    );
  }
}

String _$cashFormControllerHash() =>
    r'c7d89680f1a495beed80cefc91aeb6bf251b125a';

abstract class _$CashFormController extends $Notifier<CashForm> {
  CashForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CashForm, CashForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CashForm, CashForm>,
              CashForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

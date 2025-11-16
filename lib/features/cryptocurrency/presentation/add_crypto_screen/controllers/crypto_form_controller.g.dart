// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CryptoFormController)
const cryptoFormControllerProvider = CryptoFormControllerProvider._();

final class CryptoFormControllerProvider
    extends $NotifierProvider<CryptoFormController, CryptoForm> {
  const CryptoFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cryptoFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cryptoFormControllerHash();

  @$internal
  @override
  CryptoFormController create() => CryptoFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CryptoForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CryptoForm>(value),
    );
  }
}

String _$cryptoFormControllerHash() =>
    r'6320da1fa2fcf0447ba7069e26b41d1283720481';

abstract class _$CryptoFormController extends $Notifier<CryptoForm> {
  CryptoForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CryptoForm, CryptoForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CryptoForm, CryptoForm>,
              CryptoForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

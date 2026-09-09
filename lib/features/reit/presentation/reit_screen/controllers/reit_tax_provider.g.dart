// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reit_tax_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(reitTaxCalculation)
final reitTaxCalculationProvider = ReitTaxCalculationProvider._();

final class ReitTaxCalculationProvider
    extends $FunctionalProvider<ReitTaxResult, ReitTaxResult, ReitTaxResult>
    with $Provider<ReitTaxResult> {
  ReitTaxCalculationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reitTaxCalculationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reitTaxCalculationHash();

  @$internal
  @override
  $ProviderElement<ReitTaxResult> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReitTaxResult create(Ref ref) {
    return reitTaxCalculation(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReitTaxResult value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReitTaxResult>(value),
    );
  }
}

String _$reitTaxCalculationHash() =>
    r'b6c629e1fe51aea3c41372c145b80503fe9e2ac5';

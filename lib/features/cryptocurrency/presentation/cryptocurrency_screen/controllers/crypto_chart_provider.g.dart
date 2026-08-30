// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_chart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(watchCryptoChart)
const watchCryptoChartProvider = WatchCryptoChartProvider._();

final class WatchCryptoChartProvider
    extends $FunctionalProvider<AsyncValue<Chart>, Chart, Stream<Chart>>
    with $FutureModifier<Chart>, $StreamProvider<Chart> {
  const WatchCryptoChartProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchCryptoChartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchCryptoChartHash();

  @$internal
  @override
  $StreamProviderElement<Chart> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Chart> create(Ref ref) {
    return watchCryptoChart(ref);
  }
}

String _$watchCryptoChartHash() => r'00d191bdc380360c058348bbda3b3512b1318d92';

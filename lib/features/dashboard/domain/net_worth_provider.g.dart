// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'net_worth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(watchTotalNetWorth)
const watchTotalNetWorthProvider = WatchTotalNetWorthProvider._();

final class WatchTotalNetWorthProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  const WatchTotalNetWorthProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchTotalNetWorthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchTotalNetWorthHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return watchTotalNetWorth(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$watchTotalNetWorthHash() =>
    r'36cd702e3ea48daeb8bcc017da96893a2bdee45b';

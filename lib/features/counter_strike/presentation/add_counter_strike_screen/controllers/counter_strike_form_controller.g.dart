// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_strike_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CounterStrikeFormController)
final counterStrikeFormControllerProvider =
    CounterStrikeFormControllerProvider._();

final class CounterStrikeFormControllerProvider
    extends $NotifierProvider<CounterStrikeFormController, CounterStrikeForm> {
  CounterStrikeFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterStrikeFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterStrikeFormControllerHash();

  @$internal
  @override
  CounterStrikeFormController create() => CounterStrikeFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CounterStrikeForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CounterStrikeForm>(value),
    );
  }
}

String _$counterStrikeFormControllerHash() =>
    r'99ca61a58df0cd6e4b72e1a87c6b29f7c93a2a72';

abstract class _$CounterStrikeFormController
    extends $Notifier<CounterStrikeForm> {
  CounterStrikeForm build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CounterStrikeForm, CounterStrikeForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CounterStrikeForm, CounterStrikeForm>,
              CounterStrikeForm,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

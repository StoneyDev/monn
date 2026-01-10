// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_strike_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CounterStrikeFormController)
const counterStrikeFormControllerProvider =
    CounterStrikeFormControllerProvider._();

final class CounterStrikeFormControllerProvider
    extends $NotifierProvider<CounterStrikeFormController, CounterStrikeForm> {
  const CounterStrikeFormControllerProvider._()
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
    r'fcc063b5fc3738bd1b4bc4e6319f09491201d442';

abstract class _$CounterStrikeFormController
    extends $Notifier<CounterStrikeForm> {
  CounterStrikeForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CounterStrikeForm, CounterStrikeForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CounterStrikeForm, CounterStrikeForm>,
              CounterStrikeForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

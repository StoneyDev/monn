// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_switch_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeSwitchController)
const themeSwitchControllerProvider = ThemeSwitchControllerProvider._();

final class ThemeSwitchControllerProvider
    extends $AsyncNotifierProvider<ThemeSwitchController, ThemeMode> {
  const ThemeSwitchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeSwitchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeSwitchControllerHash();

  @$internal
  @override
  ThemeSwitchController create() => ThemeSwitchController();
}

String _$themeSwitchControllerHash() =>
    r'8e657c6dc115d2f7f6cca4c322bc84916150b3a7';

abstract class _$ThemeSwitchController extends $AsyncNotifier<ThemeMode> {
  FutureOr<ThemeMode> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ThemeMode>, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ThemeMode>, ThemeMode>,
              AsyncValue<ThemeMode>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

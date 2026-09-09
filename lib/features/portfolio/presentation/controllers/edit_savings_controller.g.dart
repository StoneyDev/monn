// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_savings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditSavingsController)
final editSavingsControllerProvider = EditSavingsControllerProvider._();

final class EditSavingsControllerProvider
    extends $AsyncNotifierProvider<EditSavingsController, void> {
  EditSavingsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editSavingsControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editSavingsControllerHash();

  @$internal
  @override
  EditSavingsController create() => EditSavingsController();
}

String _$editSavingsControllerHash() =>
    r'c037f498dbd96fff7bcfe39459d3a200d013d809';

abstract class _$EditSavingsController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

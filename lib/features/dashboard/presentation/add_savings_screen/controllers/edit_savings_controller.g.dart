// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_savings_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditSavingsController)
const editSavingsControllerProvider = EditSavingsControllerProvider._();

final class EditSavingsControllerProvider
    extends $AsyncNotifierProvider<EditSavingsController, void> {
  const EditSavingsControllerProvider._()
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
    r'8ef79a215e87bbb19be183e0a677372179f77632';

abstract class _$EditSavingsController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

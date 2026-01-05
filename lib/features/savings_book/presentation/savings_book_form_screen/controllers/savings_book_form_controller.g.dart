// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_book_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SavingsBookFormController)
const savingsBookFormControllerProvider = SavingsBookFormControllerProvider._();

final class SavingsBookFormControllerProvider
    extends $NotifierProvider<SavingsBookFormController, SavingsBookForm> {
  const SavingsBookFormControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savingsBookFormControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savingsBookFormControllerHash();

  @$internal
  @override
  SavingsBookFormController create() => SavingsBookFormController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavingsBookForm value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavingsBookForm>(value),
    );
  }
}

String _$savingsBookFormControllerHash() =>
    r'982239f579930b20dc77ab743400f723a3e1c41c';

abstract class _$SavingsBookFormController extends $Notifier<SavingsBookForm> {
  SavingsBookForm build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SavingsBookForm, SavingsBookForm>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SavingsBookForm, SavingsBookForm>,
              SavingsBookForm,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

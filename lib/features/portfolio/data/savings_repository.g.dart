// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'savings_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(savingsRepository)
final savingsRepositoryProvider = SavingsRepositoryProvider._();

final class SavingsRepositoryProvider
    extends
        $FunctionalProvider<
          SavingsRepository,
          SavingsRepository,
          SavingsRepository
        >
    with $Provider<SavingsRepository> {
  SavingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'savingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$savingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SavingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SavingsRepository create(Ref ref) {
    return savingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavingsRepository>(value),
    );
  }
}

String _$savingsRepositoryHash() => r'a94e211295a2b5f5e1020429a0ff4f7905e249b5';

@ProviderFor(watchSavings)
final watchSavingsProvider = WatchSavingsProvider._();

final class WatchSavingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SavingsEntry>>,
          List<SavingsEntry>,
          Stream<List<SavingsEntry>>
        >
    with
        $FutureModifier<List<SavingsEntry>>,
        $StreamProvider<List<SavingsEntry>> {
  WatchSavingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchSavingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchSavingsHash();

  @$internal
  @override
  $StreamProviderElement<List<SavingsEntry>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SavingsEntry>> create(Ref ref) {
    return watchSavings(ref);
  }
}

String _$watchSavingsHash() => r'758ecfefbd2d1032fdda62caf5ea6f93a43802f9';

@ProviderFor(getSavings)
final getSavingsProvider = GetSavingsFamily._();

final class GetSavingsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SavingsEntry?>,
          SavingsEntry?,
          FutureOr<SavingsEntry?>
        >
    with $FutureModifier<SavingsEntry?>, $FutureProvider<SavingsEntry?> {
  GetSavingsProvider._({
    required GetSavingsFamily super.from,
    required SavingsType super.argument,
  }) : super(
         retry: null,
         name: r'getSavingsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getSavingsHash();

  @override
  String toString() {
    return r'getSavingsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<SavingsEntry?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SavingsEntry?> create(Ref ref) {
    final argument = this.argument as SavingsType;
    return getSavings(ref, type: argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSavingsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getSavingsHash() => r'a632fdd1ff27ba185f3903ece5292ed04cc1f8c5';

final class GetSavingsFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<SavingsEntry?>, SavingsType> {
  GetSavingsFamily._()
    : super(
        retry: null,
        name: r'getSavingsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetSavingsProvider call({required SavingsType type}) =>
      GetSavingsProvider._(argument: type, from: this);

  @override
  String toString() => r'getSavingsProvider';
}

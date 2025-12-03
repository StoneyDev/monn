// ignore_for_file: lines_longer_than_80_chars .

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';

final class DebugObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    Logger().d(
      'Provider updated: ${context.provider.name ?? context.provider.runtimeType}\nPrevious value: ${previousValue ?? '-'}\nNew value: $newValue',
    );
  }

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    Logger().d(
      'Provider added: ${context.provider.name ?? context.provider.runtimeType} ($value).',
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    Logger().d(
      'Provider disposed: ${context.provider.name ?? context.provider.runtimeType}',
    );
  }
}

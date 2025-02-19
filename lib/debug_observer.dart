// ignore_for_file: avoid_print, lines_longer_than_80_chars .

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/web.dart';

class DebugObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    Logger().d(
      'Provider updated: ${provider.name ?? provider.runtimeType}\nPrevious value: ${previousValue ?? '-'}\nNew value: $newValue',
    );
  }

  @override
  void didAddProvider(
    ProviderBase<dynamic> provider,
    Object? value,
    ProviderContainer container,
  ) {
    Logger().d(
      'Provider added: ${provider.name ?? provider.runtimeType} ($value).',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<dynamic> provider,
    ProviderContainer container,
  ) {
    Logger().d(
      'Provider disposed: ${provider.name ?? provider.runtimeType}',
    );
  }
}

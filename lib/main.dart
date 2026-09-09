import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/app.dart';
import 'package:monn/debug_observer.dart';
import 'package:monn/generated/codegen_loader.g.dart';
import 'package:monn/shared/widgets/monn_error.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await (EasyLocalization.ensureInitialized(), _systemChrome()).wait;
  _registerErrorHandlers();

  runApp(
    ProviderScope(
      observers: kDebugMode ? [DebugObserver()] : null,
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('fr'), Locale('en')],
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const App(),
      ),
    ),
  );
}

// Setting device orientation
Future<void> _systemChrome() => SystemChrome.setPreferredOrientations([
  DeviceOrientation.portraitUp,
  DeviceOrientation.portraitDown,
]);

void _registerErrorHandlers() {
  // Show some error UI if any uncaught exception happens
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (error, _) {
    debugPrint(error.toString());
    return true;
  };
  // Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (error) {
    return Scaffold(
      body: SafeArea(child: MonnError(message: error.exceptionAsString())),
    );
  };
}

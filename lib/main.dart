import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/app.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:monn/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initPackages();

  _registerErrorHandlers();

  _systemChrome();

  runApp(
    ProviderScope(
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [Locale('fr'), Locale('en')],
        child: const App(),
      ),
    ),
  );
}

Future<void> _initPackages() {
  return Future.wait<void>(
    [LocalDatabase().init(), EasyLocalization.ensureInitialized()],
  );
}

void _systemChrome() {
  // Setting device orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void _registerErrorHandlers() {
  // Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, _) {
    debugPrint(error.toString());
    return true;
  };
  // Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (error) {
    return Scaffold(
      body: SafeArea(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: AppColors.lightError,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Error widget : ${error.exceptionAsString()}',
              style: const TextStyle(color: AppColors.error),
            ),
          ),
        ),
      ),
    );
  };
}

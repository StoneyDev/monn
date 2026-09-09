import 'dart:async';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/cryptocurrency/data/coin_market_cap_repository.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen/controllers/net_worth_provider.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen/dashboard_screen.dart';
import 'package:monn/features/pea/data/etf_repository.dart';
import 'package:monn/features/settings/presentation/settings_screen/settings_screen.dart';
import 'package:monn/generated/codegen_loader.g.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/database_backup.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUpAll(() async {
    SharedPreferences.setMockInitialValues({});
    await EasyLocalization.ensureInitialized();
  });

  setUp(() => SharedPreferences.setMockInitialValues({}));

  testWidgets('starts restore after the settings route is closed', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    const filter = SavingsFilter.sortByFinalAmountDesc;
    final restoreCompleter = Completer<bool>();
    final localDatabase = _PendingRestoreDatabase(restoreCompleter.future);
    addTearDown(localDatabase.close);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          localDatabaseProvider.overrideWithValue(AsyncData(localDatabase)),
          watchSortedSavingsProvider(
            filter: filter,
          ).overrideWithValue(const AsyncData([])),
          watchTotalNetWorthProvider.overrideWithValue(const AsyncData(0)),
          getCryptoPriceMarketProvider.overrideWithValue(const AsyncData([])),
          getEtfPriceMarketProvider.overrideWithValue(const AsyncData(0)),
        ],
        child: EasyLocalization(
          path: 'assets/translations',
          supportedLocales: const [Locale('fr'), Locale('en')],
          fallbackLocale: const Locale('en'),
          startLocale: const Locale('fr'),
          assetLoader: const CodegenLoader(),
          child: const _TestApp(),
        ),
      ),
    );
    await tester.pumpAndSettle();
    final dashboardContext = tester.element(find.byType(DashboardScreen));

    await tester.tap(
      find.ancestor(
        of: find.byType(iconoir.Settings),
        matching: find.byType(IconButton),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byType(SettingsScreen), findsOneWidget);
    expect(TickerMode.valuesOf(dashboardContext), isFalse);

    Navigator.of(
      tester.element(find.byType(SettingsScreen)),
    ).pop((externalBackup: File('unused.db')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    await tester.pump();

    expect(find.byType(SettingsScreen), findsNothing);
    expect(TickerMode.valuesOf(dashboardContext), isTrue);
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(localDatabase.restoreCalls, 1);

    final surface = find
        .descendant(of: find.byType(Dialog), matching: find.byType(Material))
        .first;
    final dialogWidth = tester.getSize(surface).width;
    for (final step in DatabaseRestoreStep.values) {
      localDatabase.progress?.call(step);
      await tester.pump();
      expect(tester.getSize(surface).width, dialogWidth, reason: step.name);
    }

    restoreCompleter.complete(true);
    await tester.pump();
    await tester.pump();
    expect(tester.getSize(surface).width, dialogWidth);
  });
}

class _PendingRestoreDatabase extends LocalDatabase {
  _PendingRestoreDatabase(this._restoreResult);

  final Future<bool> _restoreResult;
  final AppDatabase _database = AppDatabase(NativeDatabase.memory());
  int restoreCalls = 0;
  DatabaseRestoreProgress? progress;

  @override
  AppDatabase get database => _database;

  @override
  Future<bool> restore(File _, {DatabaseRestoreProgress? onProgress}) {
    restoreCalls++;
    progress = onProgress;
    onProgress?.call(DatabaseRestoreStep.validating);
    return _restoreResult;
  }

  @override
  Future<void> close() => _database.close();
}

class _TestApp extends StatelessWidget {
  const _TestApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const DashboardScreen(),
    );
  }
}

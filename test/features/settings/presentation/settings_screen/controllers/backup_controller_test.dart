import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen/controllers/net_worth_provider.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/features/settings/presentation/settings_screen/controllers/backup_controller.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/database_backup.dart';
import 'package:monn/shared/local/local_database.dart';

import '../../../../../utils.dart';

void main() {
  test('rebinds the database provider when restore rolls back', () async {
    final originalDatabase = AppDatabase(NativeDatabase.memory());
    final localDatabase = _RollbackLocalDatabase(originalDatabase);
    addTearDown(localDatabase.close);
    final container = createContainer(
      overrides: [
        localDatabaseProvider.overrideWithValue(AsyncData(localDatabase)),
      ],
    );

    expect(container.read(appDatabaseProvider), same(originalDatabase));

    final restored = await container
        .read(backupControllerProvider.notifier)
        .restoreDB(externalBackup: File('unused.db'));

    expect(restored, isFalse);
    expect(container.read(appDatabaseProvider), same(localDatabase.database));
    expect(localDatabase.database, isNot(same(originalDatabase)));
  });

  test(
    'refreshes active database streams after a successful restore',
    () async {
      final directory = Directory.systemTemp.createTempSync(
        'monn_provider_restore_',
      );
      addTearDown(() => directory.deleteSync(recursive: true));
      final restoredFile = File('${directory.path}/restored.db');
      final restoredSeed = AppDatabase(NativeDatabase(restoredFile));
      await restoredSeed
          .into(restoredSeed.savingsEntries)
          .insert(
            SavingsEntriesCompanion.insert(type: 'pea'),
          );
      await restoredSeed.close();
      final originalDatabase = AppDatabase(
        NativeDatabase(File('${directory.path}/original.db')),
      );
      await originalDatabase
          .into(originalDatabase.savingsEntries)
          .insert(
            SavingsEntriesCompanion.insert(type: 'cash'),
          );
      final localDatabase = _SuccessfulRestoreLocalDatabase(
        originalDatabase,
        restoredFile,
      );
      addTearDown(localDatabase.close);
      final container = createContainer(
        overrides: [
          localDatabaseProvider.overrideWithValue(AsyncData(localDatabase)),
        ],
      );
      _keepSavingsStreamAlive(container);

      expect(await _readSavingsType(container), 'cash');

      final restored = await container
          .read(backupControllerProvider.notifier)
          .restoreDB(externalBackup: File('unused.db'));

      expect(restored, isTrue);
      expect(await _readSavingsType(container), 'pea');
    },
  );

  test(
    'refreshes the dashboard after a successful restore',
    () async {
      final directory = Directory.systemTemp.createTempSync(
        'monn_dashboard_restore_',
      );
      addTearDown(() => directory.deleteSync(recursive: true));
      final restoredFile = File('${directory.path}/restored.db');
      final restoredSeed = AppDatabase(NativeDatabase(restoredFile));
      await restoredSeed.close();
      final originalDatabase = AppDatabase(
        NativeDatabase(File('${directory.path}/original.db')),
      );
      final localDatabase = _SuccessfulRestoreLocalDatabase(
        originalDatabase,
        restoredFile,
      );
      addTearDown(localDatabase.close);
      final container = createContainer(
        overrides: [
          localDatabaseProvider.overrideWithValue(AsyncData(localDatabase)),
        ],
      );
      const filter = SavingsFilter.sortByFinalAmountDesc;
      container.listen(
        watchSortedSavingsProvider(filter: filter),
        (_, _) {},
      );

      await container
          .read(watchSortedSavingsProvider(filter: filter).future)
          .timeout(const Duration(seconds: 2));

      final restored = await container
          .read(backupControllerProvider.notifier)
          .restoreDB(externalBackup: File('unused.db'));

      expect(restored, isTrue);
      await container
          .read(watchSortedSavingsProvider(filter: filter).future)
          .timeout(const Duration(seconds: 2));
    },
  );

  test(
    'restores while the dashboard keeps the background database active',
    () async {
      final directory = Directory.systemTemp.createTempSync(
        'monn_dashboard_background_restore_',
      );
      addTearDown(() => directory.deleteSync(recursive: true));
      final sourceFile = File('${directory.path}/restored.db');
      final source = AppDatabase(NativeDatabase(sourceFile));
      await source.customSelect('SELECT 1').getSingle();
      await source.close();
      final destination = File('${directory.path}/monn.db');
      final current = AppDatabase(
        NativeDatabase.createInBackground(destination),
      );
      final localDatabase = _ActualRestoreLocalDatabase(
        current,
        sourceFile,
        destination,
        directory,
      );
      addTearDown(localDatabase.close);
      final container = createContainer(
        overrides: [
          localDatabaseProvider.overrideWithValue(AsyncData(localDatabase)),
        ],
      );
      const filter = SavingsFilter.sortByFinalAmountDesc;
      container.listen(
        watchSortedSavingsProvider(filter: filter),
        (_, _) {},
      );
      await container
          .read(watchSortedSavingsProvider(filter: filter).future)
          .timeout(const Duration(seconds: 2));
      final restored = await container
          .read(backupControllerProvider.notifier)
          .restoreDB(externalBackup: sourceFile)
          .timeout(const Duration(seconds: 3));

      expect(restored, isTrue);
    },
  );
}

Future<String> _readSavingsType(ProviderContainer container) async {
  return (await container.read(watchSavingsProvider.future)).single.type;
}

void _keepSavingsStreamAlive(ProviderContainer container) {
  container.listen(watchSavingsProvider, (_, _) {});
}

class _RollbackLocalDatabase extends LocalDatabase {
  _RollbackLocalDatabase(this._database);

  AppDatabase _database;

  @override
  AppDatabase get database => _database;

  @override
  Future<bool> restore(
    File _, {
    DatabaseRestoreProgress? onProgress,
  }) async {
    await _database.close();
    _database = AppDatabase(NativeDatabase.memory());
    return false;
  }

  @override
  Future<void> close() => _database.close();
}

class _SuccessfulRestoreLocalDatabase extends LocalDatabase {
  _SuccessfulRestoreLocalDatabase(this._database, this._restoredFile);

  AppDatabase _database;
  final File _restoredFile;

  @override
  AppDatabase get database => _database;

  @override
  Future<bool> restore(
    File _, {
    DatabaseRestoreProgress? onProgress,
  }) async {
    await _database.close();
    _database = AppDatabase(NativeDatabase(_restoredFile));
    return true;
  }

  @override
  Future<void> close() => _database.close();
}

class _ActualRestoreLocalDatabase extends LocalDatabase {
  _ActualRestoreLocalDatabase(
    this._database,
    this._source,
    this._destination,
    this._temporaryDirectory,
  );

  AppDatabase _database;
  final File _source;
  final File _destination;
  final Directory _temporaryDirectory;

  @override
  AppDatabase get database => _database;

  @override
  Future<bool> restore(
    File _, {
    DatabaseRestoreProgress? onProgress,
  }) async {
    final result = await restoreDatabaseBackup(
      currentDatabase: _database,
      source: _source,
      destination: _destination,
      temporaryDirectory: _temporaryDirectory,
      onProgress: onProgress,
    );
    _database = result.database;
    return result.restored;
  }

  @override
  Future<void> close() => _database.close();
}

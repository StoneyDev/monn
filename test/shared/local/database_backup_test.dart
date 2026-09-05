import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/database_backup.dart';

void main() {
  final originalDriftOptions = driftRuntimeOptions;
  late List<String> driftLogs;

  setUpAll(() {
    driftRuntimeOptions = DriftRuntimeOptions();
  });

  setUp(() {
    driftLogs = [];
    driftRuntimeOptions.debugPrint = driftLogs.add;
  });

  tearDown(() {
    expect(
      driftLogs.where((log) => log.startsWith('WARNING (drift)')),
      isEmpty,
    );
  });

  tearDownAll(() {
    driftRuntimeOptions = originalDriftOptions;
  });

  test(
    'creates a self-contained backup of the current database state',
    () async {
      final directory = Directory.systemTemp.createTempSync('monn_backup_');
      addTearDown(() => directory.deleteSync(recursive: true));
      final database = _open(File('${directory.path}/source.db'));
      await database
          .into(database.cashEntries)
          .insert(CashEntriesCompanion.insert(label: 'Wallet', value: 42));
      await database.customStatement('PRAGMA foreign_keys = OFF');
      await database
          .into(database.reitDividendEntries)
          .insert(
            ReitDividendEntriesCompanion.insert(
              reitId: 999,
              receivedAt: DateTime(2026),
              amount: 10,
            ),
          );
      final backup = File('${directory.path}/backup.db');

      await createDatabaseBackup(database: database, destination: backup);
      await database.close();

      final exported = _open(backup, enableMigrations: false);
      addTearDown(exported.close);
      final cash = await exported.select(exported.cashEntries).getSingle();
      final dividend = await exported
          .select(exported.reitDividendEntries)
          .getSingle();
      expect(cash.label, 'Wallet');
      expect(cash.value, 42);
      expect(dividend.reitId, 999);
    },
  );

  test('removes only older dated backups', () async {
    final directory = Directory.systemTemp.createTempSync('monn_cleanup_');
    addTearDown(() => directory.deleteSync(recursive: true));
    final old = File('${directory.path}/backup_2026-01-01T00:00:00.000.db');
    final current = File('${directory.path}/backup_2026-02-01T00:00:00.000.db');
    final newer = File('${directory.path}/backup_2026-03-01T00:00:00.000.db');
    final unrelated = File('${directory.path}/backup_manual.db');
    for (final file in [old, current, newer, unrelated]) {
      await file.writeAsString('backup');
    }

    await deleteOlderDatabaseBackups(current);

    expect(old.existsSync(), isFalse);
    for (final file in [current, newer, unrelated]) {
      expect(file.readAsStringSync(), 'backup');
    }
  });

  test('restores a valid database and returns an opened connection', () async {
    final directory = Directory.systemTemp.createTempSync('monn_restore_');
    addTearDown(() => directory.deleteSync(recursive: true));
    final destination = File('${directory.path}/monn.db');
    final sourceFile = File('${directory.path}/backup.db');
    final source = _open(sourceFile);
    await source
        .into(source.cashEntries)
        .insert(CashEntriesCompanion.insert(label: 'Backup', value: 2));
    await source.close();

    final current = _open(destination);
    await current
        .into(current.cashEntries)
        .insert(CashEntriesCompanion.insert(label: 'Current', value: 1));

    final result = await restoreDatabaseBackup(
      currentDatabase: current,
      source: sourceFile,
      destination: destination,
      temporaryDirectory: directory,
    );
    addTearDown(result.database.close);

    expect(result.restored, isTrue);
    final cash = await result.database
        .select(result.database.cashEntries)
        .get();
    expect(cash.single.label, 'Backup');
  });

  test('reports the restore steps in order', () async {
    final directory = Directory.systemTemp.createTempSync(
      'monn_restore_progress_',
    );
    addTearDown(() => directory.deleteSync(recursive: true));
    final destination = File('${directory.path}/monn.db');
    final sourceFile = File('${directory.path}/backup.db');
    final source = _open(sourceFile);
    await source.customSelect('SELECT 1').getSingle();
    await source.close();
    final current = _open(destination);
    final steps = <DatabaseRestoreStep>[];

    final result = await restoreDatabaseBackup(
      currentDatabase: current,
      source: sourceFile,
      destination: destination,
      temporaryDirectory: directory,
      onProgress: steps.add,
    );
    addTearDown(result.database.close);

    expect(steps, DatabaseRestoreStep.values);
  });

  test('restores while the current database has an active stream', () async {
    final directory = Directory.systemTemp.createTempSync(
      'monn_restore_stream_',
    );
    addTearDown(() => directory.deleteSync(recursive: true));
    final destination = File('${directory.path}/monn.db');
    final sourceFile = File('${directory.path}/backup.db');
    final source = _open(sourceFile);
    await source
        .into(source.cashEntries)
        .insert(CashEntriesCompanion.insert(label: 'Backup', value: 2));
    await source.close();

    final current = _openInBackground(destination);
    await current
        .into(current.cashEntries)
        .insert(CashEntriesCompanion.insert(label: 'Current', value: 1));
    final subscription = current
        .select(current.cashEntries)
        .watch()
        .listen(
          (_) {},
          onError: (_, _) {},
        );
    addTearDown(subscription.cancel);

    final result = await restoreDatabaseBackup(
      currentDatabase: current,
      source: sourceFile,
      destination: destination,
      temporaryDirectory: directory,
    ).timeout(const Duration(seconds: 2));
    addTearDown(result.database.close);

    expect(result.restored, isTrue);
  });

  test(
    'rejects an incomplete schema and reopens the current database',
    () async {
      final directory = Directory.systemTemp.createTempSync(
        'monn_restore_invalid_',
      );
      addTearDown(() => directory.deleteSync(recursive: true));
      final destination = File('${directory.path}/monn.db');
      final sourceFile = File('${directory.path}/invalid.db');
      final source = _open(sourceFile);
      await source.customStatement('DROP TABLE cash_entries');
      await source.close();

      final current = _open(destination);
      await current
          .into(current.cashEntries)
          .insert(CashEntriesCompanion.insert(label: 'Current', value: 1));

      final result = await restoreDatabaseBackup(
        currentDatabase: current,
        source: sourceFile,
        destination: destination,
        temporaryDirectory: directory,
      );
      addTearDown(result.database.close);

      expect(result.restored, isFalse);
      expect(result.database, isNot(same(current)));
      final cash = await result.database
          .select(result.database.cashEntries)
          .get();
      expect(cash.single.label, 'Current');
    },
  );
}

AppDatabase _open(File file, {bool enableMigrations = true}) {
  return AppDatabase(
    NativeDatabase(file, enableMigrations: enableMigrations),
  );
}

AppDatabase _openInBackground(File file) {
  return AppDatabase(NativeDatabase.createInBackground(file));
}

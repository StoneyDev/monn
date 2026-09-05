import 'dart:async';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:monn/shared/local/database.dart';
import 'package:path/path.dart' as p;

const _validationSchema = 'monn_validation';

enum DatabaseRestoreStep {
  validating,
  creatingRecovery,
  replacing,
  finalizing,
}

typedef DatabaseRestoreProgress = void Function(DatabaseRestoreStep step);

Future<void> createDatabaseBackup({
  required AppDatabase database,
  required File destination,
}) => database.customStatement('VACUUM INTO ?', [destination.path]);

Future<void> deleteOlderDatabaseBackups(File currentBackup) async {
  final pattern = RegExp(r'^backup_(.+)\.db$');
  DateTime? backupDate(String path) => DateTime.tryParse(
    pattern.firstMatch(p.basename(path))?.group(1) ?? '',
  );
  final currentDate = backupDate(currentBackup.path);
  if (currentDate == null) return;

  try {
    await for (final file in currentBackup.parent.list(followLinks: false)) {
      final date = backupDate(file.path);
      if (file is! File || date == null || !date.isBefore(currentDate)) {
        continue;
      }

      await file.delete();
    }
  } on FileSystemException {
    // Cleanup must not turn a successful backup into a failure.
  }
}

Future<({AppDatabase database, bool restored})> restoreDatabaseBackup({
  required AppDatabase currentDatabase,
  required File source,
  required File destination,
  required Directory temporaryDirectory,
  DatabaseRestoreProgress? onProgress,
}) async {
  final restoreDirectory = await temporaryDirectory.createTemp(
    'monn_restore_',
  );
  final staging = File(
    p.join(restoreDirectory.path, 'staging.db'),
  );
  final rollback = File(
    p.join(restoreDirectory.path, 'rollback.db'),
  );

  try {
    onProgress?.call(.validating);
    await source.copy(staging.path);
    if (!await _isRestorableDatabase(currentDatabase, staging)) {
      return (database: currentDatabase, restored: false);
    }

    onProgress?.call(.creatingRecovery);
    await currentDatabase.customStatement('VACUUM INTO ?', [rollback.path]);
    onProgress?.call(.replacing);
    await currentDatabase.close();

    try {
      if (!await _migrateAndValidate(staging)) {
        onProgress?.call(.finalizing);
        return (
          database: _openDatabase(destination),
          restored: false,
        );
      }

      await _replaceDatabaseFile(source: staging, destination: destination);
      onProgress?.call(.finalizing);
      return (
        database: _openDatabase(destination),
        restored: true,
      );
    } on Object {
      await _replaceDatabaseFile(source: rollback, destination: destination);
      onProgress?.call(.finalizing);
      final reopenedDatabase = _openDatabase(destination);
      return (database: reopenedDatabase, restored: false);
    }
  } finally {
    unawaited(_deleteDirectory(restoreDirectory));
  }
}

Future<bool> _migrateAndValidate(File file) async {
  final database = _openDatabase(file);
  try {
    await _forceOpen(database);
    return await _hasRequiredSchema(database);
  } on Object {
    return false;
  } finally {
    await database.close();
  }
}

Future<bool> _isRestorableDatabase(
  AppDatabase database,
  File file,
) async {
  var attached = false;
  try {
    await database.customStatement(
      'ATTACH DATABASE ? AS $_validationSchema',
      [file.path],
    );
    attached = true;
    final versionRow = await database
        .customSelect('PRAGMA $_validationSchema.user_version')
        .getSingle();
    final version = versionRow.read<int>('user_version');
    if (version < 1 || version > database.schemaVersion) return false;

    final integrityRows = await database
        .customSelect('PRAGMA $_validationSchema.integrity_check')
        .get();
    return integrityRows.length == 1 &&
        integrityRows.single.data.values.single == 'ok';
  } on Object {
    return false;
  } finally {
    if (attached) {
      await database.customStatement(
        'DETACH DATABASE $_validationSchema',
      );
    }
  }
}

Future<bool> _hasRequiredSchema(AppDatabase database) async {
  for (final table in database.allTables) {
    final columns = await database
        .customSelect('PRAGMA table_info("${table.actualTableName}")')
        .get();
    final actualColumns = {
      for (final row in columns) row.read<String>('name'),
    };
    final expectedColumns = {
      for (final column in table.$columns) column.$name,
    };
    if (!actualColumns.containsAll(expectedColumns)) return false;
  }
  return true;
}

AppDatabase _openDatabase(File file) =>
    AppDatabase(NativeDatabase.createInBackground(file));

Future<void> _forceOpen(AppDatabase database) async {
  await database.customSelect('SELECT 1').getSingle();
}

Future<void> _replaceDatabaseFile({
  required File source,
  required File destination,
}) async {
  final replacement = File('${destination.path}.replacement');
  await _deleteIfExists(replacement);

  try {
    await source.copy(replacement.path);
    for (final suffix in ['-wal', '-shm', '-journal']) {
      await _deleteIfExists(File('${destination.path}$suffix'));
    }
    await replacement.rename(destination.path);
  } finally {
    await _deleteIfExists(replacement);
  }
}

Future<void> _deleteIfExists(File file) async {
  if (file.existsSync()) await file.delete();
}

Future<void> _deleteDirectory(Directory directory) async {
  try {
    await directory.delete(recursive: true);
  } on FileSystemException {
    // The operating system can clean the temporary directory later.
  }
}

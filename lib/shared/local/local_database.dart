import 'dart:async';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/database_backup.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_database.g.dart';

class LocalDatabase {
  late AppDatabase _database;

  Future<void> init() async {
    _database = _open(await _databaseFile());
  }

  Future<void> createBackup(File destination) {
    return createDatabaseBackup(
      database: _database,
      destination: destination,
    );
  }

  Future<bool> restore(
    File source, {
    DatabaseRestoreProgress? onProgress,
  }) async {
    final result = await restoreDatabaseBackup(
      currentDatabase: _database,
      source: source,
      destination: await _databaseFile(),
      temporaryDirectory: await getTemporaryDirectory(),
      onProgress: onProgress,
    );
    _database = result.database;
    return result.restored;
  }

  AppDatabase get database => _database;

  Future<void> close() => _database.close();

  AppDatabase _open(File file) {
    return AppDatabase(NativeDatabase.createInBackground(file));
  }

  Future<File> _databaseFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File(p.join(directory.path, 'monn.db'));
  }
}

@Riverpod(keepAlive: true)
Future<LocalDatabase> localDatabase(Ref ref) async {
  final database = LocalDatabase();
  await database.init();

  if (!ref.mounted) {
    await database.close();
    return database;
  }

  ref.onDispose(() => unawaited(database.close()));

  return database;
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return ref.watch(localDatabaseProvider).requireValue.database;
}

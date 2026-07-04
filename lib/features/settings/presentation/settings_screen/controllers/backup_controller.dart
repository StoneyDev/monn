import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'backup_controller.g.dart';

@Riverpod(keepAlive: true)
class BackupController extends _$BackupController {
  late SharedPreferencesWithCache _prefsCache;

  @override
  Future<String?> build() async {
    _prefsCache = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: <String>{'backupDate'},
      ),
    );

    return _prefsCache.getString('backupDate');
  }

  Future<void> createBackup() async {
    final isoDate = DateTime.now().toIso8601String();
    final db = LocalDatabase().database;
    final backUpDir = await getApplicationSupportDirectory();

    // Flush WAL to main database file before copying
    await db.customStatement('PRAGMA wal_checkpoint(TRUNCATE)');

    final dbDirectory = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dbDirectory.path, 'monn.db');
    final backupPath = '${backUpDir.path}/backup_$isoDate.db';

    await File(dbPath).copy(backupPath);
    await _prefsCache.setString('backupDate', isoDate);

    if (!ref.mounted) return;

    state = AsyncData(isoDate);
  }

  Future<bool> restoreDB({File? externalBackup}) async {
    try {
      final dbDirectory = await getApplicationDocumentsDirectory();
      final backupDirectory = await getApplicationSupportDirectory();
      final backupDate = _prefsCache.getString('backupDate');

      final dbPath = p.join(dbDirectory.path, 'monn.db');
      final dbFile =
          externalBackup ??
          File('${backupDirectory.path}/backup_$backupDate.db');

      if (!dbFile.existsSync()) return false;

      if (!await _isSqliteFile(dbFile)) return false;

      final db = LocalDatabase().database;

      // Close the current database before overwriting
      await db.close();

      // Overwrite the database file with the backup
      await dbFile.copy(dbPath);

      // Re-initialize the singleton with the fresh file, then invalidate the
      // DB provider — every repository provider depends on it and will be
      // rebuilt with the new AppDatabase instance.
      await LocalDatabase().init();

      if (!ref.mounted) return true;

      ref.invalidate(appDatabaseProvider);

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  // SQLite files begin with "SQLite format 3\x00". Refuse anything else —
  // copying a non-SQLite file over monn.db would corrupt the user's data.
  static const _sqliteMagic = <int>[
    0x53,
    0x51,
    0x4C,
    0x69,
    0x74,
    0x65,
    0x20,
    0x66,
    0x6F,
    0x72,
    0x6D,
    0x61,
    0x74,
    0x20,
    0x33,
    0x00,
  ];

  static Future<bool> _isSqliteFile(File file) async {
    final raf = await file.open();
    try {
      final header = await raf.read(_sqliteMagic.length);
      if (header.length < _sqliteMagic.length) return false;
      for (var i = 0; i < _sqliteMagic.length; i++) {
        if (header[i] != _sqliteMagic[i]) return false;
      }
      return true;
    } finally {
      await raf.close();
    }
  }
}

class BackupControllerMock extends _$BackupController
    with Mock
    implements BackupController {
  @override
  Future<String?> build() => Future.value(DateTime.now().toIso8601String());
}

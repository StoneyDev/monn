import 'dart:io';

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
    final localDatabase = await ref.read(localDatabaseProvider.future);
    if (!ref.mounted) return;

    final isoDate = DateTime.now().toIso8601String();
    final backUpDir = await getApplicationSupportDirectory();
    final backupFile = File(p.join(backUpDir.path, 'backup_$isoDate.db'));

    await localDatabase.createBackup(backupFile);
    await _prefsCache.setString('backupDate', isoDate);

    if (!ref.mounted) return;

    state = AsyncData(isoDate);
  }

  Future<bool> restoreDB({File? externalBackup}) async {
    try {
      final localDatabase = await ref.read(localDatabaseProvider.future);
      if (!ref.mounted) return false;

      final File dbFile;
      if (externalBackup != null) {
        dbFile = externalBackup;
      } else {
        final backupDirectory = await getApplicationSupportDirectory();
        final backupDate = _prefsCache.getString('backupDate');
        dbFile = File(p.join(backupDirectory.path, 'backup_$backupDate.db'));
      }

      final restored = await localDatabase.restore(dbFile);
      if (!ref.mounted) return restored;

      // A rollback also replaces the connection even though restore is false.
      ref.invalidate(appDatabaseProvider);

      return restored;
    } on Exception catch (_) {
      return false;
    }
  }
}

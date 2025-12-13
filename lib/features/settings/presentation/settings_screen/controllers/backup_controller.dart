import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'backup_controller.g.dart';

@riverpod
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

    await Future.wait([
      db.copyToFile('${backUpDir.path}/backup_$isoDate.isar'),
      _prefsCache.setString('backupDate', isoDate),
    ]);

    state = AsyncData(isoDate);
  }

  Future<bool> restoreDB({File? externalBackup}) async {
    try {
      final dbDirectory = await getApplicationDocumentsDirectory();
      final backupDirectory = await getApplicationSupportDirectory();
      final backupDate = _prefsCache.getString('backupDate');

      final dbPath = p.join(dbDirectory.path, 'default.isar');
      final dbFile =
          externalBackup ??
          File('${backupDirectory.path}/backup_$backupDate.isar');

      if (dbFile.existsSync()) {
        // Overwrite the backup file on the database file
        await dbFile.copy(dbPath);

        ref
          // Refresh savings data
          ..invalidate(watchPayoutReportCrowdfundingProvider)
          ..invalidate(watchPayoutReportCryptoProvider)
          ..invalidate(watchPayoutReportSavingsBookProvider)
          ..invalidate(watchPayoutReportReitProvider)
          ..invalidate(getPayoutReportPeaProvider)
          ..invalidate(watchPayoutReportCounterStrikeProvider)
          // Refresh savings list in the home screen
          ..invalidate(watchSavingsProvider);
      }

      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}

class BackupControllerMock extends _$BackupController
    with Mock
    implements BackupController {
  @override
  Future<String?> build() => Future.value(DateTime.now().toIso8601String());
}

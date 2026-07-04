import 'dart:io';

import 'package:drift/native.dart';
import 'package:monn/shared/local/database.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_database.g.dart';

late AppDatabase _database;

class LocalDatabase {
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _database = AppDatabase(
      NativeDatabase(File(p.join(dir.path, 'monn.db'))),
    );
  }

  AppDatabase get database => _database;
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) => LocalDatabase().database;

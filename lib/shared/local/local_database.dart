import 'package:isar/isar.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:path_provider/path_provider.dart';

late Isar _database;

class LocalDatabase {
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _database = await Isar.open(
      [SavingsSchema],
      directory: dir.path,
    );
  }

  Isar get database => _database;

  Future<void> clean() => _database.writeTxn(clean);
}

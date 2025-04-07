import 'package:isar/isar.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/pea/domain/pea.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/savings_book/domain/savings_book.dart';
import 'package:path_provider/path_provider.dart';

late Isar _database;

class LocalDatabase {
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _database = await Isar.open(
      [
        SavingsSchema,
        CrowdfundingSchema,
        CryptocurrencySchema,
        CryptocurrencyTransactionSchema,
        ReitSchema,
        ReitDividendSchema,
        SavingsBookSchema,
        CounterStrikeSchema,
        PeaSchema,
      ],
      directory: dir.path,
    );
  }

  Isar get database => _database;

  Future<void> clean() => _database.writeTxn(clean);
}

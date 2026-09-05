import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/cash/data/cash_repository.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/shared/local/database.dart';

void main() {
  group('CashRepository', () {
    test('keeps the cash savings total synchronized', () async {
      final db = AppDatabase(NativeDatabase.memory());
      addTearDown(db.close);
      final repository = CashRepository(db, SavingsRepository(db));

      await repository.editCash(
        CashEntriesCompanion.insert(label: 'Wallet', value: 10.005),
      );
      await repository.editCash(
        CashEntriesCompanion.insert(label: 'Account', value: 20),
      );

      final cashRows = await db.select(db.cashEntries).get();
      final savings = await db.select(db.savingsEntries).getSingle();
      expect(savings.startAmount, 30.01);

      await repository.deleteCash(cashRows.first.id);

      expect(
        (await db.select(db.savingsEntries).getSingle()).startAmount,
        closeTo(20, 0.001),
      );
    });

    test('rolls back cash when savings synchronization fails', () async {
      final db = AppDatabase(NativeDatabase.memory());
      addTearDown(db.close);
      final repository = CashRepository(db, SavingsRepository(db));
      await db.customStatement('''
CREATE TRIGGER fail_cash_savings
BEFORE INSERT ON savings_entries
BEGIN
  SELECT RAISE(ABORT, 'forced savings failure');
END;
''');

      await expectLater(
        repository.editCash(
          CashEntriesCompanion.insert(label: 'Wallet', value: 10),
        ),
        throwsA(isA<Exception>()),
      );

      expect(await db.select(db.cashEntries).get(), isEmpty);
      expect(await db.select(db.savingsEntries).get(), isEmpty);
    });

    test('updating an existing row recalculates the total', () async {
      final db = AppDatabase(NativeDatabase.memory());
      addTearDown(db.close);
      final repository = CashRepository(db, SavingsRepository(db));
      await repository.editCash(
        CashEntriesCompanion.insert(label: 'Wallet', value: 10),
      );
      final cash = await db.select(db.cashEntries).getSingle();

      await repository.editCash(
        CashEntriesCompanion(
          id: Value(cash.id),
          label: const Value('Wallet'),
          value: const Value(15),
        ),
      );

      expect(
        (await db.select(db.savingsEntries).getSingle()).startAmount,
        15,
      );
    });
  });
}

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/dashboard/data/net_worth_history_repository.dart';
import 'package:monn/shared/local/database.dart';

void main() {
  late AppDatabase database;
  late NetWorthHistoryRepository repository;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    repository = NetWorthHistoryRepository(database);
  });
  tearDown(() => database.close());

  test('updates today while preserving earlier daily balances', () async {
    await repository.record(100, DateTime(2026, 9, 8));
    await repository.record(120, DateTime(2026, 9, 9, 8));
    await repository.record(200, DateTime(2026, 9, 9, 20));

    final history = await repository.watchHistory().first;
    expect(history.map((entry) => entry.total), [100, 200]);
    expect(history.last.day, DateTime(2026, 9, 9));
  });

  test('an invalid total cannot overwrite a saved balance', () async {
    await repository.record(100, DateTime(2026, 9, 9));
    await expectLater(
      repository.record(double.nan, DateTime(2026, 9, 9)),
      throwsArgumentError,
    );
    expect((await repository.watchHistory().first).single.total, 100);
  });
}

import 'package:drift/drift.dart' hide isNotNull, isNull;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/expenses/data/expenses_repository.dart';
import 'package:monn/shared/local/database.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  late AppDatabase db;
  late ExpensesRepository repository;

  setUpAll(() {
    db = AppDatabase(NativeDatabase.memory());
    repository = ExpensesRepository(db);
  });

  setUp(() async {
    await db.delete(db.budgetEntries).go();
  });

  tearDownAll(() async {
    await db.close();
  });

  group('ExpensesRepository', () {
    test('getOrCreateBudget creates new budget when none exists', () async {
      // Act
      final budget = await repository.getOrCreateBudget();

      // Assert
      expect(budget, isA<BudgetEntry>());
      expect(budget.id, 1);
      expect(budget.freelanceIncome, 0);
    });

    test('getOrCreateBudget returns existing budget', () async {
      // Arrange
      await db.into(db.budgetEntries).insertOnConflictUpdate(
            const BudgetEntriesCompanion(
              id: Value(1),
              freelanceIncome: Value(5000),
              rent: Value(1000),
            ),
          );

      // Act
      final budget = await repository.getOrCreateBudget();

      // Assert
      expect(budget.freelanceIncome, 5000);
      expect(budget.rent, 1000);
    });

    test('saveBudget persists budget data', () async {
      // Arrange
      const budget = BudgetEntriesCompanion(
        id: Value(1),
        freelanceIncome: Value(6000),
        rent: Value(1200),
        electricity: Value(100),
      );

      // Act
      await repository.saveBudget(budget);
      final savedBudget = await (db.select(db.budgetEntries)
            ..where((t) => t.id.equals(1)))
          .getSingleOrNull();

      // Assert
      expect(savedBudget, isNotNull);
      expect(savedBudget!.freelanceIncome, 6000);
      expect(savedBudget.rent, 1200);
      expect(savedBudget.electricity, 100);
    });

    test('watchBudget emits budget changes', () async {
      // Arrange
      await db.into(db.budgetEntries).insertOnConflictUpdate(
            const BudgetEntriesCompanion(
              id: Value(1),
              freelanceIncome: Value(4000),
            ),
          );

      // Act & Assert
      await expectLater(
        repository.watchBudget(),
        emits(
          isA<BudgetEntry>().having(
            (b) => b.freelanceIncome,
            'freelanceIncome',
            4000,
          ),
        ),
      );
    });
  });

  group('expensesRepositoryProvider', () {
    test('returns ExpensesRepository instance', () {
      // Arrange
      final mockRepository = MockExpensesRepository();
      final container = createContainer(
        overrides: [
          expensesRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Act
      final result = container.read(expensesRepositoryProvider);

      // Assert
      expect(result, isA<ExpensesRepository>());
    });
  });

  group('watchBudgetProvider', () {
    test('returns null when no budget exists', () async {
      // Arrange
      final mockRepository = MockExpensesRepository();
      final container = createContainer(
        overrides: [
          expensesRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      when(mockRepository.watchBudget()).thenAnswer(
        (_) => Stream.value(null),
      );

      // Act
      final listener = MockListener<AsyncValue<BudgetEntry?>>();
      container.listen(
        watchBudgetProvider,
        listener.call,
        fireImmediately: true,
      );

      final result = await container.read(watchBudgetProvider.future);

      // Assert
      expect(result, isNull);
    });

    test('returns budget when it exists', () async {
      // Arrange
      const budget = BudgetEntry(
        id: 1,
        freelanceIncome: 5000,
        rent: 0,
        electricity: 0,
        gas: 0,
        water: 0,
        internet: 0,
        homeInsurance: 0,
        publicTransport: 0,
        groceries: 0,
        restaurants: 0,
        healthInsurance: 0,
        phone: 0,
        ai: 0,
      );
      final mockRepository = MockExpensesRepository();
      final container = createContainer(
        overrides: [
          expensesRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      when(mockRepository.watchBudget()).thenAnswer(
        (_) => Stream.value(budget),
      );

      // Act
      final listener = MockListener<AsyncValue<BudgetEntry?>>();
      container.listen(
        watchBudgetProvider,
        listener.call,
        fireImmediately: true,
      );

      final result = await container.read(watchBudgetProvider.future);

      // Assert
      expect(result, isNotNull);
      expect(result!.freelanceIncome, 5000);
    });
  });
}

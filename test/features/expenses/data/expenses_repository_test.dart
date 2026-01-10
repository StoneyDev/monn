import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/expenses/data/expenses_repository.dart';
import 'package:monn/features/expenses/domain/budget.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  late Isar isar;
  late ExpensesRepository repository;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);

    isar = await Isar.open(
      [BudgetSchema],
      directory: '.',
    );

    repository = ExpensesRepository(isar);
  });

  setUp(() async {
    await isar.writeTxn(() async {
      await isar.budgets.clear();
    });
  });

  tearDownAll(() async {
    await isar.close(deleteFromDisk: true);
  });

  group('ExpensesRepository', () {
    test('getOrCreateBudget creates new budget when none exists', () async {
      // Act
      final budget = await repository.getOrCreateBudget();

      // Assert
      expect(budget, isA<Budget>());
      expect(budget.id, 1);
      expect(budget.freelanceIncome, 0);
    });

    test('getOrCreateBudget returns existing budget', () async {
      // Arrange
      final existingBudget = Budget()
        ..freelanceIncome = 5000
        ..rent = 1000;
      await isar.writeTxn(() => isar.budgets.put(existingBudget));

      // Act
      final budget = await repository.getOrCreateBudget();

      // Assert
      expect(budget.freelanceIncome, 5000);
      expect(budget.rent, 1000);
    });

    test('saveBudget persists budget data', () async {
      // Arrange
      final budget = Budget()
        ..freelanceIncome = 6000
        ..rent = 1200
        ..electricity = 100;

      // Act
      await repository.saveBudget(budget);
      final savedBudget = await isar.budgets.get(1);

      // Assert
      expect(savedBudget, isNotNull);
      expect(savedBudget!.freelanceIncome, 6000);
      expect(savedBudget.rent, 1200);
      expect(savedBudget.electricity, 100);
    });

    test('watchBudget emits budget changes', () async {
      // Arrange
      final budget = Budget()..freelanceIncome = 4000;
      await isar.writeTxn(() => isar.budgets.put(budget));

      // Act & Assert
      await expectLater(
        repository.watchBudget(),
        emits(
          isA<Budget>().having(
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
      final listener = MockListener<AsyncValue<Budget?>>();
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
      final budget = Budget()..freelanceIncome = 5000;
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
      final listener = MockListener<AsyncValue<Budget?>>();
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

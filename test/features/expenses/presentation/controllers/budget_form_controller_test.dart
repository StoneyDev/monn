import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/expenses/data/expenses_repository.dart';
import 'package:monn/features/expenses/domain/budget.dart';
import 'package:monn/features/expenses/presentation/edit_budget_screen/controllers/budget_form_controller.dart';

import '../../../../test.dart';
import '../../../../test.mocks.dart';
import '../../../../utils.dart';

void main() {
  group('BudgetFormController', () {
    late MockExpensesRepository mockRepository;

    setUp(() {
      mockRepository = MockExpensesRepository();
    });

    test('build() loads initial state from existing budget', () async {
      // Arrange
      final existingBudget = Budget()
        ..freelanceIncome = 5000
        ..rent = 1200
        ..electricity = 100
        ..groceries = 400;

      when(
        mockRepository.getOrCreateBudget(),
      ).thenAnswer((_) async => existingBudget);

      final container = createContainer(
        overrides: [
          expensesRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Act
      final listener = MockListener<AsyncValue<BudgetForm>>();
      container.listen(
        budgetFormControllerProvider,
        listener.call,
        fireImmediately: true,
      );

      final result = await container.read(budgetFormControllerProvider.future);

      // Assert
      expect(result.freelanceIncome, 5000);
      expect(result.rent, 1200);
      expect(result.electricity, 100);
      expect(result.groceries, 400);
      verify(mockRepository.getOrCreateBudget()).called(1);
    });

    test('build() returns default state when no budget exists', () async {
      // Arrange
      final emptyBudget = Budget();

      when(
        mockRepository.getOrCreateBudget(),
      ).thenAnswer((_) async => emptyBudget);

      final container = createContainer(
        overrides: [
          expensesRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Act
      final result = await container.read(budgetFormControllerProvider.future);

      // Assert
      expect(result.freelanceIncome, 0);
      expect(result.rent, 0);
      expect(result.electricity, 0);
    });

    test('set() updates specific fields while preserving others', () async {
      // Arrange
      final existingBudget = Budget()
        ..freelanceIncome = 5000
        ..rent = 1200;

      when(
        mockRepository.getOrCreateBudget(),
      ).thenAnswer((_) async => existingBudget);

      final container = createContainer(
        overrides: [
          expensesRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Wait for initial load
      await container.read(budgetFormControllerProvider.future);

      // Act
      container
          .read(budgetFormControllerProvider.notifier)
          .set(
            freelanceIncome: 6000,
            electricity: 150,
          );

      final result = container.read(budgetFormControllerProvider).value!;

      // Assert
      expect(result.freelanceIncome, 6000); // Updated
      expect(result.electricity, 150); // Updated
      expect(result.rent, 1200); // Preserved
    });

    test(
      'submit() saves budget to repository and returns true on success',
      () async {
        // Arrange
        final existingBudget = Budget()..freelanceIncome = 5000;

        when(
          mockRepository.getOrCreateBudget(),
        ).thenAnswer((_) async => existingBudget);
        when(mockRepository.saveBudget(any)).thenAnswer((_) async {});

        final container = createContainer(
          overrides: [
            expensesRepositoryProvider.overrideWithValue(mockRepository),
          ],
        );

        // Wait for initial load
        await container.read(budgetFormControllerProvider.future);

        // Update form
        container
            .read(budgetFormControllerProvider.notifier)
            .set(
              freelanceIncome: 6000,
              rent: 1500,
            );

        // Act
        final success = await container
            .read(budgetFormControllerProvider.notifier)
            .submit();

        // Assert
        expect(success, true);
        verify(
          mockRepository.saveBudget(
            argThat(
              isA<Budget>()
                  .having((b) => b.freelanceIncome, 'freelanceIncome', 6000)
                  .having((b) => b.rent, 'rent', 1500),
            ),
          ),
        ).called(1);
      },
    );

    test('submit() returns false when repository throws error', () async {
      // Arrange
      final existingBudget = Budget()..freelanceIncome = 5000;

      when(
        mockRepository.getOrCreateBudget(),
      ).thenAnswer((_) async => existingBudget);
      when(mockRepository.saveBudget(any)).thenThrow(Exception('DB error'));

      final container = createContainer(
        overrides: [
          expensesRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      // Wait for initial load
      await container.read(budgetFormControllerProvider.future);

      // Act
      final success = await container
          .read(budgetFormControllerProvider.notifier)
          .submit();

      // Assert
      expect(success, false);
    });

  });
}

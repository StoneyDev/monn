import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('editSavingController', () {
    test('should return true when the update is successful', () async {
      // Arrange
      const saving = Savings(type: SavingsType.booklet);

      final repository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          savingsRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.editSaving(saving)).thenAnswer(
        (_) => Future<void>.value(),
      );

      // Act
      final controller = container.read(editSavingsControllerProvider.notifier);
      final result = await controller.submit(saving);

      // Assert
      expect(result, true);
    });

    test('should return false when the update is unsuccessful', () async {
      // Arrange
      const saving = Savings(type: SavingsType.booklet);
      final error = Exception();

      final repository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          savingsRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.editSaving(saving)).thenThrow(error);

      // Act
      final controller = container.read(editSavingsControllerProvider.notifier);
      final result = await controller.submit(saving);

      // Assert
      expect(result, false);
    });
  });
}

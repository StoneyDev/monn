import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/per/data/per_repository.dart';
import 'package:monn/features/per/domain/per.dart';
import 'package:monn/features/per/presentation/per_screen/controllers/per_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('perFormController', () {
    test('should initialize with empty form', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller = container.read(
        perFormControllerProvider.notifier,
      );

      // Assert
      expect(controller.state, isA<PerForm>());
      expect(controller.state.invested, '');
      expect(controller.state.interests, '');
    });

    test('should update invested when set() is called', () {
      // Arrange
      const invested = '10000';
      final container = createContainer();

      // Act
      final controller = container.read(
        perFormControllerProvider.notifier,
      )..set(invested: invested);

      // Assert
      expect(controller.state.invested, invested);
    });

    test('should update interests when set() is called', () {
      // Arrange
      const interests = '500.50';
      final container = createContainer();

      // Act
      final controller = container.read(
        perFormControllerProvider.notifier,
      )..set(interests: interests);

      // Assert
      expect(controller.state.interests, interests);
    });

    test('should update both fields when set() is called with both', () {
      // Arrange
      const invested = '25000';
      const interests = '1250.75';
      final container = createContainer();

      // Act
      final controller = container.read(
        perFormControllerProvider.notifier,
      )..set(invested: invested, interests: interests);

      // Assert
      expect(controller.state.invested, invested);
      expect(controller.state.interests, interests);
    });

    test('should overwrite previous values when set() is called again', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller =
          container.read(
              perFormControllerProvider.notifier,
            )
            ..set(invested: '5000')
            ..set(invested: '10000');

      // Assert
      expect(controller.state.invested, '10000');
    });

    test('should preserve other field when only one is updated', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller =
          container.read(
              perFormControllerProvider.notifier,
            )
            ..set(invested: '10000', interests: '500')
            ..set(invested: '20000');

      // Assert
      expect(controller.state.invested, '20000');
      expect(controller.state.interests, '500');
    });
  });

  group('perFormController submit', () {
    test('should return true when submit succeeds', () async {
      // Arrange
      final mockRepository = MockPerRepository();
      when(mockRepository.editPer(any)).thenAnswer((_) async {});

      final container = createContainer(
        overrides: [
          perRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      final controller = container.read(
        perFormControllerProvider.notifier,
      )..set(invested: '10000', interests: '500');

      // Act
      final result = await controller.submit();

      // Assert
      expect(result, isTrue);
      verify(mockRepository.editPer(any)).called(1);
    });

    test('should return false when submit fails', () async {
      // Arrange
      final mockRepository = MockPerRepository();
      when(mockRepository.editPer(any)).thenThrow(Exception('Error'));

      final container = createContainer(
        overrides: [
          perRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      final controller = container.read(
        perFormControllerProvider.notifier,
      )..set(invested: '10000', interests: '500');

      // Act
      final result = await controller.submit();

      // Assert
      expect(result, isFalse);
    });

    test('should call repository with correct values', () async {
      // Arrange
      final mockRepository = MockPerRepository();
      when(mockRepository.editPer(any)).thenAnswer((_) async {});

      final container = createContainer(
        overrides: [
          perRepositoryProvider.overrideWithValue(mockRepository),
        ],
      );

      final controller = container.read(
        perFormControllerProvider.notifier,
      )..set(invested: '15000', interests: '750.50');

      // Act
      await controller.submit();

      // Assert
      verify(
        mockRepository.editPer(
          argThat(
            isA<Per>()
                .having((p) => p.invested, 'invested', 15000)
                .having((p) => p.interests, 'interests', 750.50),
          ),
        ),
      ).called(1);
    });
  });
}

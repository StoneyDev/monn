// ignore_for_file: cascade_invocations, lines_longer_than_80_chars .

import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding_form.dart';
import 'package:monn/features/crowdfunding/presentation/add_crowdfunding_screen/controllers/crowdfunding_form_controller.dart';

import '../../../../../utils.dart';

void main() {
  group('crowdfundingFormController', () {
    test('should initialize with empty form', () {
      // Arrange
      final container = createContainer();

      // Act
      final controller = container.read(
        crowdfundingFormControllerProvider.notifier,
      );

      // Assert
      expect(controller.state, isA<CrowdfundingForm>());
      expect(controller.state.platformName, isNull);
      expect(controller.state.taxPercentage, isNull);
      expect(controller.state.brutProfit, isNull);
      expect(controller.state.receivedAt, isNull);
    });

    test('should update platformName when edit is called with new name', () {
      // Arrange
      const platformName = 'La Première Brique';
      final container = createContainer();

      // Act
      final controller = container.read(
        crowdfundingFormControllerProvider.notifier,
      );
      controller.edit(platformName: platformName);

      // Assert
      expect(controller.state.platformName, platformName);
    });

    test('should update taxPercentage when edit is called', () {
      // Arrange
      const taxPercentage = '49.3';
      const expectedTaxPercentage = 49.3;
      final container = createContainer();

      // Act
      final controller = container.read(
        crowdfundingFormControllerProvider.notifier,
      );
      controller.edit(taxPercentage: taxPercentage);

      // Assert
      expect(controller.state.taxPercentage, expectedTaxPercentage);
    });

    test('should update brutProfit when edit is called', () {
      // Arrange
      const brutProfit = '1234.56';
      const expectedBrutProfit = 1234.56;
      final container = createContainer();

      // Act
      final controller = container.read(
        crowdfundingFormControllerProvider.notifier,
      );
      controller.edit(brutProfit: brutProfit);

      // Assert
      expect(controller.state.brutProfit, expectedBrutProfit);
    });

    test('should update receivedAt when edit is called with new date', () {
      // Arrange
      final now = DateTime.now();
      final container = createContainer();

      // Act
      final controller = container.read(
        crowdfundingFormControllerProvider.notifier,
      );
      controller.edit(receivedAt: now);

      // Assert
      expect(controller.state.receivedAt, now);
    });

    test(
      'should not update taxPercentage & brutProfit when edit is called with invalid type',
      () {
        // Arrange
        final container = createContainer();

        // Act
        final controller = container.read(
          crowdfundingFormControllerProvider.notifier,
        );
        controller.edit(taxPercentage: 'number0', brutProfit: 'number1');

        // Assert
        expect(controller.state.taxPercentage, isNull);
        expect(controller.state.brutProfit, isNull);
      },
    );

    test(
      'should update multiple fields when edit is called with multiple parameters',
      () {
        // Arrange
        const platformName = 'La Première Brique';
        const taxPercentage = '49.3';
        const expectedTaxPercentage = 49.3;
        const brutProfit = '974';
        const expectedBrutProfit = 974;
        final receivedAt = DateTime.now();
        final container = createContainer();

        // Act
        final controller = container.read(
          crowdfundingFormControllerProvider.notifier,
        );
        controller.edit(
          platformName: platformName,
          taxPercentage: taxPercentage,
          brutProfit: brutProfit,
          receivedAt: receivedAt,
        );

        // Assert
        expect(controller.state.platformName, platformName);
        expect(controller.state.taxPercentage, expectedTaxPercentage);
        expect(controller.state.brutProfit, expectedBrutProfit);
        expect(controller.state.receivedAt, receivedAt);
      },
    );
  });
}

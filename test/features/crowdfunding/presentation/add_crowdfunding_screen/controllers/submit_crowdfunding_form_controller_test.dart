// ignore_for_file: lines_longer_than_80_chars .

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding_form.dart';
import 'package:monn/features/crowdfunding/presentation/add_crowdfunding_screen/controllers/crowdfunding_form_controller.dart';
import 'package:monn/features/crowdfunding/presentation/add_crowdfunding_screen/controllers/submit_crowdfunding_form_controller.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('submitCrowdfundingFormController', () {
    test(
      'should return Crowdfunding with taxProfit & netProfit when brutProfit is positive',
      () async {
        // Arrange
        final formData = CrowdfundingForm(
          platformName: 'La Première Brique',
          brutProfit: '100',
          taxPercentage: '30',
          receivedAt: DateTime(2024, 01, 20),
        );

        final crowdfunding = Crowdfunding(
          platformName: formData.platformName,
          brutProfit: double.parse(formData.brutProfit),
          receivedAt: formData.receivedAt,
          taxPercentage: double.parse(formData.taxPercentage!),
          taxProfit: 30,
          netProfit: 70,
        );

        final repository = MockCrowdfundingRepository();
        final container = createContainer(
          overrides: [
            crowdfundingRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.editCrowdfunding(any)).thenAnswer(
          (_) => Future<void>.value(),
        );

        // Act
        container.read(crowdfundingFormControllerProvider.notifier).state =
            formData;

        final submitController = container.read(
          submitCrowdfundingFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
        verify(
          repository.editCrowdfunding(
            argThat(
              predicate<Crowdfunding>((predic) => predic == crowdfunding),
            ),
          ),
        );
      },
    );

    test(
      'should not return taxProfit & netProfit with a value greater than zero when brutProfit is negative',
      () async {
        // Arrange
        final formData = CrowdfundingForm(
          platformName: 'La Première Brique',
          brutProfit: '-1999',
          receivedAt: DateTime(2024, 01, 20),
        );

        final crowdfunding = Crowdfunding(
          platformName: formData.platformName,
          brutProfit: double.parse(formData.brutProfit),
          receivedAt: formData.receivedAt,
        );

        final repository = MockCrowdfundingRepository();
        final container = createContainer(
          overrides: [
            crowdfundingRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.editCrowdfunding(any)).thenAnswer(
          (_) => Future<void>.value(),
        );

        // Act
        container.read(crowdfundingFormControllerProvider.notifier).state =
            formData;

        final submitController = container.read(
          submitCrowdfundingFormControllerProvider.notifier,
        );
        final result = await submitController.submit();

        // Assert
        expect(result, true);
        verify(
          repository.editCrowdfunding(
            argThat(
              predicate<Crowdfunding>((predict) => predict == crowdfunding),
            ),
          ),
        );
      },
    );

    test('should return false when repository throws error', () async {
      // Arrange
      final error = Exception();
      final formData = CrowdfundingForm(
        platformName: 'La Première Brique',
        brutProfit: '-1999',
        receivedAt: DateTime(2024, 01, 20),
      );

      final repository = MockCrowdfundingRepository();
      final container = createContainer(
        overrides: [
          crowdfundingRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.editCrowdfunding(any)).thenThrow(error);

      // Act
      container.read(crowdfundingFormControllerProvider.notifier).state =
          formData;

      final submitController = container.read(
        submitCrowdfundingFormControllerProvider.notifier,
      );
      final result = await submitController.submit();

      // Assert
      expect(result, false);
    });
  });
}

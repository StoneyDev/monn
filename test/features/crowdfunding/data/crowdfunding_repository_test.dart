import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/dashboard/domain/savings.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  group('crowdfundingRepository', () {
    test('should return CrowdfundingRepository when a call is made', () {
      // Arrange
      final repository = MockCrowdfundingRepository();
      final container = createContainer(
        overrides: [
          crowdfundingRepositoryProvider.overrideWithValue(repository),
        ],
      );

      // Act
      final controller = container.read(crowdfundingRepositoryProvider);

      // Assert
      expect(controller, isA<CrowdfundingRepository>());
    });
  });

  group('watchCrowdfundings', () {
    test('should return empty list when no data is found', () async {
      // Arrange
      final crowdfundings = <Crowdfunding>[];
      final repository = MockCrowdfundingRepository();
      final container = createContainer(
        overrides: [
          crowdfundingRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchCrowdfundings()).thenAnswer(
        (_) => Stream.value(crowdfundings),
      );

      // Act
      final listener = MockListener<AsyncValue<List<Crowdfunding>>>();
      container.listen(
        watchCrowdfundingsProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(watchCrowdfundingsProvider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), AsyncData(crowdfundings)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(results, isEmpty);
    });

    test(
      'should sort crowdfundings by receivedAt in descending order',
      () async {
        // Arrange
        final crowdfundings = [
          Crowdfunding(receivedAt: DateTime(2024, 8, 25)),
          Crowdfunding(receivedAt: DateTime(2024, 2, 14)),
          Crowdfunding(receivedAt: DateTime(2024, 7, 08)),
          Crowdfunding(receivedAt: DateTime(2024, 8, 10)),
        ];

        final sorted = [
          crowdfundings[0],
          crowdfundings[3],
          crowdfundings[2],
          crowdfundings[1],
        ];

        final repository = MockCrowdfundingRepository();
        final container = createContainer(
          overrides: [
            crowdfundingRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.watchCrowdfundings()).thenAnswer(
          (_) => Stream.value(crowdfundings),
        );

        // Act
        final listener = MockListener<AsyncValue<List<Crowdfunding>>>();
        container.listen(
          watchCrowdfundingsProvider,
          listener.call,
          fireImmediately: true,
        );

        final results = await container.read(watchCrowdfundingsProvider.future);

        // Assert
        verifyInOrder([
          listener(null, const AsyncLoading()),
          listener(const AsyncLoading(), AsyncData(results)),
        ]);
        verifyNoMoreInteractions(listener);
        expect(results, sorted);
      },
    );

    test('should return error when repository throws exception', () async {
      // Arrange
      final error = Exception();

      final repository = MockCrowdfundingRepository();
      final container = createContainer(
        overrides: [
          crowdfundingRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchCrowdfundings()).thenThrow(error);

      // Act
      final controller = container.read(watchCrowdfundingsProvider.future);

      // Assert
      await expectLater(controller, throwsA(error));
    });
  });

  group('watchPayoutReportCrowdfunding', () {
    test('should return total netProfit & taxProfit without losses', () async {
      // Arrange
      final crowdfundings = [
        Crowdfunding(
          receivedAt: DateTime(2024, 8, 25),
          netProfit: 70,
          taxProfit: 30,
        ),
        Crowdfunding(
          receivedAt: DateTime(2024, 2, 14),
          netProfit: 39.2,
          taxProfit: 16.8,
        ),
        Crowdfunding(
          receivedAt: DateTime(2024, 7, 08),
          netProfit: 66.24,
          taxProfit: 13.76,
        ),
        Crowdfunding(
          receivedAt: DateTime(2024, 8, 10),
          netProfit: 20,
        ),
      ];

      const savings = Savings(type: SavingsType.crowdfunding, startAmount: 200);
      const expectedPayoutReport = PayoutReportData(
        totalNetProfit: 195.44,
        totalTaxProfit: 60.56,
        finalAmount: 395.44,
      );

      final crowdfundingRepository = MockCrowdfundingRepository();
      final savingRepository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          crowdfundingRepositoryProvider.overrideWithValue(
            crowdfundingRepository,
          ),
          savingsRepositoryProvider.overrideWithValue(savingRepository),
        ],
      );

      when(crowdfundingRepository.watchCrowdfundings()).thenAnswer(
        (_) => Stream.value(crowdfundings),
      );

      when(savingRepository.getSavings(any)).thenAnswer(
        (_) => Future.value(savings),
      );

      // Act
      final listener = MockListener<AsyncValue<PayoutReportData>>();
      container.listen(
        watchPayoutReportCrowdfundingProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(
        watchPayoutReportCrowdfundingProvider.future,
      );

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), const AsyncData(expectedPayoutReport)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(results, expectedPayoutReport);
    });

    test('should return total netProfit & taxProfit & loss', () async {
      // Arrange
      final crowdfundings = [
        Crowdfunding(
          receivedAt: DateTime(2024, 8, 25),
          brutProfit: -100,
        ),
        Crowdfunding(
          receivedAt: DateTime(2024, 8, 10),
          brutProfit: -564.22,
        ),
        Crowdfunding(
          receivedAt: DateTime(2024, 2, 14),
          netProfit: 39.2,
          taxProfit: 16.8,
        ),
        Crowdfunding(
          receivedAt: DateTime(2024, 7, 08),
          netProfit: 66.24,
          taxProfit: 13.76,
        ),
      ];

      const payoutReport = PayoutReportData(
        totalNetProfit: 105.44,
        totalTaxProfit: 30.56,
        totalLoss: -664.22,
        finalAmount: 1441.22,
      );

      const savings = Savings(
        type: SavingsType.crowdfunding,
        startAmount: 2000,
      );

      final crowdfundingRepository = MockCrowdfundingRepository();
      final savingRepository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          crowdfundingRepositoryProvider.overrideWithValue(
            crowdfundingRepository,
          ),
          savingsRepositoryProvider.overrideWithValue(savingRepository),
        ],
      );

      when(crowdfundingRepository.watchCrowdfundings()).thenAnswer(
        (_) => Stream.value(crowdfundings),
      );

      when(savingRepository.getSavings(any)).thenAnswer(
        (_) => Future.value(savings),
      );

      // Act
      final listener = MockListener<AsyncValue<PayoutReportData>>();
      container.listen(
        watchPayoutReportCrowdfundingProvider,
        listener.call,
        fireImmediately: true,
      );

      final results = await container.read(
        watchPayoutReportCrowdfundingProvider.future,
      );

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading()),
        listener(const AsyncLoading(), const AsyncData(payoutReport)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(results, payoutReport);
    });
  });
}

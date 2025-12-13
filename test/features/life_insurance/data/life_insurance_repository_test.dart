import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/life_insurance/data/life_insurance_repository.dart';
import 'package:monn/features/life_insurance/domain/life_insurance.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  group('lifeInsuranceRepository', () {
    test('should return LifeInsuranceRepository when a call is made', () {
      // Arrange
      final repository = MockLifeInsuranceRepository();
      final container = createContainer(
        overrides: [
          lifeInsuranceRepositoryProvider.overrideWithValue(repository),
        ],
      );

      // Act
      final controller = container.read(lifeInsuranceRepositoryProvider);

      // Assert
      expect(controller, isA<LifeInsuranceRepository>());
    });
  });

  group('watchLifeInsurance', () {
    test('should return null when no data exists', () async {
      // Arrange
      final repository = MockLifeInsuranceRepository();
      final container = createContainer(
        overrides: [
          lifeInsuranceRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchLifeInsurance()).thenAnswer(
        (_) => Stream.value(null),
      );

      // Act
      final listener = MockListener<AsyncValue<LifeInsurance?>>();
      container.listen(
        watchLifeInsuranceProvider,
        listener.call,
        fireImmediately: true,
      );

      final result = await container.read(watchLifeInsuranceProvider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading<LifeInsurance?>()),
        listener(const AsyncLoading<LifeInsurance?>(), const AsyncData(null)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(result, isNull);
    });

    test('should return LifeInsurance when data exists', () async {
      // Arrange
      final lifeInsurance = LifeInsurance()
        ..invested = 10000
        ..interests = 500;

      final repository = MockLifeInsuranceRepository();
      final container = createContainer(
        overrides: [
          lifeInsuranceRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchLifeInsurance()).thenAnswer(
        (_) => Stream.value(lifeInsurance),
      );

      // Act
      final listener = MockListener<AsyncValue<LifeInsurance?>>();
      container.listen(
        watchLifeInsuranceProvider,
        listener.call,
        fireImmediately: true,
      );

      final result = await container.read(watchLifeInsuranceProvider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading<LifeInsurance?>()),
        listener(
          const AsyncLoading<LifeInsurance?>(),
          AsyncData<LifeInsurance?>(lifeInsurance),
        ),
      ]);
      verifyNoMoreInteractions(listener);
      expect(result, lifeInsurance);
      expect(result?.invested, 10000);
      expect(result?.interests, 500);
    });
  });

  group('watchPayoutReportLifeInsurance', () {
    test(
      'should return empty PayoutReportData when no life insurance exists',
      () async {
        // Arrange
        final repository = MockLifeInsuranceRepository();
        final container = createContainer(
          overrides: [
            lifeInsuranceRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.watchLifeInsurance()).thenAnswer(
          (_) => Stream.value(null),
        );

        // Act
        final listener = MockListener<AsyncValue<PayoutReportData>>();
        container.listen(
          watchPayoutReportLifeInsuranceProvider,
          listener.call,
          fireImmediately: true,
        );

        final result = await container.read(
          watchPayoutReportLifeInsuranceProvider.future,
        );

        // Assert
        verifyInOrder([
          listener(null, const AsyncLoading<PayoutReportData>()),
          listener(
            const AsyncLoading<PayoutReportData>(),
            const AsyncData(PayoutReportData()),
          ),
        ]);
        verifyNoMoreInteractions(listener);
        expect(result, const PayoutReportData());
        expect(result.finalAmount, 0);
      },
    );

    test(
      'should return PayoutReportData with finalAmount = invested + interests',
      () async {
        // Arrange
        final lifeInsurance = LifeInsurance()
          ..invested = 10000
          ..interests = 750.50;

        const expectedPayoutReport = PayoutReportData(
          finalAmount: 10750.50,
        );

        final repository = MockLifeInsuranceRepository();
        final container = createContainer(
          overrides: [
            lifeInsuranceRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.watchLifeInsurance()).thenAnswer(
          (_) => Stream.value(lifeInsurance),
        );

        // Act
        final listener = MockListener<AsyncValue<PayoutReportData>>();
        container.listen(
          watchPayoutReportLifeInsuranceProvider,
          listener.call,
          fireImmediately: true,
        );

        final result = await container.read(
          watchPayoutReportLifeInsuranceProvider.future,
        );

        // Assert
        verifyInOrder([
          listener(null, const AsyncLoading<PayoutReportData>()),
          listener(
            const AsyncLoading<PayoutReportData>(),
            const AsyncData(expectedPayoutReport),
          ),
        ]);
        verifyNoMoreInteractions(listener);
        expect(result, expectedPayoutReport);
        expect(result.finalAmount, 10750.50);
      },
    );

    test(
      'should correctly calculate finalAmount with zero interests',
      () async {
        // Arrange
        final lifeInsurance = LifeInsurance()
          ..invested = 5000
          ..interests = 0;

        const expectedPayoutReport = PayoutReportData(
          finalAmount: 5000,
        );

        final repository = MockLifeInsuranceRepository();
        final container = createContainer(
          overrides: [
            lifeInsuranceRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.watchLifeInsurance()).thenAnswer(
          (_) => Stream.value(lifeInsurance),
        );

        // Act
        final listener = MockListener<AsyncValue<PayoutReportData>>();
        container.listen(
          watchPayoutReportLifeInsuranceProvider,
          listener.call,
          fireImmediately: true,
        );

        final result = await container.read(
          watchPayoutReportLifeInsuranceProvider.future,
        );

        // Assert
        verifyInOrder([
          listener(null, const AsyncLoading<PayoutReportData>()),
          listener(
            const AsyncLoading<PayoutReportData>(),
            const AsyncData(expectedPayoutReport),
          ),
        ]);
        verifyNoMoreInteractions(listener);
        expect(result, expectedPayoutReport);
        expect(result.finalAmount, 5000);
      },
    );
  });
}

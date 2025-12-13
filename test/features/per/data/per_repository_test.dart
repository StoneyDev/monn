import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/dashboard/domain/payout_report_data.dart';
import 'package:monn/features/per/data/per_repository.dart';
import 'package:monn/features/per/domain/per.dart';

import '../../../test.dart';
import '../../../test.mocks.dart';
import '../../../utils.dart';

void main() {
  group('perRepository', () {
    test('should return PerRepository when a call is made', () {
      // Arrange
      final repository = MockPerRepository();
      final container = createContainer(
        overrides: [
          perRepositoryProvider.overrideWithValue(repository),
        ],
      );

      // Act
      final controller = container.read(perRepositoryProvider);

      // Assert
      expect(controller, isA<PerRepository>());
    });
  });

  group('watchPer', () {
    test('should return null when no data exists', () async {
      // Arrange
      final repository = MockPerRepository();
      final container = createContainer(
        overrides: [
          perRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchPer()).thenAnswer(
        (_) => Stream.value(null),
      );

      // Act
      final listener = MockListener<AsyncValue<Per?>>();
      container.listen(
        watchPerProvider,
        listener.call,
        fireImmediately: true,
      );

      final result = await container.read(watchPerProvider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading<Per?>()),
        listener(const AsyncLoading<Per?>(), const AsyncData(null)),
      ]);
      verifyNoMoreInteractions(listener);
      expect(result, isNull);
    });

    test('should return Per when data exists', () async {
      // Arrange
      final per = Per()
        ..invested = 10000
        ..interests = 500;

      final repository = MockPerRepository();
      final container = createContainer(
        overrides: [
          perRepositoryProvider.overrideWithValue(repository),
        ],
      );

      when(repository.watchPer()).thenAnswer(
        (_) => Stream.value(per),
      );

      // Act
      final listener = MockListener<AsyncValue<Per?>>();
      container.listen(
        watchPerProvider,
        listener.call,
        fireImmediately: true,
      );

      final result = await container.read(watchPerProvider.future);

      // Assert
      verifyInOrder([
        listener(null, const AsyncLoading<Per?>()),
        listener(
          const AsyncLoading<Per?>(),
          AsyncData<Per?>(per),
        ),
      ]);
      verifyNoMoreInteractions(listener);
      expect(result, per);
      expect(result?.invested, 10000);
      expect(result?.interests, 500);
    });
  });

  group('watchPayoutReportPer', () {
    test(
      'should return empty PayoutReportData when no PER exists',
      () async {
        // Arrange
        final repository = MockPerRepository();
        final container = createContainer(
          overrides: [
            perRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.watchPer()).thenAnswer(
          (_) => Stream.value(null),
        );

        // Act
        final listener = MockListener<AsyncValue<PayoutReportData>>();
        container.listen(
          watchPayoutReportPerProvider,
          listener.call,
          fireImmediately: true,
        );

        final result = await container.read(
          watchPayoutReportPerProvider.future,
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
        final per = Per()
          ..invested = 10000
          ..interests = 750.50;

        const expectedPayoutReport = PayoutReportData(
          finalAmount: 10750.50,
        );

        final repository = MockPerRepository();
        final container = createContainer(
          overrides: [
            perRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.watchPer()).thenAnswer(
          (_) => Stream.value(per),
        );

        // Act
        final listener = MockListener<AsyncValue<PayoutReportData>>();
        container.listen(
          watchPayoutReportPerProvider,
          listener.call,
          fireImmediately: true,
        );

        final result = await container.read(
          watchPayoutReportPerProvider.future,
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
        final per = Per()
          ..invested = 5000
          ..interests = 0;

        const expectedPayoutReport = PayoutReportData(
          finalAmount: 5000,
        );

        final repository = MockPerRepository();
        final container = createContainer(
          overrides: [
            perRepositoryProvider.overrideWithValue(repository),
          ],
        );

        when(repository.watchPer()).thenAnswer(
          (_) => Stream.value(per),
        );

        // Act
        final listener = MockListener<AsyncValue<PayoutReportData>>();
        container.listen(
          watchPayoutReportPerProvider,
          listener.call,
          fireImmediately: true,
        );

        final result = await container.read(
          watchPayoutReportPerProvider.future,
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

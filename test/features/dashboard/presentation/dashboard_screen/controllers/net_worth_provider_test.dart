import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/dashboard/presentation/dashboard_screen/controllers/net_worth_provider.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/shared/domain/savings.dart';
import 'package:monn/shared/local/database.dart';

import '../../../../../test.mocks.dart';
import '../../../../../utils.dart';

void main() {
  group('watchSortedSavings', () {
    test('returns savings types instead of fabricated database rows', () async {
      // Arrange
      final repository = MockSavingsRepository();
      final container = createContainer(
        overrides: [
          savingsRepositoryProvider.overrideWithValue(repository),
          for (final type in SavingsType.values)
            getFinalAmountProvider(
              type,
            ).overrideWithValue(const AsyncData(0)),
        ],
      );

      when(repository.watchSavings()).thenAnswer(
        (_) => Stream.value(<SavingsEntry>[]),
      );

      // Act
      final provider = watchSortedSavingsProvider(
        filter: SavingsFilter.sortByStartAmountAsc,
      );
      final subscription = container.listen(
        provider,
        (_, _) {},
        fireImmediately: true,
      );
      final result = await container.read(provider.future);

      // Assert
      expect(result.map((saving) => saving.type), SavingsType.values);
      expect(subscription.read(), isA<AsyncData<List<SortedSaving>>>());
    });
  });

  test('watchTotalNetWorth preserves report errors', () async {
    final error = StateError('failed report');
    final container = createContainer(
      overrides: [
        for (final type in SavingsType.values)
          getFinalAmountProvider(type).overrideWithValue(
            type == SavingsType.cash
                ? AsyncError(error, StackTrace.empty)
                : const AsyncData(10),
          ),
      ],
    );

    final subscription = container.listen(
      watchTotalNetWorthProvider,
      (_, _) {},
      fireImmediately: true,
    );

    await expectLater(
      container.read(watchTotalNetWorthProvider.future),
      throwsA(same(error)),
    );
    final result = subscription.read();

    expect(result, isA<AsyncError<double>>());
    expect((result as AsyncError<double>).error, same(error));
  });
}

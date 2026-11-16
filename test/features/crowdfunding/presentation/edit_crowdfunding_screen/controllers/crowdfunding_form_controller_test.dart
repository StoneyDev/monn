import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/crowdfunding/presentation/edit_crowdfunding_screen/controllers/crowdfunding_form_controller.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';

import '../../../../../utils.dart';

void main() {
  late AppDatabase database;

  setUp(() => database = AppDatabase(NativeDatabase.memory()));

  tearDown(() => database.close());

  group('crowdfundingFormController submit', () {
    test('should_clearProfitAndTax_when_taxedEntryIsEditedIntoLoss', () async {
      // Arrange
      final container = createContainer(
        overrides: [appDatabaseProvider.overrideWithValue(database)],
      );
      final controller = container.read(
        crowdfundingFormControllerProvider.notifier,
      )..set(brutProfit: '100');
      await controller.submit();
      final taxed = await database
          .select(database.crowdfundingEntries)
          .getSingle();

      // Act
      controller.set(id: taxed.id, brutProfit: '-50');
      await controller.submit();

      // Assert
      final loss = await database
          .select(database.crowdfundingEntries)
          .getSingle();
      expect(
        (loss.netProfit, loss.taxProfit, loss.taxPercentage),
        (null, null, null),
      );
    });
  });
}

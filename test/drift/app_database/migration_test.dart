import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monn/shared/local/database.dart';

import 'generated/schema.dart';
import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  late SchemaVerifier verifier;
  late bool previousMultipleDatabaseWarning;

  setUpAll(() {
    previousMultipleDatabaseWarning =
        driftRuntimeOptions.dontWarnAboutMultipleDatabases;
    driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
    verifier = SchemaVerifier(GeneratedHelper());
  });

  tearDownAll(() {
    driftRuntimeOptions.dontWarnAboutMultipleDatabases =
        previousMultipleDatabaseWarning;
  });

  test('migrates every historical schema to the current schema', () async {
    for (final fromVersion in GeneratedHelper.versions) {
      if (fromVersion == GeneratedHelper.versions.last) continue;

      final schema = await verifier.schemaAt(fromVersion);
      final db = AppDatabase(schema.newConnection());

      await verifier.migrateAndValidate(
        db,
        GeneratedHelper.versions.last,
      );
      await db.close();
    }
  });

  test('backfills missing crowdfunding dates during v1 to v2', () async {
    const legacyCrowdfunding = v1.CrowdfundingEntriesData(
      id: 1,
      brutProfit: 42,
      platformName: 'Legacy',
    );
    final expectedCrowdfunding = v2.CrowdfundingEntriesData(
      id: 1,
      brutProfit: 42,
      platformName: 'Legacy',
      receivedAt: DateTime.fromMillisecondsSinceEpoch(0),
    );

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insert(oldDb.crowdfundingEntries, legacyCrowdfunding);
      },
      validateItems: (newDb) async {
        expect(
          await newDb.select(newDb.crowdfundingEntries).getSingle(),
          expectedCrowdfunding,
        );
      },
    );
  });
}

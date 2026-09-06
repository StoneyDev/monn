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

  test('migrates crowdfunding social charges to full flat tax', () async {
    final schema = await verifier.schemaAt(2);
    final oldDb = v2.DatabaseAtV2(schema.newConnection());
    for (final rate in <double?>[17.2, 18.6, 30, 31.4, null]) {
      await oldDb
          .into(oldDb.crowdfundingEntries)
          .insert(
            v2.CrowdfundingEntriesCompanion.insert(
              platformName: 'LPB',
              receivedAt: DateTime(2026),
              brutProfit: 123.45,
              taxPercentage: Value(rate),
              taxProfit: Value(rate == null ? null : 20),
              netProfit: Value(rate == null ? 123.45 : 103.45),
            ),
          );
    }
    final db = AppDatabase(schema.newConnection());
    addTearDown(db.close);
    addTearDown(oldDb.close);

    final entries = await db.select(db.crowdfundingEntries).get();
    expect(entries.map((e) => e.taxPercentage), [30, 31.4, 30, 31.4, null]);
    expect(entries.map((e) => e.taxProfit), [37.03, 38.76, 20, 20, null]);
    expect(entries.map((e) => e.netProfit), [
      86.42,
      84.69,
      103.45,
      103.45,
      123.45,
    ]);
  });

  test('preserves legacy losses during flat tax migration', () async {
    final schema = await verifier.schemaAt(2);
    final oldDb = v2.DatabaseAtV2(schema.newConnection());
    addTearDown(oldDb.close);
    await oldDb
        .into(oldDb.crowdfundingEntries)
        .insert(
          v2.CrowdfundingEntriesCompanion.insert(
            platformName: 'LPB',
            receivedAt: DateTime(2025),
            brutProfit: -100,
            taxPercentage: const Value(17.2),
            taxProfit: const Value(17.2),
            netProfit: const Value(82.8),
          ),
        );
    final db = AppDatabase(schema.newConnection());
    addTearDown(db.close);

    final entry = await db.select(db.crowdfundingEntries).getSingle();
    expect(entry.brutProfit, -100);
    expect(entry.taxPercentage, 17.2);
    expect(entry.taxProfit, 17.2);
    expect(entry.netProfit, 82.8);
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

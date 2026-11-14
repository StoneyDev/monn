import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/cto/data/cto_repository.dart';
import 'package:monn/features/pea/data/etf_api.dart';
import 'package:monn/features/pea/data/etf_repository.dart';
import 'package:monn/features/pea/domain/etf_quote.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/shared/domain/payout_report_data.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

import '../../../utils.dart';

void main() {
  late AppDatabase db;
  late _FakeEtfApi api;
  late ProviderContainer container;

  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    db = AppDatabase(NativeDatabase.memory());
    addTearDown(db.close);
    api = _FakeEtfApi();
    container = createContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        etfRepositoryProvider.overrideWithValue(EtfRepository(api)),
      ],
    );
  });

  Future<void> refreshCtoPrices() async {
    container.invalidate(refreshCtoPricesProvider);
    await container.read(refreshCtoPricesProvider.future);
  }

  test('quotes only stale CTO lines and stores their price', () async {
    final freshUpdate = DateTime.now().subtract(const Duration(minutes: 10));
    await db.batch(
      (batch) => batch.insertAll(db.ctoEntries, [
        CtoEntriesCompanion.insert(
          name: 'Fresh',
          symbol: 'ESE.PAR',
          quantity: 1,
          costAverage: 10,
          lastPrice: const Value(11),
          lastUpdate: Value(freshUpdate),
        ),
        CtoEntriesCompanion.insert(
          name: 'L&G Clean Water',
          symbol: 'XMLC.DEX',
          quantity: 2.5,
          costAverage: 18,
        ),
      ]),
    );
    container.listen(refreshCtoPricesProvider, (_, _) {});

    await container.read(refreshCtoPricesProvider.future);

    final ctos = await db.select(db.ctoEntries).get();
    expect(api.symbols, ['XMLC.DEX']);
    expect(ctos.map((cto) => cto.lastPrice), [11, 19.16]);
    expect(ctos.last.lastUpdate, isNotNull);
  });

  test(
    'drops the price of a mistyped ticker and quotes it once corrected',
    () async {
      final id = await db
          .into(db.ctoEntries)
          .insert(
            CtoEntriesCompanion.insert(
              name: 'L&G Clean Water',
              symbol: 'XMLC.DEX',
              quantity: 2.5,
              costAverage: 18,
              lastPrice: const Value(19.16),
              lastUpdate: Value(DateTime.now()),
            ),
          );
      Future<void> editSymbol(String symbol) => CtoRepository(db).editCto(
        CtoEntriesCompanion.insert(
          id: Value(id),
          name: 'L&G Clean Water',
          symbol: symbol,
          quantity: 2.5,
          costAverage: 18,
        ),
      );
      container.listen(refreshCtoPricesProvider, (_, _) {});
      await container.read(refreshCtoPricesProvider.future);

      await editSymbol('FGDSFDS');
      expect((await db.select(db.ctoEntries).getSingle()).lastPrice, isNull);
      await refreshCtoPrices();
      await refreshCtoPrices();
      expect(api.symbols, ['FGDSFDS']);

      await editSymbol('XMLC.DEX');
      await refreshCtoPrices();

      expect(api.symbols, ['FGDSFDS', 'XMLC.DEX']);
      expect((await db.select(db.ctoEntries).getSingle()).lastPrice, 19.16);
    },
  );

  test('stops quoting for an hour once the quota is spent', () async {
    api.quotaSpent = true;
    await db.batch(
      (batch) => batch.insertAll(db.ctoEntries, [
        for (final symbol in ['ESE.PAR', 'XMLC.DEX'])
          CtoEntriesCompanion.insert(
            name: symbol,
            symbol: symbol,
            quantity: 1,
            costAverage: 10,
          ),
      ]),
    );
    container.listen(refreshCtoPricesProvider, (_, _) {});
    await container.read(refreshCtoPricesProvider.future);

    await refreshCtoPrices();

    expect(api.symbols, ['ESE.PAR']);
  });

  test('values the CTO at the paid-in amount plus latent gains', () async {
    await SavingsRepository(db).setSavingsStartAmount(.cto, 1000);
    await db.batch(
      (batch) => batch.insertAll(db.ctoEntries, [
        CtoEntriesCompanion.insert(
          name: 'Quoted',
          symbol: 'XMLC.DEX',
          quantity: 2,
          costAverage: 10,
          lastPrice: const Value(15),
        ),
        CtoEntriesCompanion.insert(
          name: 'Not quoted yet',
          symbol: 'ESE.PAR',
          quantity: 1,
          costAverage: 20,
        ),
      ]),
    );
    container.listen(watchPayoutReportCtoProvider, (_, _) {});

    final report = await container.read(watchPayoutReportCtoProvider.future);

    expect(
      report,
      const PayoutReportData(finalAmount: 1010, totalNetProfit: 10),
    );
  });
}

class _FakeEtfApi implements EtfApi {
  final symbols = <String>[];
  bool quotaSpent = false;

  @override
  Future<EtfQuoteResponse> getQuote(
    String function,
    String symbol,
    String apiKey,
  ) async {
    symbols.add(symbol);
    // Alpha Vantage leaves out the quote once the quota is spent, and answers
    // an empty quote for a ticker it does not know.
    if (quotaSpent) return const EtfQuoteResponse();
    return EtfQuoteResponse(
      globalQuote: EtfQuote(price: symbol == 'XMLC.DEX' ? '19.16' : null),
    );
  }
}

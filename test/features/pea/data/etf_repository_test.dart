import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/pea/data/etf_api.dart';
import 'package:monn/features/pea/data/etf_repository.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/domain/etf_quote.dart';
import 'package:monn/shared/local/database.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

import '../../../utils.dart';

void main() {
  test('refreshes cached PEA data after updating the ETF price', () async {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    final peaRepository = _FakePeaRepository(
      PeaEntry(
        id: 1,
        equity: 2,
        costAverage: 80,
        lastPrice: 100,
        lastUpdate: DateTime.now().subtract(const Duration(hours: 2)),
      ),
    );
    final container = createContainer(
      overrides: [
        peaRepositoryProvider.overrideWithValue(peaRepository),
        etfRepositoryProvider.overrideWithValue(const _FakeEtfRepository(120)),
      ],
    )..listen(getPeaProvider, (_, _) {});

    expect((await container.read(getPeaProvider.future))?.lastPrice, 100);

    await container.read(getEtfPriceMarketProvider.future);

    expect((await container.read(getPeaProvider.future))?.lastPrice, 120);
  });

  test('spaces quotes one second apart for the free API key', () async {
    final api = _FakeEtfApi();
    final repository = EtfRepository(api);

    final prices = await Future.wait([
      repository.getEtfPriceMarket('ESE.PAR'),
      repository.getEtfPriceMarket('XMLC.DEX'),
    ]);

    expect(prices, [19.16, 19.16]);
    expect(api.symbols, ['ESE.PAR', 'XMLC.DEX']);
    expect(
      api.requestedAt.last.difference(api.requestedAt.first),
      greaterThanOrEqualTo(const Duration(seconds: 1)),
    );
  });
}

class _FakeEtfApi implements EtfApi {
  final symbols = <String>[];
  final requestedAt = <DateTime>[];

  @override
  Future<EtfQuoteResponse> getQuote(
    String function,
    String symbol,
    String apiKey,
  ) async {
    symbols.add(symbol);
    requestedAt.add(DateTime.now());
    return const EtfQuoteResponse(globalQuote: EtfQuote(price: '19.16'));
  }
}

class _FakeEtfRepository implements EtfRepository {
  const _FakeEtfRepository(this.price);

  final double price;

  @override
  Future<double?> getEtfPriceMarket(String symbol) async => price;
}

class _FakePeaRepository implements PeaRepository {
  _FakePeaRepository(this.pea);

  PeaEntry? pea;

  @override
  Future<PeaEntry?> getPea() async => pea;

  @override
  Future<void> editPea(PeaEntriesCompanion newPea) async {
    pea = pea?.copyWithCompanion(newPea);
  }
}

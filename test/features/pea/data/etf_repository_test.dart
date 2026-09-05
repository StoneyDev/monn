import 'package:flutter_test/flutter_test.dart';
import 'package:monn/features/pea/data/etf_repository.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/shared/local/database.dart';

import '../../../utils.dart';

void main() {
  test('refreshes cached PEA data after updating the ETF price', () async {
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
        etfRepositoryProvider.overrideWithValue(
          const _FakeEtfRepository(120),
        ),
      ],
    )..listen(getPeaProvider, (_, _) {});

    expect((await container.read(getPeaProvider.future))?.lastPrice, 100);

    await container.read(getEtfPriceMarketProvider.future);

    expect((await container.read(getPeaProvider.future))?.lastPrice, 120);
  });
}

class _FakeEtfRepository implements EtfRepository {
  const _FakeEtfRepository(this.price);

  final double price;

  @override
  Future<double?> getEtfPriceMarket() async => price;
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

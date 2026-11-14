import 'package:drift/drift.dart';
import 'package:monn/features/pea/data/etf_repository.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/shared/domain/payout_report_data.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/local/local_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cto_repository.g.dart';

class CtoRepository {
  const CtoRepository(this._db);

  final AppDatabase _db;

  Stream<List<CtoEntry>> watchCtos() {
    return _db.select(_db.ctoEntries).watch();
  }

  Future<List<CtoEntry>> getCtos() {
    return _db.select(_db.ctoEntries).get();
  }

  Future<void> editCto(CtoEntriesCompanion cto) async {
    final previous = cto.id.present
        ? await (_db.select(
            _db.ctoEntries,
          )..where((row) => row.id.equals(cto.id.value))).getSingleOrNull()
        : null;

    // A new ticker must not keep the price quoted for the previous one.
    await _db
        .into(_db.ctoEntries)
        .insertOnConflictUpdate(
          previous?.symbol == cto.symbol.value
              ? cto
              : cto.copyWith(
                  lastPrice: const Value(null),
                  lastUpdate: const Value(null),
                ),
        );
  }

  /// Records a quote of [cto]'s ticker. A null [price] (unknown ticker) leaves
  /// the line without a price until the next check.
  Future<void> updatePrice(CtoEntry cto, double? price) {
    return (_db.update(_db.ctoEntries)..where(
          (row) => row.id.equals(cto.id) & row.symbol.equals(cto.symbol),
        ))
        .write(
          CtoEntriesCompanion(
            lastPrice: Value(price),
            lastUpdate: Value(.now()),
          ),
        );
  }

  Future<void> deleteCto(int id) {
    return (_db.delete(_db.ctoEntries)..where((row) => row.id.equals(id))).go();
  }
}

@Riverpod(keepAlive: true)
CtoRepository ctoRepository(Ref ref) {
  return CtoRepository(ref.watch(appDatabaseProvider));
}

@riverpod
Stream<List<CtoEntry>> watchCtos(Ref ref) {
  return ref.watch(ctoRepositoryProvider).watchCtos();
}

@riverpod
Future<void> refreshCtoPrices(Ref ref) async {
  final ctoRepository = ref.watch(ctoRepositoryProvider);
  final etfRepository = ref.watch(etfRepositoryProvider);
  final now = DateTime.now();

  final prefs = await SharedPreferencesWithCache.create(
    cacheOptions: const SharedPreferencesWithCacheOptions(
      allowList: <String>{'lastCtoEmptyQuote'},
    ),
  );
  // Alpha Vantage answers without a price once its daily quota is spent;
  // asking again on every resume would keep it spent.
  final lastEmptyQuote = prefs.getString('lastCtoEmptyQuote');
  if (lastEmptyQuote != null &&
      now.isBefore(
        DateTime.parse(lastEmptyQuote).add(const Duration(hours: 1)),
      )) {
    return;
  }

  final staleCtos = (await ctoRepository.getCtos()).where(
    (cto) =>
        cto.lastUpdate == null ||
        now.isAfter(cto.lastUpdate!.add(const Duration(hours: 1))),
  );

  for (final cto in staleCtos) {
    // A newer refresh (resume or edit) quotes the remaining lines.
    if (!ref.mounted) return;

    final double? price;
    try {
      price = await etfRepository.getEtfPriceMarket(cto.symbol);
    } on FormatException {
      // A mistyped ticker keeps its "-" without pausing the other lines. It
      // is checked again in an hour, or as soon as its ticker is corrected.
      await ctoRepository.updatePrice(cto, null);
      continue;
    }

    if (price == null) {
      // The other lines would be refused too.
      await prefs.setString('lastCtoEmptyQuote', now.toIso8601String());
      return;
    }

    await ctoRepository.updatePrice(cto, price);
  }
}

@riverpod
Stream<PayoutReportData> watchPayoutReportCto(Ref ref) async* {
  final repository = ref.watch(ctoRepositoryProvider);
  final startAmount = await ref.watch(
    getSavingsProvider(
      type: .cto,
    ).selectAsync((savings) => savings?.startAmount ?? 0),
  );

  await for (final ctos in repository.watchCtos()) {
    final latentValue = ctos.fold<double>(
      0,
      (total, cto) =>
          total +
          cto.quantity * ((cto.lastPrice ?? cto.costAverage) - cto.costAverage),
    );

    yield PayoutReportData(
      finalAmount: startAmount + latentValue,
      totalNetProfit: latentValue,
    );
  }
}

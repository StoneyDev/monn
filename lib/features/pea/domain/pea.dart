import 'package:isar/isar.dart';

part 'pea.g.dart';

@collection
class Pea {
  Id id = Isar.autoIncrement;
  int? equity;
  double? costAverage;
  double? lastPrice;
  DateTime? lastUpdate;
}

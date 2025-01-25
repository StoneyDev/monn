import 'package:isar/isar.dart';

part 'pea.g.dart';

@collection
class Pea {
  Id id = Isar.autoIncrement;
  int equity = 0;
  double costAverage = 0;
  double lastPrice = 0;
  DateTime? lastUpdate;
}

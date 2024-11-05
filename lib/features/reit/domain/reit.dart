import 'package:isar/isar.dart';

part 'reit.g.dart';

@collection
class Reit {
  Id? id;
  late String name;
  late DateTime boughtOn;
  late double shares;
  late double price;

  final dividends = IsarLinks<ReitDividend>();
}

@collection
class ReitDividend {
  Id? id;
  late DateTime receivedAt;
  late double amount;
}

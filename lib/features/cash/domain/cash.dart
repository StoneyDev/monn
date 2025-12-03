import 'package:isar_community/isar.dart';

part 'cash.g.dart';

@collection
class Cash {
  Id id = Isar.autoIncrement;

  late String label;
  late double value;
}

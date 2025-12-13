import 'package:isar_community/isar.dart';

part 'per.g.dart';

@collection
class Per {
  Id id = Isar.autoIncrement;

  double invested = 0;
  double interests = 0;
}

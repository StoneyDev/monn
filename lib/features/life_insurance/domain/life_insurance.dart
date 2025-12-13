import 'package:isar_community/isar.dart';

part 'life_insurance.g.dart';

@collection
class LifeInsurance {
  Id id = Isar.autoIncrement;

  double invested = 0;
  double interests = 0;
}

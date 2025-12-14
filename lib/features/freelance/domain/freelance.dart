import 'package:isar_community/isar.dart';

part 'freelance.g.dart';

@collection
class Freelance {
  Id id = Isar.autoIncrement;

  double annualRevenue = 0;
}

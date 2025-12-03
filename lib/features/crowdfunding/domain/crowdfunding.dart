import 'package:isar_community/isar.dart';

part 'crowdfunding.g.dart';

@collection
class Crowdfunding {
  Id id = Isar.autoIncrement;

  late double brutProfit;
  late String platformName;

  double? netProfit;
  double? taxProfit;
  double? taxPercentage;
  DateTime? receivedAt;
}

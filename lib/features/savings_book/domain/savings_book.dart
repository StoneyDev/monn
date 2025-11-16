import 'package:isar_community/isar.dart';

part 'savings_book.g.dart';

@collection
class SavingsBook {
  Id? id;
  late String name;
  double startAmount = 0;
  double withdrawal = 0;
  double interests = 0;
}

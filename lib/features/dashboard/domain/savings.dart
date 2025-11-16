// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar_community/isar.dart';

// part 'savings.freezed.dart';
part 'savings.g.dart';

// @freezed
// abstract class SavingsEntity with _$SavingsEntity {
//   const factory SavingsEntity({
//     @Enumerated(EnumType.name) required SavingsType type,
//     double? startAmount,
//     @Default(Isar.autoIncrement) Id id,
//   }) = _SavingsEntity;

//   @override
//   Id get id;
// }

@collection
class Savings {
  Id id = Isar.autoIncrement;
  @Enumerated(EnumType.name)
  late SavingsType type;
  double? startAmount;
}

enum SavingsType {
  savingsBook,
  crowdfunding,
  cryptocurrency,
  csKnives,
  cash,
  // cto('CTO'),
  // lifeInsurance('Assurance-vie'),
  pea,
  reit,
  // rip('PER')
}

enum SavingsFilter {
  sortByStartAmountDesc,
  sortByStartAmountAsc,
  // sortByFinalAmountDesc, // TODO(yann): Need refactor for this
  // sortByFinalAmountAsc,
}

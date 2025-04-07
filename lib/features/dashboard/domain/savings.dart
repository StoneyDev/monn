import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'savings.freezed.dart';
part 'savings.g.dart';

@freezed
@Collection(ignore: {'copyWith'})
class Savings with _$Savings {
  const factory Savings({
    @Enumerated(EnumType.name) required SavingsType type,
    double? startAmount,
    @Default(Isar.autoIncrement) Id id,
  }) = _Savings;

  @override
  Id get id;
}

enum SavingsType {
  savingsBook,
  crowdfunding,
  cryptocurrency,
  csKnives,
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

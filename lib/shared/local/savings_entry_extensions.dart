import 'package:monn/shared/domain/savings.dart';
import 'package:monn/shared/local/database.dart';

extension SavingsEntryX on SavingsEntry {
  SavingsType get savingsType => SavingsType.values.byName(type);
}

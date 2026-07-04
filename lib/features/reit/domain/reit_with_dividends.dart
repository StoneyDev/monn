import 'package:monn/shared/local/database.dart';

class ReitWithDividends {
  const ReitWithDividends({required this.reit, required this.dividends});

  final ReitEntry reit;
  final List<ReitDividendEntry> dividends;
}

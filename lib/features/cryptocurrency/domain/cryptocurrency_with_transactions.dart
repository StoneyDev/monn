import 'package:monn/shared/local/database.dart';

class CryptocurrencyWithTransactions {
  const CryptocurrencyWithTransactions({
    required this.crypto,
    required this.transactions,
  });

  final CryptocurrencyEntry crypto;
  final List<CryptocurrencyTransactionEntry> transactions;
}

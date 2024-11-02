import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/cryptocurrency/data/cryptocurrency_repository.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';

@GenerateNiceMocks([
  MockSpec<CrowdfundingRepository>(),
  MockSpec<SavingsRepository>(),
  MockSpec<CryptocurrencyRepository>(),
  MockSpec<ReitRepository>(),
  MockSpec<SavingsBookRepository>(),
])
class MockListener<T> extends Mock {
  void call(T? previous, T next);
}

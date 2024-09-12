import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';

@GenerateNiceMocks([
  MockSpec<CrowdfundingRepository>(),
  MockSpec<SavingsRepository>(),
])
class MockListener<T> extends Mock {
  void call(T? previous, T next);
}

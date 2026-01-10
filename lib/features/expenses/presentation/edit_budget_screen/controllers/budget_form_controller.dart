import 'package:monn/features/expenses/data/expenses_repository.dart';
import 'package:monn/features/expenses/domain/budget.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'budget_form_controller.g.dart';

typedef BudgetForm = ({
  // Income
  double freelanceIncome,
  // Housing
  double rent,
  double electricity,
  double gas,
  double water,
  double internet,
  double homeInsurance,
  // Transport
  double publicTransport,
  // Food
  double groceries,
  double restaurants,
  // Health
  double healthInsurance,
  // Subscriptions
  double phone,
  double ai,
});

@Riverpod(keepAlive: true)
class BudgetFormController extends _$BudgetFormController {
  @override
  Future<BudgetForm> build() async {
    var budget = await ref
        .read(expensesRepositoryProvider)
        .getOrCreateBudget();

    if (!ref.mounted) budget = Budget();

    return (
      freelanceIncome: budget.freelanceIncome,
      rent: budget.rent,
      electricity: budget.electricity,
      gas: budget.gas,
      water: budget.water,
      internet: budget.internet,
      homeInsurance: budget.homeInsurance,
      publicTransport: budget.publicTransport,
      groceries: budget.groceries,
      restaurants: budget.restaurants,
      healthInsurance: budget.healthInsurance,
      phone: budget.phone,
      ai: budget.ai,
    );
  }

  void set({
    double? freelanceIncome,
    double? rent,
    double? electricity,
    double? gas,
    double? water,
    double? internet,
    double? homeInsurance,
    double? publicTransport,
    double? groceries,
    double? restaurants,
    double? healthInsurance,
    double? phone,
    double? ai,
  }) {
    final current = state.value;
    if (current == null) return;

    state = AsyncData(
      (
        freelanceIncome: freelanceIncome ?? current.freelanceIncome,
        rent: rent ?? current.rent,
        electricity: electricity ?? current.electricity,
        gas: gas ?? current.gas,
        water: water ?? current.water,
        internet: internet ?? current.internet,
        homeInsurance: homeInsurance ?? current.homeInsurance,
        publicTransport: publicTransport ?? current.publicTransport,
        groceries: groceries ?? current.groceries,
        restaurants: restaurants ?? current.restaurants,
        healthInsurance: healthInsurance ?? current.healthInsurance,
        phone: phone ?? current.phone,
        ai: ai ?? current.ai,
      ),
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(expensesRepositoryProvider);
    final formData = state.value;

    if (formData == null) return false;

    final budget = Budget()
      ..id = 1
      ..freelanceIncome = formData.freelanceIncome
      ..rent = formData.rent
      ..electricity = formData.electricity
      ..gas = formData.gas
      ..water = formData.water
      ..internet = formData.internet
      ..homeInsurance = formData.homeInsurance
      ..publicTransport = formData.publicTransport
      ..groceries = formData.groceries
      ..restaurants = formData.restaurants
      ..healthInsurance = formData.healthInsurance
      ..phone = formData.phone
      ..ai = formData.ai;

    final result = await AsyncValue.guard(() => repository.saveBudget(budget));

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}

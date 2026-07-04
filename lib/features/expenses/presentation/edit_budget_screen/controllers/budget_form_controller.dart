import 'package:drift/drift.dart';
import 'package:monn/features/expenses/data/expenses_repository.dart';
import 'package:monn/shared/local/database.dart';
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
    final budget = await ref
        .read(expensesRepositoryProvider)
        .getOrCreateBudget();

    if (!ref.mounted) {
      return (
        freelanceIncome: 0.0,
        rent: 0.0,
        electricity: 0.0,
        gas: 0.0,
        water: 0.0,
        internet: 0.0,
        homeInsurance: 0.0,
        publicTransport: 0.0,
        groceries: 0.0,
        restaurants: 0.0,
        healthInsurance: 0.0,
        phone: 0.0,
        ai: 0.0,
      );
    }

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

    final budget = BudgetEntriesCompanion(
      id: const Value(1),
      freelanceIncome: Value(formData.freelanceIncome),
      rent: Value(formData.rent),
      electricity: Value(formData.electricity),
      gas: Value(formData.gas),
      water: Value(formData.water),
      internet: Value(formData.internet),
      homeInsurance: Value(formData.homeInsurance),
      publicTransport: Value(formData.publicTransport),
      groceries: Value(formData.groceries),
      restaurants: Value(formData.restaurants),
      healthInsurance: Value(formData.healthInsurance),
      phone: Value(formData.phone),
      ai: Value(formData.ai),
    );

    final result = await AsyncValue.guard(() => repository.saveBudget(budget));

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}

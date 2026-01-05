import 'package:isar_community/isar.dart';
import 'package:monn/features/crowdfunding/data/crowdfunding_repository.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'crowdfunding_form_controller.g.dart';

typedef CrowdfundingForm = ({
  String platformName,
  DateTime receivedAt,
  String brutProfit,
  String? taxPercentage,
  int? id,
});

@Riverpod(keepAlive: true)
class CrowdfundingFormController extends _$CrowdfundingFormController {
  @override
  CrowdfundingForm build() => (
    platformName: 'LPB',
    receivedAt: DateTime.now(),
    brutProfit: '',
    taxPercentage: null,
    id: null,
  );

  void set({
    String? platformName,
    DateTime? receivedAt,
    String? brutProfit,
    String? taxPercentage,
    int? id,
    bool clearTax = false,
  }) {
    state = (
      platformName: platformName ?? state.platformName,
      receivedAt: receivedAt ?? state.receivedAt,
      brutProfit: brutProfit ?? state.brutProfit,
      taxPercentage: clearTax ? null : (taxPercentage ?? state.taxPercentage),
      id: id ?? state.id,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(crowdfundingRepositoryProvider);

    final id = state.id ?? Isar.autoIncrement;
    final platformName = state.platformName;
    final receivedAt = state.receivedAt;
    final brutProfit = double.parse(state.brutProfit);

    late Crowdfunding newCrowdfunding;

    if (brutProfit.isNegative) {
      newCrowdfunding = Crowdfunding()
        ..id = id
        ..platformName = platformName
        ..receivedAt = receivedAt
        ..brutProfit = brutProfit;
    } else if (state.taxPercentage == null) {
      newCrowdfunding = Crowdfunding()
        ..id = id
        ..platformName = platformName
        ..receivedAt = receivedAt
        ..brutProfit = brutProfit
        ..netProfit = brutProfit;
    } else {
      final taxPercentage = double.parse(state.taxPercentage!);
      final taxProfit = double.parse(
        (brutProfit * (taxPercentage / 100)).toStringAsFixed(2),
      );
      final netProfit = double.parse(
        (brutProfit - taxProfit).toStringAsFixed(2),
      );

      newCrowdfunding = Crowdfunding()
        ..id = id
        ..platformName = platformName
        ..receivedAt = receivedAt
        ..taxPercentage = taxPercentage
        ..taxProfit = taxProfit
        ..brutProfit = brutProfit
        ..netProfit = netProfit;
    }

    final result = await AsyncValue.guard(
      () => repository.editCrowdfunding(newCrowdfunding),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}

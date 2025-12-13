import 'package:freezed_annotation/freezed_annotation.dart';

part 'life_insurance_form.freezed.dart';

@freezed
abstract class LifeInsuranceForm with _$LifeInsuranceForm {
  const factory LifeInsuranceForm({
    required String invested,
    required String interests,
  }) = _LifeInsuranceForm;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'freelance_form.freezed.dart';

@freezed
abstract class FreelanceForm with _$FreelanceForm {
  const factory FreelanceForm({
    required String annualRevenue,
  }) = _FreelanceForm;
}

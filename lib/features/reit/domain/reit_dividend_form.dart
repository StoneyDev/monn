import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monn/features/reit/domain/reit.dart';

part 'reit_dividend_form.freezed.dart';

@freezed
class ReitDividendForm with _$ReitDividendForm {
  const factory ReitDividendForm({
    Reit? reit,
    DateTime? receivedAt,
    double? amount,
  }) = _ReitDividendForm;
}

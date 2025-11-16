import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monn/features/reit/domain/reit.dart';

part 'reit_dividend_form.freezed.dart';

@freezed
abstract class ReitDividendForm with _$ReitDividendForm {
  const factory ReitDividendForm({
    required DateTime receivedAt,
    required String amount,
    Reit? reit,
  }) = _ReitDividendForm;
}

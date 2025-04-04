import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monn/features/cryptocurrency/domain/cryptocurrency.dart';

part 'crypto_form.freezed.dart';

@freezed
class CryptoForm with _$CryptoForm {
  const factory CryptoForm({
    required String amount,
    required DateTime date,
    Cryptocurrency? crypto,
  }) = _CryptoForm;
}

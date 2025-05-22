import 'package:monn/features/cash/domain/cash_form.dart';
import 'package:monn/shared/extensions/ref_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cash_form_controller.g.dart';

@riverpod
class CashFormController extends _$CashFormController {
  @override
  CashForm build() => const CashForm(label: '', value: '');

  void id({int? id}) {
    // Maintains the value until next page is loaded
    ref.cacheFor(const Duration(seconds: 2));
    state = state.copyWith(id: id);
  }

  void label({required String label}) {
    state = state.copyWith(label: label);
  }

  void value({required String value}) {
    state = state.copyWith(value: value);
  }
}

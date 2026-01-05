import 'package:monn/features/per/data/per_repository.dart';
import 'package:monn/features/per/domain/per.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'per_form_controller.g.dart';

typedef PerForm = ({String invested, String interests});

@Riverpod(keepAlive: true)
class PerFormController extends _$PerFormController {
  @override
  PerForm build() => (invested: '', interests: '');

  void set({String? invested, String? interests}) {
    state = (
      invested: invested ?? state.invested,
      interests: interests ?? state.interests,
    );
  }

  Future<bool> submit() async {
    final repository = ref.read(perRepositoryProvider);

    final result = await AsyncValue.guard(
      () => repository.editPer(
        Per()
          ..invested = double.parse(state.invested)
          ..interests = double.parse(state.interests),
      ),
    );

    if (!ref.mounted) return false;

    return !result.hasError;
  }
}

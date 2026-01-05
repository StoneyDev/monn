import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/savings_book_form_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/fields/monn_field_text.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class SavingsBookFormScreen extends ConsumerStatefulWidget {
  const SavingsBookFormScreen({super.key});

  @override
  ConsumerState<SavingsBookFormScreen> createState() =>
      _SavingsBookFormScreenState();
}

class _SavingsBookFormScreenState extends ConsumerState<SavingsBookFormScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final savingsBookData = ref.watch(
      getSavingsProvider(type: SavingsType.savingsBook).select(
        (savings) => savings.value,
      ),
    );

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(LocaleKeys.common_add_savings_book),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            children: [
              MonnFieldText(
                label: context.tr(LocaleKeys.common_savings_book_name),
                required: true,
                onChanged: (newName) => ref
                    .read(savingsBookFormControllerProvider.notifier)
                    .set(name: newName),
              ),
              MonnFieldNumber<double>(
                label: context.tr(LocaleKeys.common_start_amount),
                suffix: '€',
                required: true,
                onChanged: (newStartAmount) => ref
                    .read(savingsBookFormControllerProvider.notifier)
                    .set(startAmount: newStartAmount),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MonnButton(
            text: context.tr(LocaleKeys.button_validate),
            onPressed: () async {
              if (!(formKey.currentState?.validate() ?? false)) return;

              final formData = ref.read(savingsBookFormControllerProvider);

              final success = await ref
                  .read(savingsBookFormControllerProvider.notifier)
                  .submit();

              final newSaving =
                  savingsBookData ??
                  (Savings()..type = SavingsType.savingsBook);
              newSaving.startAmount =
                  (newSaving.startAmount ?? 0) +
                  double.parse(formData.startAmount);

              final updated = await ref
                  .read(editSavingsControllerProvider.notifier)
                  .submit(newSaving);

              if (!context.mounted || !success || !updated) return;

              ref
                ..invalidate(savingsBookFormControllerProvider)
                ..invalidate(getSavingsProvider);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

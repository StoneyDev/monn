import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/savings_book_form_controller.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/submit_savings_book_form_controller.dart';
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
        title: context.tr('common.add_savings_book'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MonnFieldText(
                label: context.tr('common.savings_book_name'),
                required: true,
                onChanged: (newName) => ref
                    .read(savingsBookFormControllerProvider.notifier)
                    .name(name: newName),
              ),
              const SizedBox(height: 16),
              MonnFieldNumber<double>(
                label: context.tr('common.start_amount'),
                suffix: '€',
                required: true,
                onChanged: (newStartAmount) => ref
                    .read(savingsBookFormControllerProvider.notifier)
                    .startAmount(startAmount: newStartAmount),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MonnButton(
            text: context.tr('button.validate'),
            onPressed: () async {
              if (!(formKey.currentState?.validate() ?? false)) return;

              final success = await ref
                  .read(submitSavingsBookFormControllerProvider.notifier)
                  .submit();

              final formData = ref.read(savingsBookFormControllerProvider);

              final newSaving = savingsBookData
                ?..startAmount =
                    (savingsBookData.startAmount ?? 0) +
                    double.parse(formData.startAmount);

              final updated = await ref
                  .read(editSavingsControllerProvider.notifier)
                  .submit(newSaving!);

              if (!context.mounted || !success || !updated) return;

              ref
                ..invalidate(savingsBookFormControllerProvider)
                ..invalidate(submitSavingsBookFormControllerProvider)
                ..invalidate(getSavingsProvider);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

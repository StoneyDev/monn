import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/savings_book_form_controller.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/submit_savings_book_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/fields/monn_field_text.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class SavingsBookFormScreen extends ConsumerWidget {
  const SavingsBookFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingsBookData = ref.watch(
      getSavingsProvider(type: SavingsType.savingsBook).select(
        (savings) => savings.valueOrNull,
      ),
    );
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const MonnAppBar(
        title: 'Ajouter un livret',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MonnFieldText(
                label: 'Nom du livret',
                required: true,
                onChanged: (value) => ref
                    .read(savingsBookFormControllerProvider.notifier)
                    .edit(name: value),
              ),
              const SizedBox(height: 16),
              MonnFieldNumber(
                label: 'Montant initial',
                suffix: '€',
                required: true,
                onChanged: (value) => ref
                    .read(savingsBookFormControllerProvider.notifier)
                    .edit(startAmount: value.isEmpty ? '0' : value),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: MonnButton(
          text: context.tr('button.validate'),
          onPressed: () async {
            if (!formKey.currentState!.validate()) return;

            final success = await ref
                .read(submitSavingsBookFormControllerProvider.notifier)
                .submit();

            final formData = ref.read(savingsBookFormControllerProvider);

            final newSaving = savingsBookData?.copyWith(
              startAmount: savingsBookData.startAmount + formData.startAmount!,
            );

            final updated = await ref
                .read(editSavingsControllerProvider.notifier)
                .submit(newSaving!);

            if (!context.mounted || !success || !updated) return;

            ref
              ..invalidate(submitSavingsBookFormControllerProvider)
              ..invalidate(watchPayoutReportSavingsBookProvider)
              ..invalidate(getSavingsProvider);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

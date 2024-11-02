import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/savings_book_form_controller.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/submit_savings_book_form_controller.dart';
import 'package:monn/shared/widgets/fields/moon_field_number.dart';
import 'package:monn/shared/widgets/fields/moon_field_text.dart';
import 'package:monn/shared/widgets/moon_app_bar.dart';
import 'package:monn/shared/widgets/moon_button.dart';

class SavingsBookFormScreen extends ConsumerWidget {
  const SavingsBookFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref
        .watch(watchSavingProvider(type: SavingsType.savingsBook))
        .valueOrNull;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const MoonAppBar(
        title: 'Ajouter un livret',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MoonFieldText(
                label: 'Nom du livret',
                required: true,
                onChanged: (value) => ref
                    .read(savingsBookFormControllerProvider.notifier)
                    .edit(name: value),
              ),
              const SizedBox(height: 16),
              MoonFieldNumber(
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
        child: MoonButton(
          text: context.tr('button.validate'),
          onPressed: () async {
            if (!formKey.currentState!.validate()) return;

            final success = await ref
                .read(submitSavingsBookFormControllerProvider.notifier)
                .submit();

            final formData = ref.read(savingsBookFormControllerProvider);

            final newSaving = data!.copyWith(
              startAmount: data.startAmount + formData.startAmount!,
            );

            final updated = await ref
                .read(editSavingsControllerProvider.notifier)
                .submit(newSaving);

            if (!context.mounted || !success || !updated) return;

            ref.invalidate(submitSavingsBookFormControllerProvider);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_form_controller.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/submit_reit_form_controller.dart';
import 'package:monn/shared/widgets/fields/moon_field_date.dart';
import 'package:monn/shared/widgets/fields/moon_field_number.dart';
import 'package:monn/shared/widgets/fields/moon_field_text.dart';
import 'package:monn/shared/widgets/moon_app_bar.dart';
import 'package:monn/shared/widgets/moon_button.dart';

class ReitFormScreen extends ConsumerWidget {
  const ReitFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reitData =
        ref.watch(watchSavingProvider(type: SavingsType.reit)).valueOrNull;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: const MoonAppBar(
        title: 'Ajouter une SCPI',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MoonFieldText(
                label: 'Nom de la SCPI',
                required: true,
                onChanged: (value) => ref
                    .read(reitFormControllerProvider.notifier)
                    .edit(reitName: value),
              ),
              const SizedBox(height: 16),
              MoonFieldNumber(
                label: 'Part',
                suffix: '',
                required: true,
                onChanged: (value) => ref
                    .read(reitFormControllerProvider.notifier)
                    .edit(shares: value.isEmpty ? '0' : value),
              ),
              const SizedBox(height: 16),
              MoonFieldNumber(
                label: 'Prix de la part',
                suffix: '€',
                required: true,
                onChanged: (value) => ref
                    .read(reitFormControllerProvider.notifier)
                    .edit(price: value.isEmpty ? '0' : value),
              ),
              const SizedBox(height: 16),
              MoonFieldDate(
                label: 'Acheté le',
                required: true,
                onChanged: (value) => ref
                    .read(reitFormControllerProvider.notifier)
                    .edit(boughtOn: value),
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
                .read(submitReitFormControllerProvider.notifier)
                .submit();

            final formData = ref.read(reitFormControllerProvider);

            final newSaving = reitData!.copyWith(
              startAmount:
                  reitData.startAmount + (formData.price! * formData.shares!),
            );

            final updated = await ref
                .read(editSavingsControllerProvider.notifier)
                .submit(newSaving);

            if (!context.mounted || !success || !updated) return;

            ref.invalidate(submitReitFormControllerProvider);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

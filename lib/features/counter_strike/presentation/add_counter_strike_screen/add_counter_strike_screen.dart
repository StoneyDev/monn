import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/counter_strike/presentation/add_counter_strike_screen/controllers/counter_strike_form_controller.dart';
import 'package:monn/features/counter_strike/presentation/add_counter_strike_screen/controllers/submit_counter_strike_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/fields/monn_field_text.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class AddCounterStrikeScreen extends ConsumerWidget {
  const AddCounterStrikeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: MonnAppBar(
        title: 'Suivi des achats',
        onBack: () => ref.invalidate(counterStrikeFormControllerProvider),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MonnFieldText(
                label: "Nom de l'item",
                required: true,
                onChanged: (value) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .edit(name: value),
              ),
              const SizedBox(height: 16),
              MonnFieldNumber(
                label: 'Usure',
                suffix: '',
                onChanged: (value) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .edit(wear: value.isEmpty ? '0' : value),
              ),
              const SizedBox(height: 16),
              MonnFieldNumber(
                label: "Prix d'achat",
                suffix: '€',
                required: true,
                onChanged: (value) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .edit(purchaseValue: value.isEmpty ? '0' : value),
              ),
              const SizedBox(height: 16),
              MonnFieldNumber(
                label: 'Prix actuelle',
                suffix: '€',
                required: true,
                onChanged: (value) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .edit(currentValue: value.isEmpty ? '0' : value),
              ),
              const SizedBox(height: 16),
              MonnFieldDate(
                label: 'Acheté le',
                required: true,
                onChanged: (value) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .edit(boughtAt: value),
              ),
              const SizedBox(height: 16),
              MonnFieldNumber(
                label: 'Quantité',
                required: true,
                suffix: '',
                onChanged: (value) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .edit(quantity: value.isEmpty ? '0' : value),
              ),
              const SizedBox(height: 16),
              MonnFieldNumber(
                label: "ID de l'image",
                required: true,
                suffix: '',
                onChanged: (value) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .edit(imageId: value),
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
                .read(submitCounterStrikeFormControllerProvider.notifier)
                .submit();

            if (!context.mounted || !success) return;

            ref.invalidate(counterStrikeFormControllerProvider);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

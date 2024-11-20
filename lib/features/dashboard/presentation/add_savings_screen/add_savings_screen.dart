import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/utils/app_colors.dart';

final _savingsProvider = StateProvider.autoDispose<SavingsType?>((_) => null);

class AddSavingsScreen extends ConsumerWidget {
  const AddSavingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editSavingsControllerProvider);
    final selectedItem = ref.watch(_savingsProvider);
    final savingsType = ref.watch(
      watchSavingsProvider.select(
        (value) => value.valueOrNull?.map((saving) => saving.type) ?? [],
      ),
    );

    return Scaffold(
      appBar: const MonnAppBar(title: 'Ajouter une categorie'),
      body: ListView.builder(
        itemCount: SavingsType.values.length,
        itemBuilder: (context, index) {
          final saving = SavingsType.values[index];
          final isExist = savingsType.contains(saving);

          return RadioListTile<SavingsType>(
            value: saving,
            groupValue: selectedItem,
            onChanged: isExist
                ? null
                : (value) => ref.read(_savingsProvider.notifier).state = value,
            title: Text(
              saving.label,
              style: TextStyle(
                color: isExist
                    ? AppColors.extraLightGray
                    : selectedItem == saving
                        ? AppColors.darkGray
                        : AppColors.lightGray,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: MonnButton(
          text: context.tr('button.validate'),
          onPressed: selectedItem == null || state.isLoading
              ? null
              : () async {
                  final success = await ref
                      .read(editSavingsControllerProvider.notifier)
                      .submit(Savings(type: selectedItem));

                  if (!context.mounted || !success) return;

                  Navigator.pop(context);
                },
        ),
      ),
    );
  }
}

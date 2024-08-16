import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_saving_screen/controllers/add_saving_controller.dart';
import 'package:monn/shared/widgets/moon_app_bar.dart';
import 'package:monn/utils/app_colors.dart';

final _savingsProvider = StateProvider.autoDispose<SavingsType?>((_) => null);

class AddSavingScreen extends ConsumerWidget {
  const AddSavingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addSavingControllerProvider);
    final selectedItem = ref.watch(_savingsProvider);
    final savingsType = ref.watch(
      watchSavingsProvider.select(
        (value) => value.valueOrNull?.map((saving) => saving.type) ?? [],
      ),
    );

    return Scaffold(
      appBar: const MoonAppBar(title: 'Ajouter une categorie'),
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
        child: ElevatedButton(
          onPressed: selectedItem == null || state.isLoading
              ? null
              : () async {
                  final success = await ref
                      .read(addSavingControllerProvider.notifier)
                      .submit(selectedItem);

                  if (!context.mounted || !success) return;

                  Navigator.pop(context);
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: const Text(
            'Valider',
            style: TextStyle(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

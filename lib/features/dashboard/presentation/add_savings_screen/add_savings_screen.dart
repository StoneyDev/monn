import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/shared/extensions/enum_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

final _savingsProvider = StateProvider.autoDispose<SavingsType?>((_) => null);

class AddSavingsScreen extends ConsumerWidget {
  const AddSavingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editSavingsControllerProvider);
    final selectedItem = ref.watch(_savingsProvider);
    final savingsType = ref.watch(
      watchSavingsProvider().select(
        (value) => value.valueOrNull?.map((saving) => saving.type) ?? [],
      ),
    );

    return Scaffold(
      appBar: MonnAppBar(title: context.tr('common.add_savings')),
      body: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: SavingsType.values.length,
        itemBuilder: (context, index) {
          final savings = SavingsType.values[index];
          final isExist = savingsType.contains(savings);

          return RadioListTile<SavingsType>(
            value: savings,
            groupValue: selectedItem,
            onChanged: isExist
                ? null
                : (value) => ref.read(_savingsProvider.notifier).state = value,
            title: Row(
              children: [
                Image(
                  image: savings.icon(),
                  height: 48,
                  width: 48,
                  opacity: AlwaysStoppedAnimation(isExist ? 0.4 : 1),
                ),
                const SizedBox(width: 16),
                Text(context.tr('savings.${savings.name.toSnakeCase()}')),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
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
      ),
    );
  }
}

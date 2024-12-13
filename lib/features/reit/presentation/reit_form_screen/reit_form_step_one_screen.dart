import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/domain/reit.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_dividend_form_controller.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/reit_form_screen.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/reit_form_step_two_screen.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/utils/app_colors.dart';

final _selectedReitProvider = StateProvider.autoDispose<Reit?>(
  (ref) => ref.read(reitDividendFormControllerProvider).reit,
);

class ReitFormStepOneScreen extends ConsumerWidget {
  const ReitFormStepOneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedReit = ref.watch(_selectedReitProvider);
    final reits = ref.watch(watchReitsProvider);

    return Scaffold(
      appBar: MonnAppBar(
        title: 'Sélectionnez une SCPI',
        onBack: () => ref.invalidate(reitDividendFormControllerProvider),
      ),
      body: switch (reits) {
        AsyncData(:final value) => ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              final item = value[index];

              return RadioListTile<int?>(
                value: item.id,
                groupValue: selectedReit?.id,
                title: Text(
                  item.name,
                  style: selectedReit?.id == item.id
                      ? const TextStyle(
                          color: AppColors.darkGray,
                          fontWeight: FontWeight.w900,
                        )
                      : null,
                ),
                onChanged: (_) =>
                    ref.read(_selectedReitProvider.notifier).state = item,
              );
            },
          ),
        AsyncError(:final error) => Text('error: $error'),
        _ => const RepaintBoundary(
            child: CircularProgressIndicator(),
          ),
      },
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            IconButton.outlined(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => const ReitFormScreen(),
                ),
              ),
              icon: iconoir.Plus(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: MonnButton(
                text: context.tr('button.validate'),
                onPressed: selectedReit != null
                    ? () {
                        ref
                            .read(reitDividendFormControllerProvider.notifier)
                            .edit(reit: ref.read(_selectedReitProvider));

                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (_) => const ReitFormStepTwoScreen(),
                          ),
                        );
                      }
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

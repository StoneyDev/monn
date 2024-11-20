import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

final _startAmountProvider = StateProvider<String?>((_) => null);

class PeaScreen extends ConsumerWidget {
  const PeaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final peaData = ref.watch(
      getSavingsProvider(type: SavingsType.pea).select(
        (data) => data.valueOrNull,
      ),
    );

    return Scaffold(
      appBar: MonnAppBar(
        title: SavingsType.pea.label,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: MonnFieldNumber(
            label: 'Montant initial',
            required: true,
            suffix: '€',
            initialValue: peaData?.startAmount.toString(),
            onChanged: (value) {
              if (value.isEmpty) return;
              ref.read(_startAmountProvider.notifier).state = value;
            },
          ),
        ),
      ),
      bottomSheet: MonnButton(
        text: context.tr('button.save'),
        onPressed: () async {
          final newValue = ref.read(_startAmountProvider);

          if (formKey.currentState!.validate() && newValue != null) {
            final newSaving = peaData?.copyWith(
              startAmount: double.parse(newValue),
            );

            final success = await ref
                .read(editSavingsControllerProvider.notifier)
                .submit(newSaving!);
            if (!context.mounted || !success) return;

            ref
              ..invalidate(_startAmountProvider)
              ..invalidate(getSavingsProvider);
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cash/presentation/add_cash_screen/controllers/cash_form_controller.dart';
import 'package:monn/features/cash/presentation/add_cash_screen/controllers/submit_cash_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/fields/monn_field_text.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class AddCashScreen extends ConsumerStatefulWidget {
  const AddCashScreen({super.key});

  @override
  ConsumerState<AddCashScreen> createState() => _AddCashScreenState();
}

class _AddCashScreenState extends ConsumerState<AddCashScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(cashFormControllerProvider, (_, __) {});

    return Scaffold(
      appBar: const MonnAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            children: [
              MonnFieldText(
                label: context.tr('common.label'),
                required: true,
                onChanged: (newLabel) => ref
                    .read(cashFormControllerProvider.notifier)
                    .label(label: newLabel),
                textInputAction: TextInputAction.next,
              ),
              MonnFieldNumber<double>(
                label: context.tr('common.worth'),
                suffix: '€',
                required: true,
                onChanged: (newValue) => ref
                    .read(cashFormControllerProvider.notifier)
                    .value(value: newValue),
                textInputAction: TextInputAction.done,
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
                  .read(submitCashFormControllerProvider.notifier)
                  .submit();

              if (!context.mounted || !success) return;
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

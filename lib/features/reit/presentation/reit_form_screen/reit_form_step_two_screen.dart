import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_dividend_form_controller.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/submit_reit_dividend_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class ReitFormStepTwoScreen extends ConsumerStatefulWidget {
  const ReitFormStepTwoScreen({super.key});

  @override
  ConsumerState<ReitFormStepTwoScreen> createState() =>
      _ReitFormStepTwoScreenState();
}

class _ReitFormStepTwoScreenState extends ConsumerState<ReitFormStepTwoScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen(reitDividendFormControllerProvider, (previous, next) {});

    return Scaffold(
      appBar: const MonnAppBar(title: 'Suivi des gains'),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              MonnFieldNumber<double>(
                label: context.tr('common.dividend'),
                suffix: '€',
                required: true,
                onChanged: (newAmount) => ref
                    .read(reitDividendFormControllerProvider.notifier)
                    .amount(amount: newAmount),
              ),
              MonnFieldDate(
                label: context.tr('common.receive_at'),
                required: true,
                onChanged: (newReceivedAt) => ref
                    .read(reitDividendFormControllerProvider.notifier)
                    .receivedAt(receivedAt: newReceivedAt),
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
                  .read(submitReitDividendFormControllerProvider.notifier)
                  .submit();
              if (!context.mounted || !success) return;

              Navigator.of(context)
                ..pop()
                ..pop();
            },
          ),
        ),
      ),
    );
  }
}

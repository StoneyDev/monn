import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/presentation/pea_form_screen/controllers/pea_form_controller.dart';
import 'package:monn/features/pea/presentation/pea_form_screen/controllers/submit_pea_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/shared/widgets/monn_error.dart';

class PeaFormScreen extends ConsumerStatefulWidget {
  const PeaFormScreen({super.key});

  @override
  ConsumerState<PeaFormScreen> createState() => _PeaFormScreenState();
}

class _PeaFormScreenState extends ConsumerState<PeaFormScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final peaData = ref.watch(getPeaProvider);
    final canSubmit = ref.watch(peaFormControllerProvider).isDirty &&
        (formKey.currentState?.validate() ?? false);

    return Scaffold(
      appBar: const MonnAppBar(),
      body: switch (peaData) {
        AsyncData(:final value) => SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                spacing: 16,
                children: [
                  MonnFieldNumber<int>(
                    label: context.tr('common.number_equities'),
                    required: true,
                    initialValue: (value?.equity ?? '').toString(),
                    onChanged: (newEquity) =>
                        ref.read(peaFormControllerProvider.notifier).equity(
                              equity: newEquity,
                              initial: value?.equity,
                            ),
                  ),
                  MonnFieldNumber<double>(
                    label: context.tr('common.purchase_price'),
                    required: true,
                    initialValue: (value?.costAverage ?? '').toString(),
                    onChanged: (newCostAverage) => ref
                        .read(peaFormControllerProvider.notifier)
                        .costAverage(
                          costAverage: newCostAverage,
                          initial: value?.costAverage,
                        ),
                  ),
                ],
              ),
            ),
          ),
        AsyncError(:final error) => Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: MonnError(message: '$error'),
            ),
          ),
        _ => const Center(
            child: RepaintBoundary(
              child: CircularProgressIndicator(),
            ),
          )
      },
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MonnButton(
            text: context.tr('button.save'),
            onPressed: canSubmit
                ? () async {
                    final success = await ref
                        .read(submitPeaFormControllerProvider.notifier)
                        .submit();
                    if (!context.mounted || !success) return;

                    ref
                      ..invalidate(getPeaProvider)
                      ..invalidate(getPayoutReportPeaProvider);
                    Navigator.pop(context);
                  }
                : null,
          ),
        ),
      ),
    );
  }
}

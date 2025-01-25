import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/pea/data/pea_repository.dart';
import 'package:monn/features/pea/presentation/pea_form_screen/controllers/pea_form_controller.dart';
import 'package:monn/features/pea/presentation/pea_form_screen/controllers/submit_pea_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class PeaFormScreen extends ConsumerWidget {
  const PeaFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final peaData = ref.watch(getPeaProvider);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: MonnAppBar(
          onBack: () => ref.invalidate(peaFormControllerProvider),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: switch (peaData) {
              AsyncData(:final value) => Column(
                  spacing: 16,
                  children: [
                    MonnFieldNumber(
                      label: 'Nombre de titre',
                      initialValue: value?.equity.toString(),
                      required: true,
                      onChanged: (value) => ref
                          .read(peaFormControllerProvider.notifier)
                          .equity(value),
                    ),
                    MonnFieldNumber(
                      label: "Prix d'achat",
                      initialValue: value?.costAverage.toString(),
                      required: true,
                      onChanged: (value) => ref
                          .read(peaFormControllerProvider.notifier)
                          .costAverage(value),
                    ),
                  ],
                ),
              AsyncError(:final error) => Text(error.toString()),
              _ => const Center(
                  child: RepaintBoundary(
                    child: CircularProgressIndicator(),
                  ),
                )
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          width: MediaQuery.sizeOf(context).width - 32,
          child: MonnButton(
            text: context.tr('button.save'),
            onPressed: () async {
              if (!(formKey.currentState?.validate() ?? false)) return;

              final success = await ref
                  .read(submitPeaFormControllerProvider.notifier)
                  .submit();
              if (!context.mounted || !success) return;

              ref
                ..invalidate(getPeaProvider)
                ..invalidate(getPayoutReportPeaProvider)
                ..invalidate(peaFormControllerProvider);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

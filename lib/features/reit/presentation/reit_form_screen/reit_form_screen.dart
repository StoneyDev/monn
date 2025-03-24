import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/dashboard/presentation/add_savings_screen/controllers/edit_savings_controller.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_form_controller.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/submit_reit_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/fields/monn_field_text.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';

class ReitFormScreen extends ConsumerStatefulWidget {
  const ReitFormScreen({super.key});

  @override
  ConsumerState<ReitFormScreen> createState() => _ReitFormScreenState();
}

class _ReitFormScreenState extends ConsumerState<ReitFormScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final reitData = ref.watch(
      getSavingsProvider(type: SavingsType.reit).select(
        (savings) => savings.valueOrNull,
      ),
    );

    return Scaffold(
      appBar: const MonnAppBar(
        title: 'Ajouter une SCPI',
      ),
      body: MonnScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    MonnFieldText(
                      label: 'Nom de la SCPI',
                      required: true,
                      provider: reitFormControllerProvider.select(
                        (form) => form.reitName,
                      ),
                      onChanged: (newName) => ref
                          .read(reitFormControllerProvider.notifier)
                          .reitName(newName),
                    ),
                    MonnFieldNumber<int>(
                      label: 'Part',
                      required: true,
                      provider: reitFormControllerProvider.select(
                        (form) => form.shares,
                      ),
                      onChanged: (newShares) => ref
                          .read(reitFormControllerProvider.notifier)
                          .shares(newShares),
                    ),
                    MonnFieldNumber<double>(
                      label: 'Prix de la part',
                      suffix: '€',
                      required: true,
                      provider: reitFormControllerProvider.select(
                        (form) => form.price,
                      ),
                      onChanged: (newPrice) => ref
                          .read(reitFormControllerProvider.notifier)
                          .price(newPrice),
                    ),
                    MonnFieldDate(
                      label: 'Acheté le',
                      required: true,
                      provider: reitFormControllerProvider.select(
                        (form) => form.boughtOn,
                      ),
                      onChanged: (newDate) => ref
                          .read(reitFormControllerProvider.notifier)
                          .boughtOn(newDate),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MonnButton(
            text: context.tr('button.validate'),
            onPressed: () async {
              if (!(formKey.currentState?.validate() ?? false)) return;

              final success = await ref
                  .read(submitReitFormControllerProvider.notifier)
                  .submit();

              final formData = ref.read(reitFormControllerProvider);

              final newSaving = reitData?.copyWith(
                startAmount: (reitData.startAmount ?? 0) +
                    (double.parse(formData.price) * int.parse(formData.shares)),
              );

              final updated = await ref
                  .read(editSavingsControllerProvider.notifier)
                  .submit(newSaving!);
              if (!context.mounted || !success || !updated) return;

              ref
                ..invalidate(watchPayoutReportReitProvider)
                ..invalidate(getSavingsProvider(type: SavingsType.reit));
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

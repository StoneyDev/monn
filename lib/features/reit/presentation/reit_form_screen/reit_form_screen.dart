import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/features/reit/data/reit_repository.dart';
import 'package:monn/features/reit/presentation/reit_form_screen/controllers/reit_form_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/domain/savings.dart';
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
    final formNotifier = ref.read(reitFormControllerProvider.notifier);

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(LocaleKeys.common_add_reit),
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
                      label: context.tr(LocaleKeys.common_reit_name),
                      required: true,
                      onChanged: (newName) =>
                          formNotifier.set(reitName: newName),
                    ),
                    MonnFieldNumber<int>(
                      label: context.tr(LocaleKeys.common_part),
                      required: true,
                      onChanged: (newShares) =>
                          formNotifier.set(shares: newShares),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.common_share_price),
                      suffix: '€',
                      required: true,
                      onChanged: (newPrice) =>
                          formNotifier.set(price: newPrice),
                    ),
                    MonnFieldDate(
                      label: context.tr(
                        LocaleKeys.common_bought_on,
                        args: [''],
                      ),
                      required: true,
                      onChanged: (newDate) =>
                          formNotifier.set(boughtOn: newDate),
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
            text: context.tr(LocaleKeys.button_validate),
            onPressed: () async {
              if (!(formKey.currentState?.validate() ?? false)) return;

              final success = await formNotifier.submit();
              if (!context.mounted || !success) return;

              ref
                ..invalidate(reitFormControllerProvider)
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

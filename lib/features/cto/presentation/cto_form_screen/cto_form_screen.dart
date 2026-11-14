import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/cto/data/cto_repository.dart';
import 'package:monn/features/cto/presentation/cto_form_screen/controllers/cto_form_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/fields/monn_field_text.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';

class CtoFormScreen extends ConsumerStatefulWidget {
  const CtoFormScreen({this.cto, super.key});

  final CtoEntry? cto;

  @override
  ConsumerState<CtoFormScreen> createState() => _CtoFormScreenState();
}

class _CtoFormScreenState extends ConsumerState<CtoFormScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final formNotifier = ref.read(ctoFormControllerProvider.notifier);
    final cto = widget.cto;

    return Scaffold(
      appBar: MonnAppBar(
        title: cto?.name ?? context.tr(LocaleKeys.common_add_etf),
      ),
      body: MonnScrollView(
        slivers: [
          SliverPadding(
            padding: const .all(16),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    MonnFieldText(
                      label: context.tr(LocaleKeys.common_etf_name),
                      required: true,
                      initialValue: cto?.name,
                      onChanged: (name) => formNotifier.set(name: name),
                    ),
                    MonnFieldText(
                      label: context.tr(LocaleKeys.common_ticker),
                      required: true,
                      initialValue: cto?.symbol,
                      onChanged: (symbol) => formNotifier.set(symbol: symbol),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(LocaleKeys.common_number_equities),
                      required: true,
                      initialValue: cto?.quantity.toString(),
                      onChanged: (quantity) =>
                          formNotifier.set(quantity: quantity),
                    ),
                    MonnFieldNumber<double>(
                      label: context.tr(
                        LocaleKeys.common_average_purchase_price,
                      ),
                      suffix: '€',
                      required: true,
                      initialValue: cto?.costAverage.toString(),
                      onChanged: (costAverage) =>
                          formNotifier.set(costAverage: costAverage),
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
          padding: const .all(16),
          child: MonnButton(
            text: context.tr(LocaleKeys.button_validate),
            onPressed: () async {
              if (!(formKey.currentState?.validate() ?? false)) return;

              final success = await formNotifier.submit();
              if (!context.mounted || !success) return;

              ref
                ..invalidate(ctoFormControllerProvider)
                ..invalidate(refreshCtoPricesProvider);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/cash/data/cash_repository.dart';
import 'package:monn/features/cash/domain/cash.dart';
import 'package:monn/features/cash/presentation/add_cash_screen/add_cash_screen.dart';
import 'package:monn/features/cash/presentation/add_cash_screen/controllers/cash_form_controller.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class CashScreen extends ConsumerWidget {
  const CashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final cashs = ref.watch(watchCashsProvider);
    final report = ref.watch(
      watchPayoutReportCashProvider.select((data) => data.value),
    );

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr('savings.${SavingsType.cash.name.toSnakeCase()}'),
      ),
      floatingActionButton: IconButton.filled(
        icon: iconoir.Plus(color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (_) => const AddCashScreen()),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            (report?.finalAmount ?? 0).simpleCurrency(locale),
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 14),
          switch (cashs) {
            AsyncData(:final value) => Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
                itemBuilder: (_, index) => _CashCard(value[index]),
                separatorBuilder: (_, _) => const SizedBox(height: 16),
                itemCount: value.length,
                cacheExtent: 250,
              ),
            ),
            AsyncError(:final error) => Text(
              'Error: $error',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            _ => const Center(
              child: RepaintBoundary(child: CircularProgressIndicator()),
            ),
          },
        ],
      ),
    );
  }
}

class _CashCard extends ConsumerWidget {
  const _CashCard(this.cash);

  final Cash cash;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();

    return MonnCard(
      onLongPress: () => WoltModalSheet.show<void>(
        context: context,
        modalTypeBuilder: (_) => WoltModalType.alertDialog(),
        pageListBuilder: (context) => [
          MonnBottomSheet.warningDialog(
            context: context,
            title: cash.label.toUpperCase(),
            sliver: SliverToBoxAdapter(
              child: Column(
                spacing: 8,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Center(
                      child: Text(context.tr(LocaleKeys.button_close)),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      await ref.read(deleteCashProvider(cash.id).future);

                      if (!context.mounted) return;
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(context.tr(LocaleKeys.button_ok)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () => context.push(
        fullscreenDialog: true,
        AmountScreen(
          initialValue: cash.value,
          onSubmit: () async {
            final success = await ref
                .read(cashFormControllerProvider.notifier)
                .submit();

            if (!context.mounted || !success) return;

            ref.invalidate(cashFormControllerProvider);
            Navigator.pop(context);
          },
          onChanged: (newAmount) {
            ref
                .read(cashFormControllerProvider.notifier)
                .set(
                  id: cash.id,
                  label: cash.label,
                  value: newAmount,
                );
          },
        ),
      ),
      child: Row(
        spacing: 16,
        children: [
          Expanded(
            child: Text(
              cash.label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: Text(
              cash.value.simpleCurrency(locale),
              textAlign: TextAlign.right,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

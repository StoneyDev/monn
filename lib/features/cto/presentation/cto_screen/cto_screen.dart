import 'package:drift/drift.dart' show Value;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/cto/data/cto_repository.dart';
import 'package:monn/features/cto/presentation/cto_form_screen/controllers/cto_form_controller.dart';
import 'package:monn/features/cto/presentation/cto_form_screen/cto_form_screen.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/features/portfolio/presentation/controllers/edit_savings_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/domain/savings.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/local/database.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_financial_info.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/shared/widgets/payout_report.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final _startAmountProvider = StateProvider<String>((_) => '');

class CtoScreen extends ConsumerWidget {
  const CtoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final savingsCto = ref.watch(getSavingsProvider(type: .cto));
    final ctos = ref.watch(watchCtosProvider);
    final report = ref.watch(watchPayoutReportCtoProvider).value;

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr('savings.${SavingsType.cto.name.toSnakeCase()}'),
      ),
      floatingActionButton: IconButton.filled(
        icon: iconoir.Plus(color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () async {
          ref.invalidate(ctoFormControllerProvider);
          await context.push<void>(const CtoFormScreen());
        },
      ),
      body: MonnScrollView(
        slivers: [
          SliverPadding(
            padding: const .only(top: 20),
            sliver: SliverToBoxAdapter(
              child: Column(
                spacing: 16,
                children: [
                  Column(
                    children: [
                      Text(
                        (report?.finalAmount ?? 0).simpleCurrency(locale),
                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(fontWeight: .w900),
                      ),
                      switch (savingsCto) {
                        AsyncData(:final value) => OutlinedButton(
                          child: Text(
                            (value?.startAmount ?? 0).simpleCurrency(locale),
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: AppColors.lightGray),
                          ),
                          onPressed: () => context.push<void>(
                            fullscreenDialog: true,
                            AmountScreen(
                              initialValue: value?.startAmount ?? 0,
                              onChanged: (value) =>
                                  ref
                                          .read(_startAmountProvider.notifier)
                                          .state =
                                      value,
                              onSubmit: () async {
                                final newValue = ref.read(_startAmountProvider);
                                final newSaving = SavingsEntriesCompanion(
                                  id: .absentIfNull(value?.id),
                                  type: Value(SavingsType.cto.name),
                                  startAmount: Value(.parse(newValue)),
                                );

                                final success = await ref
                                    .read(
                                      editSavingsControllerProvider.notifier,
                                    )
                                    .submit(newSaving);
                                if (!context.mounted || !success) return;

                                ref
                                  ..invalidate(_startAmountProvider)
                                  ..invalidate(getSavingsProvider(type: .cto));
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        _ => const SizedBox.shrink(),
                      },
                    ],
                  ),
                  PayoutReport(netProfit: report?.totalNetProfit ?? 0),
                ],
              ),
            ),
          ),
          switch (ctos) {
            AsyncData(:final value) => SliverPadding(
              padding: const .fromLTRB(16, 24, 16, 96),
              sliver: SliverList.separated(
                itemCount: value.length,
                itemBuilder: (_, index) => _CtoCard(value[index]),
                separatorBuilder: (_, _) => const SizedBox(height: 16),
              ),
            ),
            AsyncError(:final error) => SliverToBoxAdapter(
              child: Text('error: $error'),
            ),
            _ => const SliverToBoxAdapter(
              child: Center(
                child: RepaintBoundary(child: CircularProgressIndicator()),
              ),
            ),
          },
        ],
      ),
    );
  }
}

class _CtoCard extends ConsumerWidget {
  const _CtoCard(this.cto);

  final CtoEntry cto;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final refresh = ref.watch(refreshCtoPricesProvider);
    final quotedAt = cto.lastPrice != null ? cto.lastUpdate : null;
    final currentPrice = cto.lastPrice ?? cto.costAverage;
    final latentValue = cto.quantity * (currentPrice - cto.costAverage);
    final smallGray = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: AppColors.lightGray);

    return MonnCard(
      onTap: () async {
        ref
            .read(ctoFormControllerProvider.notifier)
            .set(
              id: cto.id,
              name: cto.name,
              symbol: cto.symbol,
              quantity: cto.quantity.toString(),
              costAverage: cto.costAverage.toString(),
            );
        await context.push<void>(CtoFormScreen(cto: cto));
      },
      onLongPress: () => WoltModalSheet.show<void>(
        context: context,
        barrierDismissible: false,
        modalTypeBuilder: (_) => .alertDialog(),
        pageListBuilder: (dialog) => [
          MonnBottomSheet.warningDialog(
            context: dialog,
            title: cto.name,
            onConfirm: () => ref.read(ctoRepositoryProvider).deleteCto(cto.id),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: .start,
        spacing: 8,
        children: [
          Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: Text(
                      cto.name.toUpperCase(),
                      maxLines: 1,
                      overflow: .ellipsis,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.lightGray,
                        fontWeight: .bold,
                      ),
                    ),
                  ),
                  Text(cto.symbol, style: smallGray),
                ],
              ),
              Text(
                (cto.quantity * currentPrice).simpleCurrency(locale),
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: .w900),
              ),
            ],
          ),
          Wrap(
            spacing: 24,
            runSpacing: 8,
            children: [
              MonnFinancialInfo(
                title: context.tr(LocaleKeys.common_part),
                data: cto.quantity.toDecimal(locale: locale),
              ),
              MonnFinancialInfo(
                title: context.tr(LocaleKeys.common_purchase_price),
                data: cto.costAverage,
              ),
              MonnFinancialInfo(
                title: context.tr(LocaleKeys.common_current_price),
                data: currentPrice,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: .spaceBetween,
            spacing: 8,
            children: [
              Flexible(
                child: Text(
                  latentValue.simpleCurrency(locale),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: .bold,
                    color: latentValue.isNegative
                        ? context.negativeColor
                        : context.positiveColor,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  quotedAt?.slashFormat(locale, withHour: true) ??
                      switch (refresh) {
                        AsyncError() => context.tr(LocaleKeys.common_api_error),
                        AsyncLoading() => context.tr(LocaleKeys.common_loading),
                        _ => '-',
                      },
                  textAlign: .right,
                  style: smallGray,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

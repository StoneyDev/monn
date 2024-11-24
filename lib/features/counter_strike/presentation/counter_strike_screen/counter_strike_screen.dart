// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/features/counter_strike/presentation/add_counter_strike_screen/add_counter_strike_screen.dart';
import 'package:monn/features/counter_strike/presentation/add_counter_strike_screen/controllers/submit_counter_strike_form_controller.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/dialogs/monn_dialog.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final _currentValueProvider = StateProvider<String?>((_) => null);

class CounterStrikeScreen extends ConsumerWidget {
  const CounterStrikeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crowdfundings = ref.watch(watchCounterStrikesProvider);
    final report = ref.watch(
      watchPayoutReportCounterStrikeProvider.select(
        (data) => data.valueOrNull,
      ),
    );

    return Scaffold(
      appBar: MonnAppBar(title: SavingsType.csknives.label),
      floatingActionButton: IconButton.filled(
        icon: const iconoir.Plus(color: AppColors.white),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const AddCounterStrikeScreen(),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            (report?.finalAmount ?? 0).simpleCurrency(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w900,
                ),
          ),
          Text(
            (report?.totalNetProfit ?? 0).simpleCurrency(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.lightGray,
                ),
          ),
          const SizedBox(height: 14),
          switch (crowdfundings) {
            AsyncData(:final value) => Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  itemBuilder: (_, index) => _CounterStrikeItem(value[index]),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: value.length,
                ),
              ),
            AsyncError(:final error) => Text('error: $error'),
            _ => const RepaintBoundary(
                child: CircularProgressIndicator(),
              ),
          },
        ],
      ),
    );
  }
}

class _CounterStrikeItem extends ConsumerWidget {
  const _CounterStrikeItem(this.data);

  final CounterStrike data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      onTap: () => WoltModalSheet.show<void>(
        context: context,
        barrierDismissible: true,
        modalTypeBuilder: (_) => WoltModalType.dialog(),
        pageListBuilder: (context) => [
          MonnDialog.amount(
            context: context,
            formKey: formKey,
            onChanged: (value) {
              if (value.isEmpty) return;
              ref.read(_currentValueProvider.notifier).state = value;
            },
            onSubmit: () async {
              if (!formKey.currentState!.validate()) return;

              final success = await ref
                  .read(
                    submitCounterStrikeFormControllerProvider.notifier,
                  )
                  .submitNewCurrentValue(
                    data.copyWith(
                      lastUpdate: DateTime.now(),
                      currentValue:
                          double.parse(ref.read(_currentValueProvider)!),
                    ),
                  );

              if (!context.mounted || !success) return;

              ref.invalidate(_currentValueProvider);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.extraLightGray),
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Badge.count(
                    count: data.quantity,
                    backgroundColor: AppColors.darkGray,
                    child: SizedBox(
                      height: 64,
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: AppColors.extraExtraLightGray,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Image.network(
                            'https://community.cloudflare.steamstatic.com/economy/image/class/730/${data.imageId}/256x128',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data.name}${data.wear != null ? ' | ${data.wear!}' : ''}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.lightGray,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        Row(
                          children: [
                            Text(
                              data.purchaseValue.simpleCurrency(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: AppColors.darkGray,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            const SizedBox(width: 8),
                            if (data.currentValue > data.purchaseValue)
                              const iconoir.ArrowUpCircleSolid(
                                color: AppColors.success,
                                height: 16,
                                width: 16,
                              )
                            else if (data.currentValue < data.purchaseValue)
                              const iconoir.ArrowDownCircleSolid(
                                color: AppColors.error,
                                height: 16,
                                width: 16,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(color: AppColors.extraLightGray),
              Text(
                '${data.currentValue.simpleCurrency()} le ${data.lastUpdate.slashFormat()}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.lightGray,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: lines_longer_than_80_chars .

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/counter_strike/data/counter_strike_repository.dart';
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/features/counter_strike/presentation/add_counter_strike_screen/add_counter_strike_screen.dart';
import 'package:monn/features/counter_strike/presentation/add_counter_strike_screen/controllers/submit_counter_strike_form_controller.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/enum_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/utils/app_colors.dart';

final _currentValueProvider = StateProvider<String>((_) => '');

class CounterStrikeScreen extends ConsumerWidget {
  const CounterStrikeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final counterStrikes = ref.watch(watchCounterStrikesProvider);
    final report = ref.watch(
      watchPayoutReportCounterStrikeProvider.select(
        (data) => data.valueOrNull,
      ),
    );

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(
          'savings.${SavingsType.csKnives.name.toSnakeCase()}',
        ),
      ),
      floatingActionButton: IconButton.filled(
        icon: iconoir.Plus(color: Theme.of(context).colorScheme.onPrimary),
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
            (report?.finalAmount ?? 0).simpleCurrency(locale),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
          ),
          OutlinedButton(
            onPressed: null,
            child: Text(
              (report?.totalNetProfit ?? 0).simpleCurrency(locale),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.lightGray,
                  ),
            ),
          ),
          const SizedBox(height: 32),
          Divider(
            color: Theme.of(context).colorScheme.outline,
            height: 0,
          ),
          switch (counterStrikes) {
            AsyncData(:final value) => Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
                  itemBuilder: (_, index) => _CounterStrikeItem(value[index]),
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemCount: value.length,
                  cacheExtent: 250,
                ),
              ),
            AsyncError(:final error) => Text(
                'Error: $error',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            _ => const Center(
                child: RepaintBoundary(
                  child: CircularProgressIndicator(),
                ),
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
    final locale = context.locale.toString();

    return MonnCard(
      child: Column(
        children: [
          Row(
            children: [
              Badge.count(
                count: int.parse('${data.quantity}'),
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: SizedBox(
                  height: 64,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: data.imageId.image(),
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.imageId.label}${data.wear != null ? ' | ${data.wear!}' : ''}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Row(
                      children: [
                        Text(
                          data.purchaseValue.simpleCurrency(locale),
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                        const SizedBox(width: 4),
                        if (data.currentValue > data.purchaseValue)
                          const iconoir.ArrowUpCircleSolid(
                            color: AppColors.green,
                            height: 16,
                            width: 16,
                          )
                        else if (data.currentValue < data.purchaseValue)
                          const iconoir.ArrowDownCircleSolid(
                            color: AppColors.red,
                            height: 16,
                            width: 16,
                          ),
                        const SizedBox(width: 4),
                        percentageValue(),
                      ],
                    ),
                    Text(
                      context.tr(
                        'common.bought_on',
                        args: [data.boughtAt.slashFormat(locale)],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.lightGray),
                    ),
                    Text(
                      context.tr(
                        'common.price_and_purchase_date',
                        args: [
                          data.currentValue.simpleCurrency(locale),
                          data.lastUpdate.slashFormat(locale),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: AppColors.lightGray),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      onTap: () => context.push(
        AmountScreen(
          initialValue: data.currentValue,
          onSubmit: () async {
            final success = await ref
                .read(submitCounterStrikeFormControllerProvider.notifier)
                .submitNewCurrentValue(
                  data.copyWith(
                    lastUpdate: DateTime.now(),
                    currentValue: double.parse(
                      ref.read(_currentValueProvider)!,
                    ),
                  ),
                );
            if (!context.mounted || !success) return;

            ref.invalidate(_currentValueProvider);
            Navigator.pop(context);
          },
          onChanged: (value) =>
              ref.read(_currentValueProvider.notifier).state = value,
        ),
      ),
    );
  }

  Widget percentageValue() {
    final purchaseValue = data.purchaseValue;
    final currentValue = data.currentValue;
    final change = ((purchaseValue - currentValue) / purchaseValue) * 100;

    return Text(
      '${change.abs().toStringAsFixed(2)}%',
      style: TextStyle(
        color: change.isNegative ? AppColors.green : AppColors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

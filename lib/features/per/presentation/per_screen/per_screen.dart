import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/per/data/per_repository.dart';
import 'package:monn/features/per/domain/per.dart';
import 'package:monn/features/per/presentation/per_screen/controllers/per_form_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';
import 'package:monn/utils/app_colors.dart';

class PerScreen extends ConsumerWidget {
  const PerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final per = ref.watch(watchPerProvider);
    final report = ref.watch(
      watchPayoutReportPerProvider.select((data) => data.value),
    );

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(LocaleKeys.savings_per),
      ),
      body: MonnScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),
              Text(
                (report?.finalAmount ?? 0).simpleCurrency(locale),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
              switch (per) {
                AsyncData(:final value) => Column(
                  spacing: 24,
                  children: [
                    Center(
                      child: OutlinedButton(
                        child: Text(
                          (value?.invested ?? 0).simpleCurrency(locale),
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.lightGray),
                        ),
                        onPressed: () => _openInvestedAmountScreen(
                          context: context,
                          ref: ref,
                          value: value,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: MonnCard(
                        onTap: () => _openInterestsAmountScreen(
                          context: context,
                          ref: ref,
                          value: value,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                context.tr(LocaleKeys.common_interests),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Text(
                              (value?.interests ?? 0).simpleCurrency(locale),
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                AsyncError(:final error) => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Error: $error',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
                _ => const Center(
                  child: Padding(
                    padding: EdgeInsets.all(32),
                    child: RepaintBoundary(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              },
              const SizedBox(height: 48),
            ]),
          ),
        ],
      ),
    );
  }

  void _openInvestedAmountScreen({
    required BuildContext context,
    required WidgetRef ref,
    required Per? value,
  }) {
    final formNotifier = ref.read(perFormControllerProvider.notifier);

    unawaited(
      context.push(
        fullscreenDialog: true,
        AmountScreen(
          initialValue: value?.invested ?? 0,
          onSubmit: () async {
            final success = await formNotifier.submit();

            if (!context.mounted || !success) return;

            ref.invalidate(perFormControllerProvider);
            Navigator.pop(context);
          },
          onChanged: (newAmount) {
            formNotifier.set(
              invested: newAmount,
              interests: (value?.interests ?? 0).toString(),
            );
          },
        ),
      ),
    );
  }

  void _openInterestsAmountScreen({
    required BuildContext context,
    required WidgetRef ref,
    required Per? value,
  }) {
    final formNotifier = ref.read(perFormControllerProvider.notifier);

    unawaited(
      context.push(
        fullscreenDialog: true,
        AmountScreen(
          initialValue: value?.interests ?? 0,
          onSubmit: () async {
            final success = await formNotifier.submit();

            if (!context.mounted || !success) return;

            ref.invalidate(perFormControllerProvider);
            Navigator.pop(context);
          },
          onChanged: (newAmount) {
            formNotifier.set(
              interests: newAmount,
              invested: (value?.invested ?? 0).toString(),
            );
          },
        ),
      ),
    );
  }
}

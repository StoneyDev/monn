import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/amount/presentation/amount_screen.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/savings_book_form_screen.dart';
import 'package:monn/features/savings_book/presentation/savings_book_screen/controllers/savings_book_interest_form_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/context_ui.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/extensions/string_ui.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_card.dart';
import 'package:monn/shared/widgets/monn_financial_info.dart';
import 'package:monn/utils/app_colors.dart';

class SavingsBookScreen extends ConsumerWidget {
  const SavingsBookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale.toString();
    final savingsBooks = ref.watch(watchSavingsBooksProvider);
    final report = ref.watch(
      watchPayoutReportSavingsBookProvider.select((data) => data.value),
    );

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr(
          'savings.${SavingsType.savingsBook.name.toSnakeCase()}',
        ),
      ),
      floatingActionButton: IconButton.filled(
        icon: iconoir.Plus(color: Theme.of(context).colorScheme.onPrimary),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (_) => const SavingsBookFormScreen(),
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
          const SizedBox(height: 16),
          switch (savingsBooks) {
            AsyncData(:final value) => Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 48),
                itemBuilder: (_, index) {
                  final item = value[index];
                  final netValue =
                      (item.startAmount + item.interests) - item.withdrawal;

                  return MonnCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name.toUpperCase(),
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(
                                color: AppColors.lightGray,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          netValue.simpleCurrency(locale),
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                        const Divider(),
                        Row(
                          spacing: 24,
                          children: [
                            MonnFinancialInfo(
                              title: context.tr(
                                LocaleKeys.common_total_interest,
                              ),
                              data: item.interests,
                            ),
                            MonnFinancialInfo(
                              title: context.tr(LocaleKeys.common_withdrawal),
                              data: item.withdrawal,
                            ),
                          ],
                        ),
                      ],
                    ),
                    onTap: () async {
                      ref
                          .read(
                            savingsBookInterestFormControllerProvider.notifier,
                          )
                          .set(savingsBook: item);

                      await context.push(
                        fullscreenDialog: true,
                        AmountScreen(
                          onChanged: (value) => ref
                              .read(
                                savingsBookInterestFormControllerProvider
                                    .notifier,
                              )
                              .set(amount: value),
                          onSubmit: () async {
                            final success = await ref
                                .read(
                                  savingsBookInterestFormControllerProvider
                                      .notifier,
                                )
                                .submit();
                            if (!context.mounted || !success) return;

                            ref.invalidate(
                              savingsBookInterestFormControllerProvider,
                            );
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(height: 16),
                itemCount: value.length,
                cacheExtent: 250,
              ),
            ),
            AsyncError(:final error) => Text('Error: $error'),
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

// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/dashboard/data/savings_repository.dart';
import 'package:monn/features/dashboard/domain/savings.dart';
import 'package:monn/features/savings_book/data/savings_book_repository.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/savings_book_form_screen.dart';
import 'package:monn/features/savings_book/presentation/savings_book_screen/controllers/submit_savings_book_interest_form_controller.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/dialogs/moon_dialog.dart';
import 'package:monn/shared/widgets/moon_app_bar.dart';
import 'package:monn/shared/widgets/moon_card.dart';
import 'package:monn/shared/widgets/moon_financial_info.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

final newInterestProvider = StateProvider<String?>((_) => null);

class SavingsBookScreen extends ConsumerWidget {
  const SavingsBookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final savingsBookData = ref
        .watch(watchSavingProvider(type: SavingsType.savingsBook))
        .valueOrNull;
    final savingsBooks = ref.watch(watchSavingsBooksProvider);
    final report = ref.watch(
      watchPayoutReportSavingsBookProvider.select((data) => data.valueOrNull),
    );

    return Scaffold(
      appBar: MoonAppBar(title: SavingsType.savingsBook.label),
      floatingActionButton: IconButton.filled(
        icon: const iconoir.Plus(color: AppColors.white),
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
            (report?.finalAmount ?? 0).simpleCurrency(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.darkGray,
                  fontWeight: FontWeight.w900,
                ),
          ),
          Text(
            (savingsBookData?.startAmount ?? 0).simpleCurrency(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.lightGray,
                ),
          ),
          const SizedBox(height: 16),
          switch (savingsBooks) {
            AsyncData(:final value) => Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 32,
                  ),
                  itemBuilder: (_, index) {
                    final item = value[index];

                    return MoonCard(
                      title: Text(
                        item.name.toUpperCase(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColors.lightGray,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      amount: Text(
                        ((item.startAmount + item.interests) - item.withdrawal)
                            .simpleCurrency(),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                      children: [
                        MoonFinancialInfo(
                          title: 'Vers. ini.',
                          data: item.startAmount,
                        ),
                        const SizedBox(width: 24),
                        MoonFinancialInfo(
                          title: 'Intérêts totaux',
                          data: item.interests,
                        ),
                        const SizedBox(width: 24),
                        MoonFinancialInfo(
                          title: 'Retrait',
                          data: item.withdrawal,
                        ),
                      ],
                      onTap: () => WoltModalSheet.show<void>(
                        context: context,
                        barrierDismissible: true,
                        modalTypeBuilder: (_) => WoltModalType.dialog(),
                        pageListBuilder: (context) => [
                          MoonDialog.amount(
                            context: context,
                            formKey: formKey,
                            onChanged: (value) {
                              if (value.isEmpty) return;
                              ref.read(newInterestProvider.notifier).state =
                                  value;
                            },
                            onSubmit: () async {
                              if (!formKey.currentState!.validate()) return;

                              final success = await ref
                                  .read(
                                    submitSavingsBookInterestFormControllerProvider
                                        .notifier,
                                  )
                                  .submit(
                                    savingsBook: item,
                                    amount: double.parse(
                                      ref.read(newInterestProvider)!,
                                    ),
                                  );

                              if (!context.mounted || !success) return;

                              ref.invalidate(newInterestProvider);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
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

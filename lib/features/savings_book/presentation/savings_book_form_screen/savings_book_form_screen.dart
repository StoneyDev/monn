import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/portfolio/data/savings_repository.dart';
import 'package:monn/features/savings_book/presentation/savings_book_form_screen/controllers/savings_book_form_controller.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/fields/monn_field_text.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class SavingsBookFormScreen extends ConsumerStatefulWidget {
  const SavingsBookFormScreen({super.key});

  @override
  ConsumerState<SavingsBookFormScreen> createState() =>
      _SavingsBookFormScreenState();
}

class _SavingsBookFormScreenState extends ConsumerState<SavingsBookFormScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: MonnAppBar(
      title: context.tr(LocaleKeys.common_add_savings_book),
    ),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          spacing: 16,
          children: [
            MonnFieldText(
              label: context.tr(LocaleKeys.common_savings_book_name),
              required: true,
              onChanged: (newName) => ref
                  .read(savingsBookFormControllerProvider.notifier)
                  .set(name: newName),
            ),
            MonnFieldNumber<double>(
              label: context.tr(LocaleKeys.common_start_amount),
              suffix: '\u20ac',
              required: true,
              onChanged: (newStartAmount) => ref
                  .read(savingsBookFormControllerProvider.notifier)
                  .set(startAmount: newStartAmount),
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: SafeArea(
      child: Padding(
        padding: const .all(16),
        child: MonnButton(
          text: context.tr(LocaleKeys.button_validate),
          onPressed: () async {
            if (!(formKey.currentState?.validate() ?? false)) return;

            final success = await ref
                .read(savingsBookFormControllerProvider.notifier)
                .submit();
            if (!context.mounted || !success) return;

            ref
              ..invalidate(savingsBookFormControllerProvider)
              ..invalidate(getSavingsProvider(type: .savingsBook));
            Navigator.pop(context);
          },
        ),
      ),
    ),
  );
}

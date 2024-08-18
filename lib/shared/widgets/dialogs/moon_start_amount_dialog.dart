import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/shared/widgets/moon_button.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MoonDialog {
  const MoonDialog._();

  static WoltModalSheetPage startAmount({
    required BuildContext context,
    required GlobalKey<FormState> formKey,
    String? initialValue,
    void Function(String)? onChanged,
    void Function()? onSubmit,
  }) {
    return WoltModalSheetPage(
      trailingNavBarWidget: Padding(
        padding: const EdgeInsetsDirectional.only(end: 16),
        child: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const iconoir.Xmark(),
        ),
      ),
      pageTitle: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              context.tr('start_amount'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.lightGray,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: TextFormField(
                initialValue: initialValue,
                decoration: const InputDecoration(
                  errorMaxLines: 2,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final amount = double.tryParse(value ?? '');

                  if (value == null || value.isEmpty) {
                    return context.tr('input.error.empty');
                  } else if (amount == null) {
                    return context.tr('input.error.wrong_data');
                  }

                  return null;
                },
                onChanged: onChanged,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.darkGray,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: MoonButton(
          text: context.tr('button.validate'),
          onPressed: onSubmit,
        ),
      ),
    );
  }
}

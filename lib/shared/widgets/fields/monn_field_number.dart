import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/global_theme_data.dart';

class MonnFieldNumber extends StatelessWidget {
  const MonnFieldNumber({
    required this.label,
    this.suffix,
    this.required = false,
    this.initialValue,
    this.onChanged,
    super.key,
  });

  final String label;
  final String? suffix;
  final bool required;
  final String? initialValue;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.lightGray,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          decoration: GlobalThemeData.inputDecoration(context).copyWith(
            errorMaxLines: 2,
            suffix: suffix != null
                ? Text(
                    suffix!,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  )
                : null,
          ),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: required
              ? (value) {
                  final amount = double.tryParse(value ?? '');

                  if (value == null || value.isEmpty) {
                    return context.tr('input.error.empty');
                  } else if (amount == null) {
                    return context.tr('input.error.wrong_data');
                  } else if (amount > 100 && suffix == '%') {
                    return context.tr('input.error.wrong_percentage');
                  }

                  return null;
                }
              : null,
          onChanged: onChanged,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
      ],
    );
  }
}

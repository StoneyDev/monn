import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/global_theme_data.dart';

class MonnFieldText extends StatelessWidget {
  const MonnFieldText({
    required this.label,
    this.initialValue,
    this.required = false,
    this.onChanged,
    this.textInputAction,
    super.key,
  });

  final String label;
  final String? initialValue;
  final bool required;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
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
        TextFormField(
          initialValue: initialValue,
          autovalidateMode:
              required ? AutovalidateMode.onUserInteraction : null,
          textInputAction: textInputAction,
          decoration: GlobalThemeData.inputDecoration(context),
          onChanged: onChanged,
          autocorrect: false,
          validator: required
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return context.tr('input.error.empty');
                  }

                  return null;
                }
              : null,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
      ],
    );
  }
}

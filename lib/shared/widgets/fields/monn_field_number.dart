import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/global_theme_data.dart';

class MonnFieldNumber<T> extends ConsumerWidget {
  const MonnFieldNumber({
    required this.label,
    this.initialValue,
    this.suffix,
    this.required = false,
    this.autofocus = false,
    this.onChanged,
    this.textInputAction,
    super.key,
  });

  final String label;
  final String? suffix;
  final String? initialValue;
  final bool required;
  final bool autofocus;

  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
          autofocus: autofocus,
          autovalidateMode: required
              ? AutovalidateMode.onUserInteraction
              : null,
          textInputAction: textInputAction,
          decoration: GlobalThemeData.inputDecoration(context).copyWith(
            suffix: suffix != null
                ? Text(
                    suffix!,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  )
                : null,
          ),
          keyboardType: TextInputType.numberWithOptions(
            signed: Platform.isIOS,
            decimal: T == double,
          ),
          validator: required
              ? (value) {
                  final amount = double.tryParse(value ?? '');

                  if (value == null || value.isEmpty) {
                    return context.tr('input.error.empty');
                  } else if (amount == null) {
                    return context.tr('input.error.wrong_data');
                  } else if (amount <= 0 && !amount.isNegative) {
                    return context.tr('input.error.superior');
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

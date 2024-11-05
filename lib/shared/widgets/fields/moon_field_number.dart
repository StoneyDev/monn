import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/utils/app_colors.dart';

class MoonFieldNumber extends StatelessWidget {
  const MoonFieldNumber({
    required this.label,
    required this.suffix,
    this.required = false,
    this.initialValue,
    this.onChanged,
    super.key,
  });

  final String label;
  final String suffix;
  final bool required;
  final String? initialValue;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.extraLightGray),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: initialValue,
              decoration: InputDecoration(
                errorMaxLines: 2,
                suffix: Text(
                  suffix,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.darkGray,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              keyboardType: TextInputType.number,
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
                    color: AppColors.darkGray,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/utils/app_colors.dart';

class MoonFieldText extends StatelessWidget {
  const MoonFieldText({
    required this.label,
    this.required = false,
    this.initialValue,
    this.onChanged,
    super.key,
  });

  final String label;
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
              decoration: const InputDecoration(
                errorMaxLines: 2,
              ),
              onChanged: onChanged,
              validator: required
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        return context.tr('input.error.empty');
                      }

                      return null;
                    }
                  : null,
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

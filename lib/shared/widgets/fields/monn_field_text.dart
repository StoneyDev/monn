import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/global_theme_data.dart';

class MonnFieldText extends ConsumerStatefulWidget {
  const MonnFieldText({
    required this.label,
    required this.provider,
    this.required = false,
    this.initialValue,
    this.onChanged,
    this.textInputAction,
    super.key,
  });

  final String label;
  final bool required;
  final String? initialValue;
  final ProviderListenable<String?> provider;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;

  @override
  ConsumerState<MonnFieldText> createState() => _MonnFieldTextState();
}

class _MonnFieldTextState extends ConsumerState<MonnFieldText> {
  late final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(widget.provider, (prev, next) {
      _controller.text = next.toString();
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            widget.label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.lightGray,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: widget.initialValue,
          autovalidateMode:
              widget.required ? AutovalidateMode.onUserInteraction : null,
          textInputAction: widget.textInputAction,
          decoration: GlobalThemeData.inputDecoration(context),
          onChanged: widget.onChanged,
          validator: widget.required
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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/global_theme_data.dart';

class MonnFieldDate extends ConsumerStatefulWidget {
  const MonnFieldDate({
    required this.label,
    required this.onChanged,
    this.initialValue,
    this.required = false,
    super.key,
  });

  final String label;
  final DateTime? initialValue;
  final bool required;
  final void Function(DateTime) onChanged;

  @override
  ConsumerState<MonnFieldDate> createState() => _MoonFieldDateState();
}

class _MoonFieldDateState extends ConsumerState<MonnFieldDate> {
  late final TextEditingController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = TextEditingController(
      text: widget.initialValue?.slashFormat(context.locale.toString()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
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
        TextFormField(
          controller: _controller,
          autovalidateMode:
              widget.required ? AutovalidateMode.onUserInteraction : null,
          readOnly: true,
          decoration: GlobalThemeData.inputDecoration(context),
          onTap: () async {
            final now = DateTime.now();
            final result = await showDatePicker(
              context: context,
              firstDate: DateTime(1970),
              initialDate: _controller.text.isEmpty
                  ? now
                  : DateFormat.yMd(locale).parse(_controller.text),
              locale: context.locale,
              lastDate: DateTime(now.year + 2),
            );

            if (result != null) {
              _controller.text = result.slashFormat(locale);
              widget.onChanged(result);
            }
          },
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

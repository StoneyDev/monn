import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/utils/app_colors.dart';

class MonnFieldDate extends ConsumerStatefulWidget {
  const MonnFieldDate({
    required this.label,
    required this.onChanged,
    required this.locale,
    this.required = false,
    this.initialValue,
    super.key,
  });

  final String label;
  final String locale;
  final DateTime? initialValue;
  final bool required;
  final void Function(DateTime) onChanged;

  @override
  ConsumerState<MonnFieldDate> createState() => _MoonFieldDateState();
}

class _MoonFieldDateState extends ConsumerState<MonnFieldDate> {
  late final TextEditingController _dateController;

  @override
  void initState() {
    super.initState();

    _dateController = TextEditingController(
      text: widget.initialValue?.slashFormat(widget.locale),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray300),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _dateController,
              readOnly: true,
              onTap: () async {
                final result = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1970),
                  initialDate: DateTime.now(),
                  lastDate: DateTime(DateTime.now().year + 2),
                );

                if (result != null) {
                  _dateController.text = result.slashFormat(widget.locale);
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
        ),
      ),
    );
  }
}

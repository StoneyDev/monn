import 'package:flutter/material.dart';
import 'package:monn/shared/extensions/date_ui.dart';
import 'package:monn/utils/app_colors.dart';

class MoonFieldDate extends StatefulWidget {
  const MoonFieldDate({
    required this.label,
    required this.onChanged,
    super.key,
  });

  final String label;
  final void Function(DateTime) onChanged;

  @override
  State<MoonFieldDate> createState() => _MoonFieldDateState();
}

class _MoonFieldDateState extends State<MoonFieldDate> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final now = DateTime.now();
    controller.text = now.slashFormat();
    widget.onChanged(now);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

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
              widget.label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: controller,
              readOnly: true,
              onTap: () async {
                final result = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1970),
                  lastDate: DateTime(DateTime.now().year + 1, 12, 31),
                );

                if (result != null) {
                  controller.text = result.slashFormat();
                  widget.onChanged(result);
                }
              },
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

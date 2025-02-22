import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/global_theme_data.dart';

class MonnFieldNumber<T> extends ConsumerStatefulWidget {
  const MonnFieldNumber({
    required this.label,
    required this.provider,
    this.suffix,
    this.required = false,
    this.autofocus = false,
    this.onChanged,
    super.key,
  });

  final String label;
  final String? suffix;
  final bool required;
  final bool autofocus;
  final ProviderListenable<String?> provider;
  final void Function(String)? onChanged;

  @override
  ConsumerState<MonnFieldNumber<T>> createState() => _MonnFieldNumberState<T>();
}

class _MonnFieldNumberState<T> extends ConsumerState<MonnFieldNumber<T>> {
  late final TextEditingController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = TextEditingController(text: ref.read(widget.provider));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(widget.provider, (_, next) {
      _controller.text = next.toString();
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
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
          controller: _controller,
          autofocus: widget.autofocus,
          decoration: GlobalThemeData.inputDecoration(context).copyWith(
            suffix: widget.suffix != null
                ? Text(
                    widget.suffix!,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  )
                : null,
          ),
          keyboardType: TextInputType.numberWithOptions(decimal: T == double),
          validator: widget.required
              ? (value) {
                  final amount = double.tryParse(value ?? '');

                  if (value == null || value.isEmpty) {
                    return context.tr('input.error.empty');
                  } else if (amount == null) {
                    return context.tr('input.error.wrong_data');
                  } else if (amount <= 0) {
                    return context.tr('input.error.superior');
                  } else if (amount > 100 && widget.suffix == '%') {
                    return context.tr('input.error.wrong_percentage');
                  }

                  return null;
                }
              : null,
          onChanged: widget.onChanged,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
      ],
    );
  }
}

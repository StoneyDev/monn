import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:monn/generated/locale_keys.g.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/utils/app_colors.dart';

class AmountScreen extends StatefulWidget {
  const AmountScreen({
    required this.onSubmit,
    required this.onChanged,
    this.initialValue = 0,
    super.key,
  });

  final double initialValue;
  final void Function() onSubmit;
  final void Function(String) onChanged;

  @override
  State<AmountScreen> createState() => _AmountScreenState();
}

class _AmountScreenState extends State<AmountScreen> {
  final formKey = GlobalKey<FormState>();
  double addedAmount = 0;
  bool isOverride = false;

  void _onAmountChanged(String value) {
    final parsed = double.tryParse(value) ?? 0;
    setState(() => addedAmount = parsed);

    final total = isOverride ? parsed : widget.initialValue + parsed;
    widget.onChanged(total.toString());
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final hasInitialValue = widget.initialValue > 0;

    return Scaffold(
      appBar: const MonnAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              MonnFieldNumber<double>(
                label: hasInitialValue
                    ? '${context.tr(LocaleKeys.common_amount)} '
                          '(${context.tr(LocaleKeys.common_old_value)}: '
                          '${widget.initialValue.simpleCurrency(locale)})'
                    : context.tr(LocaleKeys.common_amount),
                required: true,
                autofocus: true,
                onChanged: _onAmountChanged,
              ),
              if (hasInitialValue) ...[
                SwitchListTile(
                  onChanged: (value) {
                    setState(() => isOverride = value);
                    final total = value
                        ? addedAmount
                        : widget.initialValue + addedAmount;
                    widget.onChanged(total.toString());
                  },
                  value: isOverride,
                  title: Text(context.tr(LocaleKeys.common_replace_value)),
                ),
                if (!isOverride)
                  _CalculationPreview(
                    initialValue: widget.initialValue,
                    addedValue: addedAmount,
                  ),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MonnButton(
            text: context.tr(LocaleKeys.button_validate),
            onPressed:
                (formKey.currentState?.validate() ?? false) && addedAmount != 0
                ? widget.onSubmit
                : null,
          ),
        ),
      ),
    );
  }
}

class _CalculationPreview extends StatelessWidget {
  const _CalculationPreview({
    required this.initialValue,
    required this.addedValue,
  });

  final double initialValue;
  final double addedValue;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.outline, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(
                      context.tr(LocaleKeys.common_old_value).toUpperCase(),
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 6,
                      children: [
                        Text(
                          initialValue.simpleCurrency(locale),
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(Icons.add_circle, color: AppColors.green),
                        Text(
                          addedValue.simpleCurrency(locale),
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              VerticalDivider(color: colorScheme.outline),
              Expanded(
                child: Column(
                  spacing: 4,
                  children: [
                    Text(
                      context.tr(LocaleKeys.common_new_total).toUpperCase(),
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    Text(
                      (initialValue + addedValue).simpleCurrency(locale),
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

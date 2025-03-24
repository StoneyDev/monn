import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';

class AmountScreen extends ConsumerStatefulWidget {
  const AmountScreen({
    required this.provider,
    required this.onSubmit,
    required this.onChanged,
    this.initialValue = 0,
    super.key,
  });

  final ProviderListenable<String?> provider;
  final double initialValue;
  final void Function() onSubmit;
  final void Function(String) onChanged;

  @override
  ConsumerState<AmountScreen> createState() => _AmountScreenState();
}

class _AmountScreenState extends ConsumerState<AmountScreen> {
  final formKey = GlobalKey<FormState>();
  bool isDirty = false;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();

    return Scaffold(
      appBar: const MonnAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: MonnFieldNumber<double>(
            label:
                // ignore: lines_longer_than_80_chars
                'Montant${widget.initialValue > 0 ? ' (Ancienne valeur: ${widget.initialValue.simpleCurrency(locale)})' : ''}',
            required: true,
            autofocus: true,
            provider: widget.provider,
            onChanged: (newAmount) {
              setState(
                () =>
                    isDirty = double.tryParse(newAmount) != widget.initialValue,
              );
              widget.onChanged(newAmount);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: MediaQuery.sizeOf(context).width - 32,
        child: MonnButton(
          text: context.tr('button.validate'),
          onPressed: (formKey.currentState?.validate() ?? false) && isDirty
              ? widget.onSubmit
              : null,
        ),
      ),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/counter_strike/domain/counter_strike.dart';
import 'package:monn/features/counter_strike/presentation/add_counter_strike_screen/controllers/counter_strike_form_controller.dart';
import 'package:monn/features/counter_strike/presentation/add_counter_strike_screen/controllers/submit_counter_strike_form_controller.dart';
import 'package:monn/shared/extensions/enum_ui.dart';
import 'package:monn/shared/widgets/bottom_sheet/monn_bottom_sheet.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/utils/app_colors.dart';
import 'package:monn/utils/assets.gen.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class AddCounterStrikeScreen extends ConsumerStatefulWidget {
  const AddCounterStrikeScreen({super.key});

  @override
  ConsumerState<AddCounterStrikeScreen> createState() =>
      _AddCounterStrikeScreenState();
}

class _AddCounterStrikeScreenState
    extends ConsumerState<AddCounterStrikeScreen> {
  final formKey = GlobalKey<FormState>();
  bool hasImage = false;

  @override
  Widget build(BuildContext context) {
    final imageId = ref.watch(
      counterStrikeFormControllerProvider.select((form) => form.imageId),
    );

    return Scaffold(
      appBar: MonnAppBar(
        title: context.tr('common.purchasing_tracking'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 48),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            children: [
              GestureDetector(
                onTap: () => WoltModalSheet.show<void>(
                  context: context,
                  pageListBuilder: (context) => [
                    MonnBottomSheet.itemList(
                      context: context,
                      sliver: SliverPadding(
                        padding: const EdgeInsets.all(16),
                        sliver: SliverGrid.builder(
                          itemCount:
                              MonnAssets.images.counterStrike.values.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          itemBuilder: (context, index) {
                            final item = CounterStrikeItem.values[index];

                            return Consumer(
                              builder: (context, ref, _) {
                                final imageId = ref.watch(
                                  counterStrikeFormControllerProvider.select(
                                    (form) => form.imageId,
                                  ),
                                );

                                return GestureDetector(
                                  onTap: () => ref
                                      .read(
                                        counterStrikeFormControllerProvider
                                            .notifier,
                                      )
                                      .imageId(imageId: item),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      border: Border.all(
                                        width: 2,
                                        color: imageId == item
                                            ? AppColors.green
                                            : Theme.of(context)
                                                .colorScheme
                                                .outline,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          item.image(),
                                          Flexible(
                                            child: Text(
                                              item.label,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                color: AppColors.lightGray,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      title: context.tr('common.image'),
                    ),
                  ],
                ),
                child: imageId != null
                    ? imageId.image(height: 140)
                    : iconoir.MediaImage(
                        height: 140,
                        color: hasImage
                            ? AppColors.red
                            : Theme.of(context).colorScheme.primary,
                      ),
              ),
              Text(
                imageId?.label ?? '-',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
              ),
              MonnFieldNumber<double>(
                label: context.tr('common.wear'),
                onChanged: (newWear) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .wear(wear: newWear),
                textInputAction: TextInputAction.next,
              ),
              MonnFieldNumber<double>(
                label: context.tr('common.purchase_price'),
                suffix: '€',
                required: true,
                onChanged: (newPurchaseValue) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .purchaseValue(purchaseValue: newPurchaseValue),
                textInputAction: TextInputAction.next,
              ),
              MonnFieldNumber<double>(
                label: context.tr('common.current_price'),
                suffix: '€',
                required: true,
                onChanged: (newCurrentValue) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .currentValue(currentValue: newCurrentValue),
                textInputAction: TextInputAction.next,
              ),
              MonnFieldDate(
                label: context.tr('common.bought_on', args: ['']),
                required: true,
                onChanged: (newBoughtAt) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .boughtAt(boughtAt: newBoughtAt),
              ),
              MonnFieldNumber<int>(
                label: context.tr('common.quantity'),
                required: true,
                onChanged: (newQuantity) => ref
                    .read(counterStrikeFormControllerProvider.notifier)
                    .quantity(quantity: newQuantity),
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: MonnButton(
                  text: context.tr('button.validate'),
                  onPressed: () async {
                    final imageId =
                        ref.watch(counterStrikeFormControllerProvider).imageId;
                    final isNotValidate =
                        !(formKey.currentState?.validate() ?? false);

                    if (isNotValidate || imageId == null) {
                      setState(() => hasImage = true);
                      return;
                    }

                    final success = await ref
                        .read(
                          submitCounterStrikeFormControllerProvider.notifier,
                        )
                        .submit();

                    if (!context.mounted || !success) return;

                    ref.invalidate(counterStrikeFormControllerProvider);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

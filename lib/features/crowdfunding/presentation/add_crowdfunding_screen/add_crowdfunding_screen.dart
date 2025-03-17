import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconoir_flutter/iconoir_flutter.dart' as iconoir;
import 'package:monn/features/crowdfunding/presentation/add_crowdfunding_screen/controllers/crowdfunding_form_controller.dart';
import 'package:monn/features/crowdfunding/presentation/add_crowdfunding_screen/controllers/submit_crowdfunding_form_controller.dart';
import 'package:monn/shared/widgets/fields/monn_field_date.dart';
import 'package:monn/shared/widgets/fields/monn_field_number.dart';
import 'package:monn/shared/widgets/fields/monn_field_text.dart';
import 'package:monn/shared/widgets/monn_app_bar.dart';
import 'package:monn/shared/widgets/monn_button.dart';
import 'package:monn/shared/widgets/monn_scroll_view.dart';

class AddCrowdfundingScreen extends ConsumerStatefulWidget {
  const AddCrowdfundingScreen({super.key});

  @override
  ConsumerState<AddCrowdfundingScreen> createState() =>
      _AddCrowdfundingScreenState();
}

class _AddCrowdfundingScreenState extends ConsumerState<AddCrowdfundingScreen> {
  final formKey = GlobalKey<FormState>();
  bool isTaxFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MonnAppBar(
        title: 'Suivi des gains',
      ),
      body: MonnScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    MonnFieldText(
                      label: 'Plateforme',
                      required: true,
                      provider: crowdfundingFormControllerProvider.select(
                        (form) => form.platformName,
                      ),
                      onChanged: (newPlatformName) => ref
                          .read(crowdfundingFormControllerProvider.notifier)
                          .platformName(platformName: newPlatformName),
                    ),
                    MonnFieldNumber<double>(
                      label: 'Gain',
                      suffix: '€',
                      required: true,
                      provider: crowdfundingFormControllerProvider.select(
                        (form) => form.brutProfit,
                      ),
                      onChanged: (newBrutProfit) => ref
                          .read(crowdfundingFormControllerProvider.notifier)
                          .brutProfit(brutProfit: newBrutProfit),
                    ),
                    Consumer(
                      builder: (_, ref, __) {
                        final brutProfit = double.tryParse(
                              ref.watch(
                                crowdfundingFormControllerProvider.select(
                                  (value) => value.brutProfit,
                                ),
                              ),
                            ) ??
                            0;

                        if (brutProfit.isNegative) {
                          return const SizedBox.shrink();
                        } else {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (!isTaxFree) ...[
                                Expanded(
                                  child: MonnFieldNumber<double>(
                                    label: 'Taxe (sans IR: 17.2)',
                                    suffix: '%',
                                    required:
                                        !brutProfit.isNegative && !isTaxFree,
                                    provider: crowdfundingFormControllerProvider
                                        .select(
                                      (form) => form.taxPercentage,
                                    ),
                                    onChanged: (newTax) => ref
                                        .read(
                                          crowdfundingFormControllerProvider
                                              .notifier,
                                        )
                                        .taxPercentage(taxPercentage: newTax),
                                  ),
                                ),
                                const SizedBox(width: 16),
                              ],
                              OutlinedButton.icon(
                                label: Text(
                                  isTaxFree ? 'Ne plus exonérer' : 'Exonérer',
                                ),
                                onPressed: () => setState(
                                  () => isTaxFree = !isTaxFree,
                                ),
                                icon: isTaxFree
                                    ? const Text('💔')
                                    : iconoir.Heart(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                    MonnFieldDate(
                      label: 'Reçu le',
                      required: true,
                      provider: crowdfundingFormControllerProvider.select(
                        (form) => form.receivedAt,
                      ),
                      onChanged: (newReceivedAt) => ref
                          .read(crowdfundingFormControllerProvider.notifier)
                          .receivedAt(receivedAt: newReceivedAt),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MonnButton(
            text: context.tr('button.validate'),
            onPressed: () async {
              if (!(formKey.currentState?.validate() ?? false)) return;

              final success = await ref
                  .read(submitCrowdfundingFormControllerProvider.notifier)
                  .submit();

              if (!context.mounted || !success) return;

              ref.invalidate(crowdfundingFormControllerProvider);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

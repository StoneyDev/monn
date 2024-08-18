import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/crowdfunding/domain/crowdfunding.dart';
import 'package:monn/features/crowdfunding/presentation/add_crowdfunding_screen/controllers/edit_crowdfunding_controller.dart';
import 'package:monn/shared/widgets/fields/moon_field_date.dart';
import 'package:monn/shared/widgets/fields/moon_field_number.dart';
import 'package:monn/shared/widgets/fields/moon_field_text.dart';
import 'package:monn/shared/widgets/moon_app_bar.dart';
import 'package:monn/shared/widgets/moon_button.dart';

class AddCrowdfundingScreen extends ConsumerWidget {
  const AddCrowdfundingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    late String platformName;
    late DateTime receiveAt;
    late double taxPercentage;
    late double brutProfit;

    return Scaffold(
      appBar: const MoonAppBar(
        title: 'Suivi des gains',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              MoonFieldText(
                label: 'Plateforme',
                required: true,
                onChanged: (value) => platformName = value,
              ),
              const SizedBox(height: 16),
              MoonFieldNumber(
                label: 'Gain',
                suffix: '€',
                onChanged: (value) => brutProfit = double.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 16),
              MoonFieldNumber(
                label: 'Taxe',
                suffix: '%',
                onChanged: (value) =>
                    taxPercentage = double.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 16),
              MoonFieldDate(
                label: 'Reçu le',
                onChanged: (value) => receiveAt = value,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: MoonButton(
          text: context.tr('button.validate'),
          onPressed: () async {
            if (!formKey.currentState!.validate()) return;

            late Crowdfunding newCrowdfunding;

            if (brutProfit.isNegative) {
              newCrowdfunding = Crowdfunding(
                platform: platformName,
                receiveAt: receiveAt,
                brutProfit: brutProfit,
              );
            } else {
              final taxProfit = double.parse(
                (brutProfit * (taxPercentage / 100)).toStringAsFixed(2),
              );

              final netProfit = double.parse(
                (brutProfit - taxProfit).toStringAsFixed(2),
              );

              newCrowdfunding = Crowdfunding(
                platform: platformName,
                receiveAt: receiveAt,
                taxPercentage: taxPercentage,
                taxProfit: taxProfit,
                brutProfit: brutProfit,
                netProfit: netProfit,
              );
            }

            final success = await ref
                .read(editCrowdfundingControllerProvider.notifier)
                .submit(newCrowdfunding);

            if (!context.mounted || !success) return;

            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

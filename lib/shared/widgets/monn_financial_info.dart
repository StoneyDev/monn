import 'package:flutter/material.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/utils/app_colors.dart';

class MonnFinancialInfo extends StatelessWidget {
  const MonnFinancialInfo({
    required this.title,
    required this.data,
    super.key,
  });

  final String title;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final formattedData = switch (data.runtimeType) {
      double => (data as double).simpleCurrency(context),
      _ => '$data',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.lightGray,
          ),
        ),
        Text(
          formattedData,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/utils/app_colors.dart';

class MoonFinancialInfo extends StatelessWidget {
  const MoonFinancialInfo({
    required this.title,
    required this.data,
    super.key,
  });

  final String title;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final formattedData = switch (data.runtimeType) {
      double => (data as double).simpleCurrency(),
      _ => '$data',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          formattedData,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.darkGray,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:monn/shared/extensions/double_ui.dart';
import 'package:monn/utils/app_colors.dart';

class MoonCard extends StatelessWidget {
  const MoonCard({
    required this.title,
    required this.totalAmount,
    required this.children,
    super.key,
  });

  final String title;
  final double totalAmount;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.extraLightGray),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: AppColors.lightGray,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  totalAmount.simpleCurrency(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
          ),
          const Divider(
            color: AppColors.extraLightGray,
            height: 0,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: children),
          ),
        ],
      ),
    );
  }
}

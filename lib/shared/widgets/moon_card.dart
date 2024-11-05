import 'package:flutter/material.dart';
import 'package:monn/utils/app_colors.dart';

class MoonCard extends StatelessWidget {
  const MoonCard({
    required this.title,
    required this.amount,
    this.children = const [],
    this.onTap,
    super.key,
  });

  final Widget title;
  final Widget amount;
  final List<Widget> children;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.extraLightGray),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.zero,
      child: InkWell(
        highlightColor: AppColors.extraExtraLightGray,
        splashColor: AppColors.extraExtraLightGray,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title,
                  const SizedBox(height: 16),
                  amount,
                ],
              ),
            ),
            if (children.isNotEmpty) ...[
              const Divider(
                color: AppColors.extraLightGray,
                height: 0,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(children: children),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

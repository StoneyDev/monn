import 'package:flutter/material.dart';
import 'package:monn/utils/app_colors.dart';

class MonnError extends StatelessWidget {
  const MonnError({required this.message, super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Oh no !',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.red50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              message,
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: AppColors.red50),
            ),
          ],
        ),
      ),
    );
  }
}

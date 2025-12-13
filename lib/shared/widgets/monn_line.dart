import 'package:flutter/material.dart';

class MonnLine extends StatelessWidget {
  const MonnLine({
    required this.title,
    required this.value,
    this.icon,
    super.key,
  });

  final String title;
  final Widget value;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            spacing: 8,
            children: [
              if (icon != null) icon!,
              Flexible(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: value),
      ],
    );
  }
}

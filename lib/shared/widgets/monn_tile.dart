import 'package:flutter/material.dart';

class MonnTile extends StatelessWidget {
  const MonnTile({
    required this.icon,
    required this.content,
    required this.subContent,
    required this.trailing,
    this.subTrailing,
    super.key,
  });

  final Widget icon;
  final Widget content;
  final Widget subContent;
  final Widget trailing;
  final Widget? subTrailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              content,
              subContent,
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              trailing,
              ?subTrailing,
            ],
          ),
        ),
      ],
    );
  }
}

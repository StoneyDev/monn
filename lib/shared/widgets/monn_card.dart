import 'package:flutter/material.dart';

class MonnCard extends StatefulWidget {
  const MonnCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    this.onLongPress,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;
  final void Function()? onTap;
  final void Function()? onLongPress;

  @override
  State<MonnCard> createState() => _MonnCardState();
}

class _MonnCardState extends State<MonnCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.onLongPress,
      onTapDown: widget.onTap != null
          ? (_) => setState(() => _isPressed = true)
          : null,
      onTapCancel: widget.onTap != null
          ? () => setState(() => _isPressed = false)
          : null,
      onTapUp: widget.onTap != null
          ? (_) {
              setState(() => _isPressed = false);
              widget.onTap!();
            }
          : null,
      child: AnimatedScale(
        duration: Durations.short2,
        scale: _isPressed ? 0.975 : 1.0,
        child: Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 2,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

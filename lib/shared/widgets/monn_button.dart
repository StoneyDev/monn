import 'package:flutter/material.dart';

class MonnButton extends StatefulWidget {
  const MonnButton({required this.text, this.onPressed, super.key});

  final String text;
  final void Function()? onPressed;

  @override
  State<MonnButton> createState() => _MonnButtonState();
}

class _MonnButtonState extends State<MonnButton> {
  var _pressed = false;

  void _setPressed(bool pressed) => setState(() => _pressed = pressed);

  @override
  Widget build(BuildContext context) => Listener(
    onPointerDown: (_) => _setPressed(true),
    onPointerUp: (_) => _setPressed(false),
    onPointerCancel: (_) => _setPressed(false),
    child: AnimatedScale(
      duration: Durations.short2,
      scale: _pressed && widget.onPressed != null ? 0.975 : 1,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(widget.text),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:monn/features/settings/presentation/settings_screen/controllers/theme_switch_controller.dart';
import 'package:monn/utils/global_theme_data.dart';

class MonnCard extends ConsumerStatefulWidget {
  const MonnCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;
  final void Function()? onTap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MonnCardState();
}

class _MonnCardState extends ConsumerState<MonnCard> {
  bool _isPressed = false;
  Duration _duration = Durations.short2;

  @override
  Widget build(BuildContext context) {
    ref.listen(
      themeSwitchControllerProvider,
      (_, __) => _duration = Duration.zero,
    );

    return GestureDetector(
      onTapDown: widget.onTap != null
          ? (_) => setState(() {
                _isPressed = true;
                _duration = Durations.short2;
              })
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
      child: AnimatedContainer(
        duration: _duration,
        transform: Matrix4.identity()..scale(_isPressed ? 0.975 : 1.0),
        transformAlignment: Alignment.center,
        padding: widget.padding,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          boxShadow: GlobalThemeData.shadow,
        ),
        child: widget.child,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NeutralScroll extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics(parent: RangeMaintainingScrollPhysics());
  }

  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

class MonnScrollView extends StatelessWidget {
  const MonnScrollView({required this.slivers, super.key});

  final List<Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NeutralScroll(),
      child: CustomScrollView(slivers: slivers),
    );
  }
}

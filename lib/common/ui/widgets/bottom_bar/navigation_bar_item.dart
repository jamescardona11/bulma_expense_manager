import 'package:flutter/material.dart';

import 'bubble_selection_painter.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    Key? key,
    required this.isActive,
    required this.bubbleRadius,
    required this.maxBubbleRadius,
    required this.bubbleColor,
    required this.iconScale,
    required this.onTap,
    this.child,
  }) : super(key: key);

  final bool isActive;
  final double bubbleRadius;
  final double maxBubbleRadius;
  final Color? bubbleColor;
  final double iconScale;
  final VoidCallback onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: CustomPaint(
        painter: BubblePainter(
          bubbleRadius: isActive ? bubbleRadius : 0,
          bubbleColor: bubbleColor,
          maxBubbleRadius: maxBubbleRadius,
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: onTap,
          child: Transform.scale(
            scale: isActive ? iconScale : 1,
            child: child,
          ),
        ),
      ),
    );
  }
}

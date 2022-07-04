import 'package:bulma_expense_manager/config/values/colors.dart';
import 'package:flutter/material.dart';

import 'navigation_bar_item.dart';

class BottomBarWidget extends StatefulWidget {
  /// default constructor
  const BottomBarWidget({
    Key? key,
    required this.activeIndex,
    required this.onTap,
    required this.icons,
    this.indexSpecial = -1,
    this.backgroundColor = kWhite,
    this.splashColor = kPrimary,
    this.activeColor = kPrimary,
    this.inactiveColor = kGrey,
  }) : super(key: key);

  final int activeIndex;
  final int indexSpecial;
  final List<IconData> icons;
  final Color backgroundColor;
  final Color splashColor;
  final Color activeColor;
  final Color inactiveColor;
  final ValueChanged<int> onTap;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget>
    with TickerProviderStateMixin {
  late AnimationController _bubbleController;
  final splashRadius = 24.0;

  double _bubbleRadius = 0;
  double _iconScale = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(bottom: 22),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _getItems(),
      ),
    );
  }

  List<Widget> _getItems() {
    final items = <Widget>[];
    for (int i = 0; i < widget.icons.length; i++) {
      final isActive = widget.activeIndex == i;

      items.add(
        NavigationBarItem(
          isActive: isActive,
          bubbleRadius: _bubbleRadius,
          maxBubbleRadius: splashRadius,
          bubbleColor: widget.splashColor,
          iconScale: _iconScale,
          onTap: () => widget.onTap(i),
          child: Builder(builder: (context) {
            if (widget.indexSpecial == i) {
              return _especialItem(
                _getIcon(widget.icons[i], isActive),
              );
            }
            return _getIcon(widget.icons[i], isActive);
          }),
        ),
      );
    }

    return items;
  }

  Widget _getIcon(IconData iconData, bool isActive) {
    final color = isActive ? widget.activeColor : widget.inactiveColor;
    return Icon(
      iconData,
      size: 24,
      color: color,
    );
  }

  Widget _especialItem(Widget icon) => Container(
      width: 45,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Center(
        child: icon,
      ));

  @override
  void dispose() {
    _bubbleController.dispose();
    super.dispose();
  }

  void _startBubbleAnimation() {
    _bubbleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    final bubbleCurve = CurvedAnimation(
      parent: _bubbleController,
      curve: Curves.linear,
    );

    Tween<double>(begin: 0, end: 1).animate(bubbleCurve).addListener(() {
      setState(() {
        _bubbleRadius = splashRadius * bubbleCurve.value;
        if (_bubbleRadius == splashRadius) {
          _bubbleRadius = 0;
        }

        if (bubbleCurve.value < 0.5) {
          _iconScale = 1 + bubbleCurve.value;
        } else {
          _iconScale = 2 - bubbleCurve.value;
        }
      });
    });

    if (_bubbleController.isAnimating) {
      _bubbleController.reset();
    }
    _bubbleController.forward();
  }

  @override
  void didUpdateWidget(BottomBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.activeIndex != oldWidget.activeIndex) {
      _startBubbleAnimation();
    }
  }
}

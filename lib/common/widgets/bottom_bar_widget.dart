import 'package:bulma_expense_manager/common/ui_models/menu_item.dart';
import 'package:bulma_expense_manager/config/values/colors.dart';
import 'package:flutter/material.dart';

import 'navigation_bar_item.dart';

class BottomBarWidget extends StatefulWidget {
  /// default constructor
  const BottomBarWidget({
    Key? key,
    required this.index,
    required this.onTap,
    required this.items,
    this.backgroundColor = kWhite,
    this.splashColor = kPrimary,
    this.activeColor = kPrimary,
    this.inactiveColor = kGrey,
  }) : super(key: key);

  final int index;
  final List<MenuItemUIM> items;
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
    for (int i = 0; i < widget.items.length; i++) {
      final item = widget.items[i];
      items.add(
        NavigationBarItem(
          isActive: item.isSelected,
          bubbleRadius: _bubbleRadius,
          maxBubbleRadius: splashRadius,
          bubbleColor: widget.splashColor,
          iconScale: _iconScale,
          onTap: () => widget.onTap(i),
          child: Builder(builder: (context) {
            if (item.isSpecial) {
              return _especialItem(
                item.icon,
                item.isSelected,
              );
            }
            return _getIcon(item.icon, item.isSelected);
          }),
        ),
      );
    }

    return items;
  }

  @override
  void dispose() {
    _bubbleController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(BottomBarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != oldWidget.index) {
      _startBubbleAnimation();
    }
  }

  Widget _getIcon(IconData iconData, bool isSelected) {
    final color = isSelected ? widget.activeColor : widget.inactiveColor;
    return Icon(
      iconData,
      size: 24,
      color: color,
    );
  }

  Widget _especialItem(IconData iconData, bool isSelected) => Container(
      width: 45,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      child: Center(
        child: _getIcon(iconData, isSelected),
      ));

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
}

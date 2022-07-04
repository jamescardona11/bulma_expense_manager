import 'package:flutter/material.dart';
import 'package:bulma_expense_manager/common/ui_models/menu_item.dart';
import 'package:bulma_expense_manager/config/values/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final splashRadius = 28.0;

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
        children: widget.items.map(
          (item) {
            final color =
                item.isSelected ? widget.activeColor : widget.inactiveColor;
            return NavigationBarItem(
              isActive: item.isSelected,
              bubbleRadius: _bubbleRadius,
              maxBubbleRadius: splashRadius,
              bubbleColor: widget.splashColor,
              iconScale: _iconScale,
              onTap: () => widget.onTap(widget.items.indexOf(item)),
              child: Visibility(
                visible: item.isSpecial,
                replacement: Center(
                  child: _DefaultIconWidget(
                    iconData: item.icon,
                    color: color,
                  ),
                ),
                child: _SpecialItemWidget(
                  iconData: item.icon,
                  color: color,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
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

class _DefaultIconWidget extends StatelessWidget {
  const _DefaultIconWidget({
    Key? key,
    required this.iconData,
    required this.color,
  }) : super(key: key);

  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      iconData,
      size: 22,
      color: color,
    );
  }
}

class _SpecialItemWidget extends StatelessWidget {
  /// default constructor
  const _SpecialItemWidget({
    Key? key,
    required this.iconData,
    required this.color,
  }) : super(key: key);

  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 50,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Colors.white,
      ),
      child: Center(
        child: _DefaultIconWidget(
          iconData: iconData,
          color: color,
        ),
      ),
    );
  }
}

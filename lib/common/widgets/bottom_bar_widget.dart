import 'package:flutter/material.dart';
import 'package:bulma_expense_manager/config/values/values.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class BottomBarWidget extends StatelessWidget {
  /// default constructor
  const BottomBarWidget({
    Key? key,
    required this.index,
    required this.onTap,
    required this.iconsData,
  }) : super(key: key);

  final int index;
  final List<IconData> iconsData;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    // items.

    return AnimatedBottomNavigationBar(
      activeIndex: index,
      activeColor: kPrimary,
      inactiveColor: kGrey2,
      splashColor: kSecondary,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: onTap,
      icons: iconsData,
    );
  }
}

import 'package:flutter/material.dart';

@immutable
class MenuItemUIM {
  const MenuItemUIM({
    required this.label,
    required this.icon,
    required this.route,
    this.isSelected = false,
  });

  final String label;
  final String route;
  final IconData icon;
  final bool isSelected;

  MenuItemUIM copyWith({
    String? label,
    String? route,
    IconData? icon,
    bool? isSelected,
  }) {
    return MenuItemUIM(
      label: label ?? this.label,
      route: route ?? this.route,
      icon: icon ?? this.icon,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  String toString() =>
      'MenuItem(name: $label, iconData: $icon, selected: $isSelected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuItemUIM &&
        other.label == label &&
        other.icon == icon &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => label.hashCode ^ icon.hashCode ^ isSelected.hashCode;
}

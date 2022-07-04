import 'package:bulma_expense_manager/common/ui_models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuMobileNotifier extends StateNotifier<List<MenuItemUIM>> {
  MenuMobileNotifier(List<MenuItemUIM> initialList) : super(initialList);

  void toggle(String route) {
    state = [
      for (final item in state)
        if (item.route == route)
          item.copyWith(isSelected: true)
        else
          item.copyWith(isSelected: false)
    ];
  }

  void changeTab(int index) => toggle(state[index].route);

  List<MenuItemUIM> get currentState => state;
}

class MenuMobileProvider {
  late final StateNotifierProvider<MenuMobileNotifier, List<MenuItemUIM>>
      _menuItemsProvider;
  late final Provider<int> _activeIndex;

  MenuMobileProvider() {
    _menuItemsProvider =
        StateNotifierProvider<MenuMobileNotifier, List<MenuItemUIM>>(
      (_) {
        return MenuMobileNotifier(
          const [
            MenuItemUIM(
              label: 'Home',
              icon: Icons.calendar_month,
              route: '/home',
              isSelected: true,
            ),
            MenuItemUIM(
              label: 'Add',
              icon: Icons.add,
              route: '/add',
            ),
            MenuItemUIM(
              label: 'Budget',
              icon: Icons.graphic_eq,
              route: '/budget',
            ),
          ],
        );
      },
    );

    _activeIndex = Provider<int>((ref) {
      return ref
          .watch(_menuItemsProvider)
          .indexWhere((item) => item.isSelected);
    });
  }

  StateNotifierProvider<MenuMobileNotifier, List<MenuItemUIM>>
      get menuItemsProvider => _menuItemsProvider;

  AlwaysAliveProviderBase<MenuMobileNotifier> get notifier =>
      _menuItemsProvider.notifier;

  Provider<int> get activeIndex => _activeIndex;
}

import 'package:flutter/material.dart';
import 'package:bulma_expense_manager/common/providers/menu_provider.dart';
import 'package:bulma_expense_manager/common/widgets/bottom_bar_widget.dart';
import 'package:bulma_expense_manager/pages/budget_page.dart';
import 'package:bulma_expense_manager/pages/create_budge_page.dart';
import 'package:bulma_expense_manager/pages/daily_page.dart';
import 'package:bulma_expense_manager/pages/profile_page.dart';
import 'package:bulma_expense_manager/pages/stats_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RootApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootAppState();
}

class _RootAppState extends ConsumerState<RootApp> {
  int pageIndex = 0;
  late MenuMobileProvider menuProvider;

  @override
  void initState() {
    menuProvider = MenuMobileProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final index = ref.watch(menuProvider.activeIndex);

    return Scaffold(
        body: IndexedStack(
          index: pageIndex,
          children: [
            DailyPage(),
            StatsPage(),
            BudgetPage(),
            ProfilePage(),
            CreatBudgetPage()
          ],
        ),
        bottomNavigationBar: BottomBarWidget(
          index: index,
          iconsData: ref.read(menuProvider.notifier).iconsData.toList(),
          onTap: ref.read(menuProvider.notifier).changeTab,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              ref.read(menuProvider.notifier).changeTab(4);
            },
            child: Icon(
              Icons.add,
              size: 25,
            ),
            backgroundColor: Colors.pink
            //params
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}

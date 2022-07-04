import 'package:bulma_expense_manager/common/widgets/bottom_bar_widget.dart';
import 'package:bulma_expense_manager/pages/budget_page.dart';
import 'package:bulma_expense_manager/pages/create_budge_page.dart';
import 'package:bulma_expense_manager/pages/daily_page.dart';
import 'package:bulma_expense_manager/pages/profile_page.dart';
import 'package:bulma_expense_manager/pages/stats_page.dart';
import 'package:bulma_expense_manager/config/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  List<Widget> pages = [
    DailyPage(),
    StatsPage(),
    BudgetPage(),
    ProfilePage(),
    CreatBudgetPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: BottomBarWidget(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              selectedTab(4);
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

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}

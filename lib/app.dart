import 'package:bulma_expense_manager/config/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:bulma_expense_manager/common/providers/menu_provider.dart';
import 'package:bulma_expense_manager/common/widgets/bottom_bar_widget.dart';
import 'package:bulma_expense_manager/pages/create_budge_page.dart';
import 'package:bulma_expense_manager/pages/daily_page.dart';
import 'package:bulma_expense_manager/pages/stats_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerStatefulWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  late MenuMobileProvider menuProvider;

  @override
  void initState() {
    menuProvider = MenuMobileProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final indexMenu = ref.watch(menuProvider.activeIndex);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            // padding: EdgeInsets.only(bottom: 20),
            color: kBlueBlack,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: BottomBarWidget(
                index: indexMenu,
                backgroundColor: kBlueBlack,
                items: ref.read(menuProvider.notifier).currentState,
                onTap: ref.read(menuProvider.notifier).changeTab,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 100),
            decoration: const BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: IndexedStack(
              index: indexMenu,
              children: [
                DailyPage(),
                CreatBudgetPage(),
                StatsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
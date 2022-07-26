import 'package:bulma_expense_manager/app/transaction/transaction_page.dart';
import 'package:bulma_expense_manager/common/providers/menu_provider.dart';
import 'package:bulma_expense_manager/config/values/colors.dart';
import 'package:bulma_expense_manager/pages/daily_page.dart';
import 'package:bulma_expense_manager/pages/stats_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common/ui/widgets/bottom_bar/bottom_bar_widget.dart';

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
            color: kBlueBlack,
          ),
          Container(
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
                TransactionPage(),
                StatsPage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBarWidget(
        index: indexMenu,
        backgroundColor: kBlueBlack,
        items: ref.read(menuProvider.menuItemsProvider),
        onTap: (index) {},
      ),
    );
  }
}

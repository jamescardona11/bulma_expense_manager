import 'package:bulma_expense_manager/common/providers/top_back_skip_view.dart';
import 'package:bulma_expense_manager/config/values/values.dart';
import 'package:flutter/material.dart';

import 'oval_clipper.dart';

class HeaderPlantsWidget extends StatelessWidget {
  const HeaderPlantsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: const OvalHeaderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.24,
        color: kBlueBlack,
        child: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              TopBackSkipView(
                showSkip: true,
                onBackClick: () {},
                onSkipClick: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get style14 => const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w300,
      );
}

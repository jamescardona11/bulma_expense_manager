import 'package:flutter/material.dart';

import 'widgets/header_plants_widget.dart';

class TransactionPage extends StatelessWidget {
  /// default constructor
  const TransactionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        HeaderPlantsWidget(),
        // Container(
        //   width: size.width,
        //   height: 70,
        //   color: kBlue,
        // ),
      ],
    );
  }
}

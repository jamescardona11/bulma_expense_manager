import 'package:flutter/material.dart';

import 'widgets/header_oval_widget.dart';
import 'widgets/picker_card_widget.dart';

class TransactionPage extends StatelessWidget {
  /// default constructor
  const TransactionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: HeaderOvalWidget(),
        ),
        Positioned(
          top: 100,
          left: 40,
          right: 40,
          child: PickerCardWidget(),
        )
      ],
    );
  }
}

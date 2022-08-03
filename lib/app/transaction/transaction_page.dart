import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const PickerCardWidget(),
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                      ),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "\$",
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

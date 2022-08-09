import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/header_oval.dart';
import 'widgets/card_switch.dart';
import 'widgets/icon_text.dart';

class TransactionPage extends StatelessWidget {
  /// default constructor
  const TransactionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          // const PickerCardWidget(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            color: Colors.pink,
            child: SafeArea(
              bottom: false,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Transfer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "\$",
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          _FormExpenseOrIncomeWidget(),
        ],
      ),
    );
  }
}

class _FormExpenseOrIncomeWidget extends StatelessWidget {
  const _FormExpenseOrIncomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconTextWidget(
          label: 'Wallet',
        ),
        IconTextWidget(
          label: 'Wallet',
        ),
        IconTextWidget(
          label: 'Wallet',
        ),
        IconTextWidget(
          label: 'Wallet',
        ),
        IconTextWidget(
          label: 'Wallet',
        ),
        IconTextWidget(
          label: 'Wallet',
        ),
      ],
    );
  }
}


          // Align(
          //   alignment: Alignment.topCenter,
          //   child: HeaderOvalWidget(),
          // ),
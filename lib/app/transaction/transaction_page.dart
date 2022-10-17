import 'package:bulma_expense_manager/config/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/form_element.dart';

class TransactionPage extends StatelessWidget {
  /// default constructor
  const TransactionPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        children: [
          HeaderTransactionWidget(),
          _FormExpenseOrIncomeWidget(),
        ],
      ),
    );
  }
}

class HeaderTransactionWidget extends StatelessWidget {
  const HeaderTransactionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        right: 20,
        left: 20,
        bottom: 15,
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
                  backgroundColor: kWhite,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Transfer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kWhite,
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
                  color: kWhite,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "0",
                  hintStyle: TextStyle(color: kWhite),
                ),
              ),
            ),
            SizedBox(width: 5),
            DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Row(
                  children: [
                    Text(
                      'COP',
                      style: TextStyle(
                        color: kWhite,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: kWhite,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
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
        FormElementWidget(
          label: 'Wallet',
          icon: FontAwesomeIcons.wallet,
          trailing: Row(
            children: [
              Text('Default'),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
        ),
        FormElementWidget(
          label: 'Today',
          icon: FontAwesomeIcons.solidCalendar,
        ),
        FormElementWidget(
          label: 'Write a note',
          icon: FontAwesomeIcons.pencil,
        ),
        FormElementWidget(
          label: 'Labels',
          icon: FontAwesomeIcons.tag,
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
        FormElementWidget(
          label: 'Select photo',
          icon: FontAwesomeIcons.solidImage,
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
        FormElementWidget(
          label: 'Recurrence',
          icon: FontAwesomeIcons.arrowsRotate,
          trailing: Row(
            children: [
              Text('Never'),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

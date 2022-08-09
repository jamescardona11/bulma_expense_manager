import 'package:bulma_expense_manager/config/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum CardOptionStatus {
  expense(0),
  income(1),
  transfer(2);

  final int value;

  const CardOptionStatus(this.value);
}

class CardOptionsWidget extends StatefulWidget {
  /// default constructor
  const CardOptionsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CardOptionsWidget> createState() => _CardOptionsWidgetState();
}

class _CardOptionsWidgetState extends State<CardOptionsWidget> {
  final pickerOption = ValueNotifier<CardOptionStatus?>(null);

  //padding: const EdgeInsets.symmetric(horizontal: 20),
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<CardOptionStatus?>(
      valueListenable: pickerOption,
      builder: (_, option, child) => SizedBox(
        height: 80,
        child: Card(
          elevation: 8,
          color: kWhite,
          shape: const RoundedRectangleBorder(
            borderRadius: kBorderRadius25,
          ),
          child: Row(
            children: [
              Expanded(
                child: _TextBox(
                  label: 'Expense',
                  icon: FontAwesomeIcons.moneyBillTrendUp,
                  iconColor: kRed,
                  onPressed: () {
                    pickerOption.value = CardOptionStatus.expense;
                  },
                  isSelected: CardOptionStatus.expense == option,
                ),
              ),
              Expanded(
                child: _TextBox(
                  label: 'Income',
                  icon: FontAwesomeIcons.sackDollar,
                  iconColor: kGreen,
                  onPressed: () {
                    pickerOption.value = CardOptionStatus.income;
                  },
                  isSelected: CardOptionStatus.income == option,
                ),
              ),
              Expanded(
                child: _TextBox(
                  label: 'Transfer',
                  icon: FontAwesomeIcons.vault,
                  onPressed: () {
                    pickerOption.value = CardOptionStatus.transfer;
                  },
                  iconColor: kBlue,
                  isSelected: CardOptionStatus.transfer == option,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextBox extends StatelessWidget {
  const _TextBox({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isSelected = false,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool isSelected;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 4,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isSelected ? kBlueBlack : kWhite,
                borderRadius: kBorderRadius25,
              ),
              child: ClipRRect(
                borderRadius: kBorderRadius25,
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor:
                        MaterialStateProperty.all(kGrey.withOpacity(0.3)),
                  ),
                  onPressed: onPressed,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: icon != null,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Icon(
                            icon,
                            color: isSelected ? iconColor : kIconColors,
                            size: 18,
                          ),
                        ),
                      ),
                      Text(
                        label,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: isSelected ? kWhite : kBlueBlack),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

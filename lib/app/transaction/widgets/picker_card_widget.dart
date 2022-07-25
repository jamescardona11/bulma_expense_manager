import 'package:bulma_expense_manager/config/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum PickerOptionStatus {
  expense(0),
  income(1),
  transfer(2);

  final int value;

  const PickerOptionStatus(this.value);
}

class PickerCardWidget extends StatefulWidget {
  /// default constructor
  const PickerCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PickerCardWidget> createState() => _PickerCardWidgetState();
}

class _PickerCardWidgetState extends State<PickerCardWidget> {
  final pickerOption = ValueNotifier<PickerOptionStatus?>(null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<PickerOptionStatus?>(
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
                    pickerOption.value = PickerOptionStatus.expense;
                  },
                  isSelected: PickerOptionStatus.expense == option,
                ),
              ),
              Expanded(
                child: _TextBox(
                  label: 'Income',
                  icon: FontAwesomeIcons.sackDollar,
                  iconColor: kGreen,
                  onPressed: () {
                    pickerOption.value = PickerOptionStatus.income;
                  },
                  isSelected: PickerOptionStatus.income == option,
                ),
              ),
              Expanded(
                child: _TextBox(
                  label: 'Transfer',
                  icon: FontAwesomeIcons.vault,
                  onPressed: () {
                    pickerOption.value = PickerOptionStatus.transfer;
                  },
                  iconColor: kBlue,
                  isSelected: PickerOptionStatus.transfer == option,
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

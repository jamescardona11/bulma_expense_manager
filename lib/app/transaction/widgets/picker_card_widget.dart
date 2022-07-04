import 'package:bulma_expense_manager/config/values/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickerCardWidget extends StatelessWidget {
  /// default constructor
  const PickerCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                label: 'Gasto',
                icon: FontAwesomeIcons.moneyBillTrendUp,
                iconColor: kRed,
                onPressed: () {},
                isSelected: true,
              ),
            ),
            Expanded(
              child: _TextBox(
                label: 'Ingreso',
                icon: FontAwesomeIcons.sackDollar,
                iconColor: kGreen,
                onPressed: () {},
                isSelected: true,
              ),
            ),
            Expanded(
              child: _TextBox(
                label: 'Mover',
                icon: FontAwesomeIcons.vault,
                onPressed: () {},
                iconColor: kBlue,
                isSelected: true,
              ),
            ),
          ],
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
            padding: const EdgeInsets.all(4.0),
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
                  onPressed: () {},
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

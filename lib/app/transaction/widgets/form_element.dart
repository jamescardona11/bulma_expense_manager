import 'package:bulma_expense_manager/config/values/values.dart';
import 'package:flutter/material.dart';

class FormElementWidget extends StatelessWidget {
  /// default constructor
  const FormElementWidget({
    Key? key,
    required this.label,
    this.trailing = const SizedBox(),
    this.iconColor = kPrimary,
    this.icon = Icons.question_mark_outlined,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Color iconColor;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
              Text(
                label,
                style: Theme.of(context).textTheme.headline2,
              ),
              Spacer(),
              trailing,
            ],
          ),
          // Divider()
        ],
      ),
    );
  }
}

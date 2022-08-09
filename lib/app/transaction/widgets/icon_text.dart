import 'package:flutter/material.dart';

class IconTextWidget extends StatelessWidget {
  /// default constructor
  const IconTextWidget({
    Key? key,
    required this.label,
    this.trailing = const SizedBox(),
    this.icon = Icons.question_mark_outlined,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Icon(icon),
        ),
        Text('label'),
        Spacer(),
        trailing,
      ],
    );
  }
}

import 'package:bulma_expense_manager/config/values/values.dart';
import 'package:flutter/material.dart';

class HeaderOvalWidget extends StatelessWidget {
  const HeaderOvalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: const OvalHeaderClipper(),
      child: Container(
        width: size.width,
        height: 150,
        color: kBlueBlack,
      ),
    );
  }
}

class OvalHeaderClipper extends CustomClipper<Path> {
  const OvalHeaderClipper();

  @override
  Path getClip(Size size) {
    const lineTo = 1 - 0.2;
    const controlPoint = 1 + 0.2;

    return Path()
      ..lineTo(0, size.height * lineTo)
      ..quadraticBezierTo(size.width * 0.5, size.height * controlPoint,
          size.width, size.height * lineTo)
      ..lineTo(size.width, 0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

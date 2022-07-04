import 'package:flutter/material.dart';

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

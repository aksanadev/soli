import 'package:flutter/cupertino.dart';

class SlantedUpClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double x = size.width;
    double y = size.height;
    Path path = Path();

    // (0,0)        // p1
    path.lineTo(0, y);
    path.lineTo(x, y * .7);
    path.lineTo(x, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SlantedDownClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double x = size.width;
    double y = size.height;
    Path path = Path();

    // (0,0)        // p1
    path.lineTo(0, y * .7);
    path.lineTo(x, y);
    path.lineTo(x, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

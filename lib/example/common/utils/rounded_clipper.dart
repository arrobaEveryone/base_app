
import 'package:flutter/widgets.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class RoundedClipper extends CustomClipper<Path> {
  final BorderRadius borderRadius;
  final bool clipTopRight;
  final bool clipBottomRight;
  final bool clipBottomLeft;
  final bool clipTopLeft;

  RoundedClipper({
    required this.borderRadius,
    this.clipTopRight = false,
    this.clipBottomRight = false,
    this.clipBottomLeft = false,
    this.clipTopLeft = false,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final RRect outer = borderRadius.toRRect(Rect.fromLTWH(0, 0, size.width, size.height));

    path.addRRect(outer);

    if (clipTopRight) {
      path.lineTo(size.width, outer.top);
      path.arcTo(
        Rect.fromCircle(
          center: Offset(outer.trRadiusX, outer.trRadiusY),
          radius: borderRadius.topRight.y,
        ),
        -math.pi / 2,
        math.pi / 2,
        false,
      );
    }

    if (clipBottomRight) {
      path.lineTo(outer.right, size.height);
      path.arcTo(
        Rect.fromCircle(
          center: Offset(outer.brRadiusX, outer.brRadiusY),
          radius: borderRadius.bottomRight.x,
        ),
        0,
        math.pi / 2,
        false,
      );
    }

    if (clipBottomLeft) {
      path.lineTo(outer.blRadiusX, outer.blRadiusY);
    } else {
      path.moveTo(outer.blRadiusX, outer.blRadiusY);
    }

    if (clipTopLeft) {
      path.lineTo(outer.left, outer.top);
      path.arcTo(
        Rect.fromCircle(
          center: Offset(outer.tlRadiusX, outer.tlRadiusY),
          radius: borderRadius.topLeft.x,
        ),
        math.pi,
        math.pi / 2,
        false,
      );
    }

    return path..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
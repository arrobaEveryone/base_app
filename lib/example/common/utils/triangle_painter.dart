import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  final Color color;
  TrianglePainter(this.color);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final path = Path();
    path.moveTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
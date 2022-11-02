import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CollapsedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 15
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(size.width, size.height),
        const [
          Color(0xFFE6FFFA),
          Color(0xFFEBF4FF),
        ],
      );

    var path = Path();

    path.lineTo(0, size.height * 0.9);

    path.lineTo(size.width, size.height * 0.8);
    path.quadraticBezierTo(
      size.width,
      size.height * 0.4,
      size.width * 2,
      size.height * 0.2,
    );
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

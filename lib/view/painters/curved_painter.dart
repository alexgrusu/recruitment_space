import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 15
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(size.width, size.height),
        const [
          Color(0xFFEBF4FF),
          Color(0xFFE6FFFA),
        ],
      );

    var path = Path();

    path.lineTo(0, size.height * 1.8);
    path.quadraticBezierTo(
      -size.width * 0.9,
      size.height * 0.9,
      size.width,
      size.height * 0.9,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

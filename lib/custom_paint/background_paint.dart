import 'package:flutter/material.dart';

class OpenPainter extends CustomPainter {
  Color? color;

  OpenPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color!
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 69.5)
      ..lineTo(0.70 * size.width, 2)
      ..cubicTo(0.74 * size.width, 1, 0.75 * size.width, 0, 0.76 * size.width, 1)
      ..cubicTo(0.80 * size.width, 2, 0.90 * size.width, 2, size.width, 69.5)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..lineTo(0, 69.5);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

import 'dart:math';

import 'package:flutter/material.dart';

class Circledotpainterwidget extends CustomPainter {
  final double angle;
  Circledotpainterwidget(this.angle, {required radius});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Paint dotPaint = Paint()..color = Colors.red;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Draw the circular path
    canvas.drawCircle(center, radius, circlePaint);

    // Calculate the moving dot's position
    final Offset dotPosition = Offset(
      center.dx + radius * cos(angle),
      center.dy + radius * sin(angle),
    );

    // Draw the moving dot
    canvas.drawCircle(dotPosition, 8, dotPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
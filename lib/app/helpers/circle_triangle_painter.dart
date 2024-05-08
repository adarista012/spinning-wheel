import 'dart:math';
import 'package:flutter/material.dart';

class CircleTrianglePainter extends CustomPainter {
  final double angle;
  final double width;
  final Color color;
  final double scrollLen;

  CircleTrianglePainter({
    super.repaint,
    required this.angle,
    required this.width,
    required this.color,
    required this.scrollLen,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    canvas.drawArc(
      Rect.fromCircle(
        center: Offset.zero,
        radius: (width / 2) - 24,
      ),
      angle,
      pi / 4,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(CircleTrianglePainter oldDelegate) =>
      oldDelegate.scrollLen != scrollLen;
}

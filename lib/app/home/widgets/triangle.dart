import 'package:disha_spinning_wheel/app/helpers/triangle_painter.dart';
import 'package:flutter/material.dart';

class Triangle extends StatelessWidget {
  final double width;
  final bool isDissabled;
  const Triangle({
    super.key,
    required this.width,
    required this.isDissabled,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: !isDissabled
          ? MediaQuery.of(context).size.height / 2
          : MediaQuery.of(context).size.height / 2 - ((width * 0.32) / 2 - 20),
      child: CustomPaint(
        size: const Size(16, 16),
        painter: TrianglePainter(),
      ),
    );
  }
}

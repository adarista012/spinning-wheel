import 'package:flutter/material.dart';
import 'package:spinning_wheel/app/data/data.dart';
import 'package:spinning_wheel/app/helpers/circle_triangle_painter.dart';

List<Widget> custompaintList(double width) {
  List<Widget> list = [];
  Data.colorsMap.forEach(
    (color, angle) {
      list.add(
        CustomPaint(
          painter: CircleTrianglePainter(
            color: color,
            angle: angle,
            width: width,
          ),
        ),
      );
    },
  );
  return list;
}

import 'package:disha_spinning_wheel/app/data/data.dart';
import 'package:disha_spinning_wheel/app/helpers/circle_triangle_painter.dart';
import 'package:flutter/material.dart';

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

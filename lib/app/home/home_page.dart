import 'dart:math';
import 'package:disha_spinning_wheel/app/helpers/circle_triangle_painter.dart';
import 'package:disha_spinning_wheel/app/helpers/triangle_painter.dart';
import 'package:disha_spinning_wheel/app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Disha Spinning Wheel'),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Stack(
            alignment: Alignment.center,
            children: [
              TweenAnimationBuilder(
                  tween: Tween<double>(
                    begin: 0,
                    end: _.angle,
                  ),
                  duration: const Duration(milliseconds: 1124),
                  curve: Curves.linear,
                  builder: (_, d, __) {
                    return Transform.rotate(
                      angle: (d),
                      child: Container(
                        width: width - 32,
                        height: width - 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.48),
                              spreadRadius: 8,
                              blurRadius: 16,
                              offset: Offset.zero, // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Stack(
                            children: listOfArcs(width),
                          ),
                        ),
                      ),
                    );
                  }),
              Positioned(
                bottom: MediaQuery.of(context).size.height / 2,
                child: CustomPaint(
                    size: const Size(16, 16), painter: TrianglePainter()),
              ),
              Center(
                child: Container(
                  height: width * 0.32,
                  width: width * 0.32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width / 2),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 3.2,
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: _.disableButton
                        ? null
                        : () async {
                            _.spin(context);
                          },
                    shape: const CircleBorder(),
                    child: const Text(
                      'Spin',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 32.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

List<Widget> listOfArcs(double width) {
  return [
    CustomPaint(
      painter: CircleTrianglePainter(
        color: Colors.amber,
        angle: 2 * pi,
        scrollLen: 1.0,
        width: width,
      ),
    ),
    CustomPaint(
      painter: CircleTrianglePainter(
        color: Colors.green,
        angle: pi / 4,
        scrollLen: 1.0,
        width: width,
      ),
    ),
    CustomPaint(
      painter: CircleTrianglePainter(
          color: Colors.pink, angle: pi / 2, scrollLen: 1.0, width: width),
    ),
    CustomPaint(
      painter: CircleTrianglePainter(
          color: Colors.grey,
          angle: pi * (3 / 4),
          scrollLen: 1.0,
          width: width),
    ),
    CustomPaint(
      painter: CircleTrianglePainter(
          color: Colors.brown, angle: pi, scrollLen: 1.0, width: width),
    ),
    CustomPaint(
      painter: CircleTrianglePainter(
          color: Colors.orange,
          angle: pi * (5 / 4),
          scrollLen: 1.0,
          width: width),
    ),
    CustomPaint(
      painter: CircleTrianglePainter(
          color: Colors.red, angle: pi * (3 / 2), scrollLen: 1.0, width: width),
    ),
    CustomPaint(
      painter: CircleTrianglePainter(
          color: Colors.white,
          angle: pi * (7 / 4),
          scrollLen: 1.0,
          width: width),
    ),
  ];
}

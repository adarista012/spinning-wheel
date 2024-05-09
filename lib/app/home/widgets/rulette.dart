import 'package:disha_spinning_wheel/app/helpers/custom_paint_list.dart';
import 'package:flutter/material.dart';

class Rulette extends StatelessWidget {
  final double width;
  final double end;
  const Rulette({super.key, required this.width, required this.end});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(
        begin: 0,
        end: end,
      ),
      duration: const Duration(
        milliseconds: 1000,
      ),
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
                children: custompaintList(width),
              ),
            ),
          ),
        );
      },
    );
  }
}

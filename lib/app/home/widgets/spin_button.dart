import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:spinning_wheel/app/home/home_controller.dart';

class SpinButton extends StatelessWidget {
  final double width;
  final bool isDissabled;

  const SpinButton({
    super.key,
    required this.width,
    required this.isDissabled,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: isDissabled ? 32 : width * 0.32,
        width: isDissabled ? 32 : width * 0.32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width / 2),
          color: Colors.white,
          border: Border.all(
            color: Colors.black,
            width: 3.2,
          ),
        ),
        child: MaterialButton(
          onPressed: isDissabled
              ? null
              : () => Get.find<HomeController>().spin(context),
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
    );
  }
}

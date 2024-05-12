import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:spinning_wheel/app/home/home_controller.dart';
import 'package:spinning_wheel/app/home/widgets/rulette.dart';
import 'package:spinning_wheel/app/home/widgets/spin_button.dart';
import 'package:spinning_wheel/app/home/widgets/triangle.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Spinning Wheel'),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Rulette(
                width: width,
                end: _.angle,
              ),
              Triangle(
                width: width,
                isDissabled: _.disableButton,
              ),
              SpinButton(
                width: width,
                isDissabled: _.disableButton,
              ),
            ],
          );
        },
      ),
    );
  }
}

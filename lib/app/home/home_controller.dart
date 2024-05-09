import 'dart:math';
import 'package:disha_spinning_wheel/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  double _angle = 0;
  double get angle => _angle;
  bool _disableButton = false;
  bool get disableButton => _disableButton;

  void spin(BuildContext context) {
    _disableButton = true;
    update();
    _angle += (Random().nextDouble() * 2 * pi) + (8 / 4) * pi;
    update();

    // ignore: use_build_context_synchronously
    displayMessage(_angle - (8 / 4) * pi, context);
  }

  void displayMessage(double degrees, BuildContext context) async {
    String? title = getTitle(degrees);
    String? content = getMeaning(degrees);
    await Future.delayed(const Duration(milliseconds: 2824));

    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Color'),
          content: Text(content ?? 'Color meaning'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    _angle = 0;
    update();
    await Future.delayed(const Duration(milliseconds: 2000));

    _disableButton = false;
    update();
  }

  String? getTitle(double degrees) {
    if (degrees > 0 && degrees < (1 / 4) * pi) return 'Orange';
    if (degrees > (1 / 4) * pi && degrees < (1 / 2) * pi) return 'Brown';
    if (degrees > (1 / 2) * pi && degrees < (3 / 4) * pi) return 'Gray';
    if (degrees > (3 / 4) * pi && degrees < pi) return 'Pink';
    if (degrees > pi && degrees < (5 / 4) * pi) return 'Green';
    if (degrees > (5 / 4) * pi && degrees < (3 / 2) * pi) return 'Yellow';
    if (degrees > (3 / 2) * pi && degrees < (7 / 4) * pi) return 'White';
    if (degrees > (7 / 4) * pi && degrees < 6.4) return 'Red';

    return null;
  }

  String? getMeaning(double degrees) {
    if (degrees > 0 && degrees < (1 / 4) * pi) {
      return Data.meaningsMap['Orange'];
    }
    if (degrees > (1 / 4) * pi && degrees < (1 / 2) * pi) {
      return Data.meaningsMap['Brown'];
    }
    if (degrees > (1 / 2) * pi && degrees < (3 / 4) * pi) {
      return Data.meaningsMap['Gray'];
    }
    if (degrees > (3 / 4) * pi && degrees < pi) {
      return Data.meaningsMap['Pink'];
    }
    if (degrees > pi && degrees < (5 / 4) * pi) {
      return Data.meaningsMap['Green'];
    }
    if (degrees > (5 / 4) * pi && degrees < (3 / 2) * pi) {
      return Data.meaningsMap['Yellow'];
    }
    if (degrees > (3 / 2) * pi && degrees < (7 / 4) * pi) {
      return Data.meaningsMap['White'];
    }
    if (degrees > (7 / 4) * pi && degrees < 6.4) {
      return Data.meaningsMap['Red'];
    }
    return null;
  }
}

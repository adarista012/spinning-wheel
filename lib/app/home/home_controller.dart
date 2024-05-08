import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  double _angle = 0;
  double get angle => _angle;
  bool _disableButton = false;
  bool get disableButton => _disableButton;
  void spin(BuildContext context) async {
    _disableButton = true;
    update();
    _angle += Random().nextDouble() * 8;
    update();
    print(_angle);
    // print(_angle % 360);
    // print(((_angle % 360) / 45) * 2);

    update();
    // ignore: use_build_context_synchronously
    displayMessage(_angle, context);
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
    update();
    _angle = 0;
    await Future.delayed(const Duration(milliseconds: 2800));
    _disableButton = false;
    update();
  }

  String? getTitle(double degrees) {
    if (degrees > 0 && degrees < 0.8) {
      return 'Orange';
    }
    if (degrees > 0.8 && degrees < 1.6) {
      return 'Brown';
    }
    if (degrees > 1.6 && degrees < 2.4) {
      return 'Gray';
    }
    if (degrees > 2.4 && degrees < 3.2) {
      return 'Pink';
    }
    if (degrees > 3.2 && degrees < 4) {
      return 'Green';
    }
    if (degrees > 4 && degrees < 4.8) {
      return 'Yellow';
    }
    if (degrees > 4.8 && degrees < 5.6) {
      return 'White';
    }
    if (degrees > 5.6 && degrees < 6.4) {
      return 'Red';
    }
    if (degrees > 6.4 && degrees < 7.2) {
      return 'Orange';
    }
    if (degrees > 7.2 && degrees <= 8) {
      return 'Brown';
    }
    return null;
  }

  String? getMeaning(double degrees) {
    if (degrees > 0 && degrees < 0.8) {
      return 'Is used to heal the lungs and to increase energy levels.';
    }
    if (degrees > 0.8 && degrees < 1.6) {
      return 'Because brown is the color of the earth, it is often used to symbolize nature, autumn, melancholy, or death.';
    }
    if (degrees > 1.6 && degrees < 2.4) {
      return 'The experts suggest that people who drive gray cars dont want to stand out and instead prefer something more subtle.';
    }
    if (degrees > 2.4 && degrees < 3.2) {
      return 'Color psychology suggests that different colors can have an impact on our moods, feelings, and even behaviors. The color pink, for example, is thought to be a calming color associated with love, kindness, and femininity.';
    }
    if (degrees > 3.2 && degrees < 4) {
      return 'Research in color psychology suggests that colors evoke psychological reactions, affecting moods and emotions.Sometimes, these reactions are related to the intensity of a color. In other cases, they are products of experience and cultural influences.';
    }
    if (degrees > 4 && degrees < 4.8) {
      return 'The color yellow can be bright and intense, which is perhaps why it can often invoke such strong feelings. Yellow can quickly grab attention, but it can also be abrasive when overused. It can appear warm and bright, yet it can also lead to visual fatigue.';
    }
    if (degrees > 4.8 && degrees < 5.6) {
      return 'As many of our readers have suggested, the color white can feel fresh and clean. The color is often used to evoke a sense of youth and modernity.';
    }
    if (degrees > 5.6 && degrees < 6.4) {
      return 'Red is a bold, attention-getting color, so preferring this type of car might mean you want to project an image of power, action, and confidence.';
    }
    if (degrees > 6.4 && degrees < 7.2) {
      return 'Is used to heal the lungs and to increase energy levels.';
    }
    if (degrees > 7.2 && degrees <= 8) {
      return 'Because brown is the color of the earth, it is often used to symbolize nature, autumn, melancholy, or death.';
    }
    return null;
  }
}

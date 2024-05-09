import 'dart:math';
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
      return 'Is used to heal the lungs and to increase energy levels.';
    }
    if (degrees > (1 / 4) * pi && degrees < (1 / 2) * pi) {
      return 'Because brown is the color of the earth, it is often used to symbolize nature, autumn, melancholy, or death.';
    }
    if (degrees > (1 / 2) * pi && degrees < (3 / 4) * pi) {
      return 'The experts suggest that people who drive gray cars dont want to stand out and instead prefer something more subtle.';
    }
    if (degrees > (3 / 4) * pi && degrees < pi) {
      return 'Color psychology suggests that different colors can have an impact on our moods, feelings, and even behaviors. The color pink, for example, is thought to be a calming color associated with love, kindness, and femininity.';
    }
    if (degrees > pi && degrees < (5 / 4) * pi) {
      return 'Research in color psychology suggests that colors evoke psychological reactions, affecting moods and emotions.Sometimes, these reactions are related to the intensity of a color. In other cases, they are products of experience and cultural influences.';
    }
    if (degrees > (5 / 4) * pi && degrees < (3 / 2) * pi) {
      return 'The color yellow can be bright and intense, which is perhaps why it can often invoke such strong feelings. Yellow can quickly grab attention, but it can also be abrasive when overused. It can appear warm and bright, yet it can also lead to visual fatigue.';
    }
    if (degrees > (3 / 2) * pi && degrees < (7 / 4) * pi) {
      return 'As many of our readers have suggested, the color white can feel fresh and clean. The color is often used to evoke a sense of youth and modernity.';
    }
    if (degrees > (7 / 4) * pi && degrees < 6.4) {
      return 'Red is a bold, attention-getting color, so preferring this type of car might mean you want to project an image of power, action, and confidence.';
    }
    return null;
  }
}

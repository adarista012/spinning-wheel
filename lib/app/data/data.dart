import 'dart:math';
import 'package:flutter/material.dart';

class Data {
  static Map<Color, double> colorsMap = {
    Colors.amber: 2 * pi,
    Colors.green: (1 / 4) * pi,
    Colors.pink: (1 / 2) * pi,
    Colors.grey: (3 / 4) * pi,
    Colors.brown: pi,
    Colors.orange: (5 / 4) * pi,
    Colors.red: (3 / 2) * pi,
    Colors.white: (7 / 4) * pi,
  };
  static Map<String, String> meaningsMap = {
    'Orange': 'Is used to heal the lungs and to increase energy levels.',
    'Brown':
        'Because brown is the color of the earth, it is often used to symbolize nature, autumn, melancholy, or death.',
    'Gray':
        'The experts suggest that people who drive gray cars dont want to stand out and instead prefer something more subtle.',
    'Pink':
        'Color psychology suggests that different colors can have an impact on our moods, feelings, and even behaviors. The color pink, for example, is thought to be a calming color associated with love, kindness, and femininity.',
    'Green':
        'Research in color psychology suggests that colors evoke psychological reactions, affecting moods and emotions.Sometimes, these reactions are related to the intensity of a color. In other cases, they are products of experience and cultural influences.',
    'Yellow':
        'The color yellow can be bright and intense, which is perhaps why it can often invoke such strong feelings. Yellow can quickly grab attention, but it can also be abrasive when overused. It can appear warm and bright, yet it can also lead to visual fatigue.',
    'White':
        'As many of our readers have suggested, the color white can feel fresh and clean. The color is often used to evoke a sense of youth and modernity.',
    'Red':
        'Red is a bold, attention-getting color, so preferring this type of car might mean you want to project an image of power, action, and confidence.',
  };
}

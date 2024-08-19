import 'dart:math' as math;

import 'package:flutter/material.dart';

class BMI {
  double? bmiIndex;

  void calculateBMI(int weight, double height) {
    bmiIndex = weight / math.pow((height / 100), 2);
  }

  String bmiStatueText() {
    if (18.5 > bmiIndex!)
      return 'UNDER WEIGHT';
    else if (bmiIndex! > 24.9)
      return 'OVER WEIGHT';
    else
      return 'NORMAL';
  }

  String bmiAdviceText() {
    if (18.5 > bmiIndex!)
      return 'Go to KFC!';
    else if (bmiIndex! > 24.9)
      return 'Go to gym!';
    else
      return 'You have a normal body. Good job!';
  }

  Color bmiStatueColor() {
    if (18.5 > bmiIndex!)
      return Colors.deepOrange;
    else if (bmiIndex! > 24.9)
      return Colors.red;
    else
      return Colors.green;
  }
}

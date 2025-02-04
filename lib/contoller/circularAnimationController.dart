import 'dart:math';

import 'package:flutter/material.dart';

class CircularAnimationController {
  late AnimationController controller;
  late Animation<double> animation;

  CircularAnimationController(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 3),
    )..repeat(); // Loop the animation

    animation = Tween<double>(begin: 0, end: 2 * pi).animate(controller);
  }

  void dispose() {
    controller.dispose();
  }
}

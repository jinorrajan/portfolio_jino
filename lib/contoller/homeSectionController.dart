import 'package:flutter/material.dart';

class HomesectionController with ChangeNotifier {
  late AnimationController animationController;
  late Animation<double> circleSizeAnimation;

  HomesectionController(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 2),
    );

    // Define animation tween
    circleSizeAnimation = Tween<double>(begin: 150, end: 180).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Start infinite animation loop
    animationController.repeat(reverse: true);
  }

  void disposeController() {
    animationController.dispose();
  }
}

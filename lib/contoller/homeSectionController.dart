import 'package:flutter/material.dart';

class HomesectionController extends ChangeNotifier {
  late AnimationController animationController;
  late Animation<double> circleSizeAnimation;
  bool isInitialized = false;
  Size screenSize = Size.zero;

  HomesectionController(TickerProvider vsync, Size initialSize) {
    initializeController(vsync, initialSize);
  }

  void initializeController(TickerProvider vsync, Size newSize) {
    if (isInitialized) return; // Prevent multiple initializations
    isInitialized = true;
    screenSize = newSize;

    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 2),
    );

    _updateAnimation(newSize);

    animationController.repeat(reverse: true);
    notifyListeners();
  }

  void updateScreenSize(Size newSize) {
    if (screenSize != newSize) {
      screenSize = newSize;
      _updateAnimation(newSize);
    }
  }

  void _updateAnimation(Size newSize) {
    double minSize = newSize.width * 0.10;
    double maxSize = newSize.width * 0.13;

    circleSizeAnimation = Tween<double>(begin: minSize, end: maxSize).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    notifyListeners();
  }

  void disposeController() {
    animationController.dispose();
    super.dispose();
  }
}

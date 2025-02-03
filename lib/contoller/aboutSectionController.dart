import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AboutSectionController extends ChangeNotifier {
  late AnimationController _animationController;
  final TickerProvider vsync;

  AboutSectionController({required this.vsync}) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  Widget buildRotatingCircle() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return CircularProgressIndicator(
          value: _animationController.value,
          strokeWidth: 6,
          valueColor: const AlwaysStoppedAnimation<Color>(AppColor.textColorIron),
          backgroundColor: AppColor.backGroundColor1,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

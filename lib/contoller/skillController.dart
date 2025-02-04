import 'package:flutter/material.dart';

class SkillController {
  final ValueNotifier<int> currentIndexNotifier = ValueNotifier<int>(0);

  void updateIndex(int index) {
    currentIndexNotifier.value = index; // Update the current index
  }

  void dispose() {
    currentIndexNotifier.dispose();
  }
}

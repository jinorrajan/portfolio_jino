import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HoverController extends ChangeNotifier implements ValueListenable<bool> {
  final Map<String, bool> _hoverStates =
      {}; // Tracks hover state for each button
  bool _isHoveredss = false;
  double _scale = 1.0;

  late AnimationController _animationController;

  HoverController(TickerProvider vsync) {
     _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: vsync,
    );
    _shrinkToNormalSize();
  }

  void _shrinkToNormalSize() async {
    await Future.delayed(const Duration(milliseconds: 200)); 
    _scale = 1.0;
    notifyListeners();
  }

  bool get isHovereds => _isHoveredss;

  void onHover(bool hovering) {
    _isHoveredss = hovering;
    _scale = hovering ? 0.96 : 1.0;
    notifyListeners();
  }

  double getButtonScale() => _scale;

  List<Color> getButtonGradientColors() {
    return _isHoveredss
        ? [
            AppColor.buttonGradientColorIris,
            AppColor.buttonGradientColorCloudBurst
          ]
        : [
            AppColor.buttonGradientColorIris,
            AppColor.buttonGradientColorCloudBurst
          ];
  }

  Color getButtonGradientShadowColors() {
    return !_isHoveredss
        ? AppColor.buttonGradientColorIris
        : AppColor.buttonGradientColorIris;
  }

  Offset getButtonGradientShadowOffset() {
    return _isHoveredss ? const Offset(0, 0) : const Offset(0, 5);
  }

   BoxShadow getButtonBoxShadow() {
    return BoxShadow(
      color: getButtonGradientShadowColors(),
      spreadRadius: _isHoveredss ? 3 : 3,
      blurRadius: _isHoveredss ? 6 : 6,
      offset: getButtonGradientShadowOffset(),
    );
  }

  void disposeController() {
    _animationController.dispose();
  }

  // Get the hover state of any button (returns true if any button is hovered)
  @override
  bool get value {
    return _hoverStates.values.contains(true); // If any button is hovered
  }

  // Returns true if the button with the given key is hovered
  bool isHovered(String buttonKey) => _hoverStates[buttonKey] ?? false;

  // Updates the hover state for a specific button
  void setHovered(String buttonKey, bool isHovered) {
    if (_hoverStates[buttonKey] != isHovered) {
      _hoverStates[buttonKey] = isHovered;
      notifyListeners(); // Notify listeners when the hover state changes
    }
  }
}

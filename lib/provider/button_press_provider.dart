import 'package:flutter/material.dart';

class ButtonPressProvider with ChangeNotifier {
  bool _isPressed = false;

  bool get isPressed => _isPressed;

  void press() {
    _isPressed = true;
    notifyListeners();
  }

  void release() {
    _isPressed = false;
    notifyListeners();
  }
}

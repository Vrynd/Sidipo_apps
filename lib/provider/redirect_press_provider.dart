import 'package:flutter/material.dart';

class RedirectPressProvider with ChangeNotifier {
  final Map<String, bool> _pressed = {};

  bool isPressed(String key) => _pressed[key] ?? false;

  void press(String key) {
    _pressed[key] = true;
    notifyListeners();
  }

  void release(String key) {
    _pressed[key] = false;
    notifyListeners();
  }
}

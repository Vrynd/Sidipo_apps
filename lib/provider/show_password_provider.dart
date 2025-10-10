import 'package:flutter/material.dart';

class ShowPasswordProvider extends ChangeNotifier {
  bool _showPassword = true;
  bool get showHide => _showPassword;

  set showHide(bool value) {
    _showPassword = value;
    notifyListeners();
  }
}
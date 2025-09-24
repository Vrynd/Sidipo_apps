import 'package:flutter/material.dart';

class ShowHidePasswordProvider extends ChangeNotifier {
  bool _showHidePassword = true;
  bool get showHide => _showHidePassword;

  set showHide(bool value) {
    _showHidePassword = value;
    notifyListeners();
  }
}
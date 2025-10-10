import 'package:flutter/material.dart';
import 'package:posyandu_digital_app/firebase_auth_status.dart';
import 'package:posyandu_digital_app/models/profile.dart';
import 'package:posyandu_digital_app/service/firebase_auth_service.dart';

class FirebaseAuthProvider extends ChangeNotifier {
  final FirebaseAuthService _service;

  FirebaseAuthProvider(this._service);

  String? _message;
  Profile? _profile;
  FirebaseAuthStatus _authStatus = FirebaseAuthStatus.unauthenticated;

  Profile? get profile => _profile;
  String? get message => _message;
  FirebaseAuthStatus get authStatus => _authStatus;

  Future createAccount(String fullname, String email, String password) async {
    try {
      _authStatus = FirebaseAuthStatus.creatingAccount;
      notifyListeners();

      await _service.createUser(fullname, email, password);
      _authStatus = FirebaseAuthStatus.accountCreated;
      _message = "Pembuatan Akun Berhasil";
    } catch (e) {
      _message = e is String ? e : e.toString();
      _authStatus = FirebaseAuthStatus.error;
    }
    notifyListeners();
  }

  Future signInUser(String email, String password) async {
    try {
      _authStatus = FirebaseAuthStatus.authenticating;
      notifyListeners();

      final result = await _service.signInUser(email, password);
      final uid = result.user?.uid;

      if (uid != null) {
        _profile = await _service.getProfile(uid);
      }

      _authStatus = FirebaseAuthStatus.authenticated;
      _message = "Login Berhasil";
    } catch (e) {
      _message = e is String ? e : e.toString();
      _authStatus = FirebaseAuthStatus.error;
    }
    notifyListeners();
  }

  Future resetPassword(String email) async {
    try {
      _authStatus = FirebaseAuthStatus.ressetingPassword;
      notifyListeners();

      await _service.resetPassword(email);
      _authStatus = FirebaseAuthStatus.passwordResetEmailSent;
      _message = "Link reset kata sandi sudah dikirim ke email anda";
    } catch (e) {
      _message = e is String ? e : e.toString();
      _authStatus = FirebaseAuthStatus.error;
    }

    notifyListeners();
  }

  Future signOutUser() async {
    try {
      _authStatus = FirebaseAuthStatus.signingOut;
      notifyListeners();

      await _service.signOut();
      _authStatus = FirebaseAuthStatus.unauthenticated;
      _profile = null;
      _message = "Logout Berhasil";
    } catch (e) {
      _message = e is String ? e : e.toString();
      _authStatus = FirebaseAuthStatus.error;
    }
    notifyListeners();
  }

  Future updateProfile() async {
    try {
      final user = await _service.userChanges();
      if (user != null) {
        _profile = await _service.getProfile(user.uid);
      }
      notifyListeners();
    } catch (e) {
      _message = "Gagal memperbarui profil";
      _authStatus = FirebaseAuthStatus.error;
    }
    notifyListeners();
  }
}

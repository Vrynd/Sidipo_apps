import 'package:flutter/material.dart';
import 'package:sidipo_apps/firebase_auth_status.dart';
import 'package:sidipo_apps/models/user_profile.dart';
import 'package:sidipo_apps/service/firebase_auth_service.dart';

class FirebaseAuthProvider extends ChangeNotifier {
  final FirebaseAuthService _service;
  FirebaseAuthProvider(this._service);

  String? _message;
  UserProfile? _profile;
  FirebaseAuthStatus _authStatus = FirebaseAuthStatus.unauthenticated;

  UserProfile? get profile => _profile;
  String? get message => _message;
  FirebaseAuthStatus get authStatus => _authStatus;

  Future createAccount(String fullname, String email, String password) async {
    try {
      _authStatus = FirebaseAuthStatus.creatingAccount;
      notifyListeners();

      await _service.createUser(fullname, email, password);
      _authStatus = FirebaseAuthStatus.accountCreated;
      _message = "Akun berhasil dibuat, login untuk melanjutkan";
    } catch (e) {
      _message = e.toString();
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
      _message = "Login berhasil, selamat datang ${_profile?.fullname}";
    } catch (e) {
      _message = e.toString();
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
      _message = "Logout berhasil, selamat tinggal";
    } catch (e) {
      _message = e.toString();
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

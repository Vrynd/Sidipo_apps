import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:posyandu_digital_app/models/profile.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuthService(FirebaseAuth? auth)
    : _auth = auth ??= FirebaseAuth.instance;

  Future<UserCredential> createUser(
    String fullname,
    String email,
    String password,
  ) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = result.user;
      if (user != null) {
        final profile = Profile(
          uid: user.uid,
          fullname: fullname,
          email: email,
          photoUrl: null,
        );
        await _firestore
            .collection("users")
            .doc(user.uid)
            .set(profile.toJson());
      }
      return result;
    } on FirebaseAuthException catch (e) {
      final errorMessage = switch (e.code) {
        "email-already-in-use" =>
          "Email sudah digunakan. Silakan gunakan email lain",
        "invalid-email" => "Format email tidak valid",
        "operation-not-allowed" => "Terjadi kesalahan. Silakan coba lagi nanti",
        "weak-password" =>
          "Kata sandi terlalu lemah. Gunakan kombinasi huruf dan angka",
        _ => "Registrasi gagal. Silakan coba lagi",
      };
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<UserCredential> signInUser(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result;
    } on FirebaseAuthException catch (e) {
      final errorMessage = switch (e.code) {
        "invalid-email" => "Format email tidak valid",
        "user-disabled" => "Akun ini telah dinonaktifkan",
        "user-not-found" => "Email tidak terdaftar",
        "wrong-password" => "Email atau kata sandi salah",
        _ => "Login gagal, Silakan coba lagi",
      };
      throw errorMessage;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw "Logout gagal. Silakan coba lagi";
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw "Gagal mengirim email reset kata sandi";
    }
  }

  Future<Profile?> getProfile(String uid) async {
    try {
      final snapshot = await _firestore.collection("users").doc(uid).get();
      if (snapshot.exists) {
        return Profile.fromJson(snapshot.data()!);
      }
      return null;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<User?> userChanges() => _auth.userChanges().first;
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sidipo_apps/models/user_profile.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuthService(FirebaseAuth? auth)
    : _auth = auth ?? FirebaseAuth.instance;

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
        final userProfile = UserProfile(
          uid: user.uid,
          fullname: fullname,
          email: email,
          photoUrl: null,
        );

        await _firestore
            .collection("users")
            .doc(user.uid)
            .set(userProfile.toJson());
      }

      return result;
    } on FirebaseAuthException catch (e) {
      final errorMessage = switch (e.code) {
        "email-already-in-use" =>
          "Email sudah digunakan. Silakan gunakan email lain",
        "invalid-email" => "Format email tidak valid",
        "operation-not-allowed" => "Terjadi kesalahan. Silakan coba lagi nanti",
        "weak-password" =>
          "Password terlalu lemah. Gunakan kombinasi huruf dan angka",
        _ => "Registrasi gagal. Silakan coba lagi",
      };
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e);
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
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception("Logout gagal. Silakan coba lagi");
    }
  }

  Future<UserProfile?> getProfile(String uid) async {
    try {
      final snapshot = await _firestore.collection("users").doc(uid).get();
      if (snapshot.exists) {
        return UserProfile.fromJson(snapshot.data()!);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> userChanges() => _auth.userChanges().first;
}

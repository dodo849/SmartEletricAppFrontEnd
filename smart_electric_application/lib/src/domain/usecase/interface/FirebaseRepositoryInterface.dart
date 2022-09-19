import 'package:firebase_auth/firebase_auth.dart';

/// Firebase Authentication Repository Interface
abstract class FirebaseRepositoryInterface {
  Future<bool?> signup(email, password);
  Future<bool?> login(email, password);
  Future<bool> logout();
  Future<void> sendEmailVerification();
  User? getUser();
}

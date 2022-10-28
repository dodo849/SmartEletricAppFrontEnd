import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_electric_application/src/config/Result.dart';

/// Firebase Authentication Repository Interface
abstract class FirebaseRepositoryInterface {
  Future<Result<bool, String>> signup(email, password);
  Future<Result<bool, String>> login(email, password);
  Future<Result<bool, String>> logout();
  Future<void> sendEmailVerification();
  User? getUser();
  Future<Result<String, String>> getIdToken();
  Future<Result<String, String>> getUid();
}

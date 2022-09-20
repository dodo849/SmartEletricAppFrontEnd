import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_electric_application/src/config/Result.dart';

/// Firebase Authentication Repository Interface
abstract class FirebaseRepositoryInterface {
  Future<Result<bool, Exception>> signup(email, password);
  Future<Result<bool, Exception>> login(email, password);
  Future<Result<bool, Exception>> logout();
  Future<void> sendEmailVerification();
  User? getUser();
}

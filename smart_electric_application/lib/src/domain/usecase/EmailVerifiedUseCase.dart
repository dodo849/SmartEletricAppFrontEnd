import 'package:firebase_auth/firebase_auth.dart';

class EmailVerifiedUseCase {
  Future<void> execute() async {

    await FirebaseAuth.instance.signOut();

    User? user = FirebaseAuth.instance.currentUser;

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    print("user $user");

    // if (user != null && !user.emailVerified) {
    //   await user.sendEmailVerification();
    // }
  }
}

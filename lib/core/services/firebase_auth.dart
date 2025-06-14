import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:fruits_hub_dashboard/core/services/app_user.dart';
import 'package:fruits_hub_dashboard/core/services/mains/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final auth = FirebaseAuth.instance;

  @override
  Future<AppUser> signIn(String email, String password) async {
    // Check if the provided credentials match your hardcoded values

    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return AppUser(id: credential.user!.uid, email: credential.user!.email!);
    } on FirebaseAuthException catch (e) {
      log(
        "Error in FirebaseAuthServices.signInWithEmailAndPassword: $e code: ${e.code} message: ${e.message} ",
      );
      if (e.code == 'user-not-found') {
        throw "User not found";
      } else if (e.code == 'wrong-password') {
        throw "Wrong password";
      } else if (e.code == 'network-request-failed') {
        throw "Network request failed";
      } else if (e.code == 'invalid-email') {
        throw "Invalid email";
      } else {
        throw "Something went wrong";
      }
    }
  }
}

bool isUserLoggedIn() {
  return FirebaseAuth.instance.currentUser != null;
}

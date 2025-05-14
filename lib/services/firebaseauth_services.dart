import 'dart:developer';
import 'package:ecommerceapp/app/app.locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

class FirebaseAuthServices {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final navigationService = locator<NavigationService>();

  Future login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    }
  }

  Future signUp(String email, String password) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log("ERROR IN AUTH ${e.toString()}");
    }
  }
}

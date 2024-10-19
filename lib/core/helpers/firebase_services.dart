import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruietecommerceapp/core/errors/exepciton.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log("error occurred in FirebaseServices.createUserWithEmailAndPassword ${e.code}");
        throw CustomExepciton(message: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        throw CustomExepciton(
            message: "The account already exists for that email.");
      } else {
        throw CustomExepciton(message: "Something went wrong");
      }
    } catch (e) {
      log("error occurred in FirebaseServices.createUserWithEmailAndPassword ${e.toString()}");
      throw CustomExepciton(message: e.toString());
    }
  }

  Future<User> signInWithEmailAndPasswrod(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("error occurred in FirebaseServices.signInWithEmailAndPassword ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomExepciton(message: "Incorrect email or password");
      } else if (e.code == 'wrong-password') {
        throw CustomExepciton(message: "Incorrect email or password");
      } else {
        throw CustomExepciton(message: "something went wrong");
      }
    } catch (e) {
      log("error occurred in FirebaseServices.signInWithEmailAndPassword ${e.toString()}");
      throw CustomExepciton(message: e.toString());
    }
  }

  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential))
        .user!;
  }

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}

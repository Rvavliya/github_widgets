// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gallery/src/utils/database/hive/hive.dart';
import 'package:flutter_gallery/src/utils/loader.dart';
import 'package:flutter_gallery/src/view/authentication/login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

final GoogleSignIn _googleSignin = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

class ThirdParty {
  //  google cloud api
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
    clientId: Platform.isIOS
        ? "54725225113-3pkn1b2h7lsebu0fdpgl3q76j40j16gu.apps.googleusercontent.com"
        : "",
  );

  /// google signOut
  static Future<void> googleSignOut() async {
    try {
      await _googleSignin.signOut().then((value) {
        if (kDebugMode) {
          log(_auth.currentUser?.email.toString() ?? "");
        }
      });
    } catch (e) {
      log('GoogleSignInError: $e');
    }
  }

  /// apple sign in
  ///   Notes: first go to x code --> signin & capablity --> add apple signIn.

  static Future signInWithGoogle() async {
    try {
      // Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        log('Google Sign-In canceled by user.');
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Save user data to Hive
      if (userCredential.user != null) {
        HiveUtils.set(HiveKeys.loginEmail, userCredential.user?.email);
        HiveUtils.set(
            HiveKeys.loginDisplayName, userCredential.user?.displayName);

        if (kDebugMode) {
          HiveUtils.set(HiveKeys.userName, userCredential.user?.displayName);
          HiveUtils.set(HiveKeys.loginEmail, userCredential.user?.email);
          HiveUtils.set(HiveKeys.phoneNumber, userCredential.user?.phoneNumber);
          log('Successfully signed in with Google: ${userCredential.user!.displayName}');
          log('User data saved to Hive: ${userCredential.user?.email}, ${userCredential.user?.displayName}');
        }
        return userCredential;
      } else {
        if (kDebugMode) {
          log('Google Sign-In failed.');
        }
      }
    } on FirebaseAuthException catch (e) {
      log("FirebaseAuthException: ${e.toString()}");
      if (kDebugMode) {}
    }
  }

  static Future<UserCredential?> signInWithApple() async {
    try {
      final result = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      if (result == null) {
        return null;
      }
      // Check if the user canceled the sign-in
      if (result.authorizationCode == null && result.identityToken == null) {
        log('Apple Sign-In canceled by user.');
        return null;
      }

      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: result.identityToken,
        accessToken: result.authorizationCode,
      );
      if (result.email != null) {
        HiveUtils.set(HiveKeys.loginEmail, result.email);
        HiveUtils.set(HiveKeys.loginDisplayName, result.givenName);

        if (kDebugMode) {
          log('Successfully signed in with Google: ${result.givenName}');
          log('User data saved to Hive: ${result.email}, ${result.givenName}');
        }
      } else {
        if (kDebugMode) {
          log('Google Sign-In failed.');
        }
      }
      return await _auth.signInWithCredential(oauthCredential);
    } on SignInWithAppleAuthorizationException catch (e) {
      // Handle specific exception for Apple Sign In
      debugPrint('AppleSignInError: $e');
      return null;
    } on PlatformException catch (e) {
      // Handle other platform exceptions
      debugPrint('AppleSignInError: $e');
      return null;
    } catch (e) {
      // Handle generic exception
      log("Error signing in with Apple: $e");
      debugPrint('AppleSignInError: $e');
      return null;
    }
  }

  static Future<void> appleSignOut() async {
    try {
      await _auth.signOut();
      log('User signed out successfully');
    } catch (error) {
      log('Error signing out: $error');
    }
  }

  /// whithout save in hive to sign in google
  static Future<UserCredential?> signInWithGoogle1() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      if (kDebugMode) {
        log('Google Sign-In failed.');
      }

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
      return null;
    }
  }

  /// all authentication signout
  static Future signOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      await _auth.signOut();
      await _googleSignin
          .signOut(); // Sign out from Google if signed in with Google
      await Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
      log('User signed out successfully');
    } catch (error) {
      log('Error signing out: $error');
    }
  }

  /// sign in with email
  static Future signInWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!userCredential.user!.emailVerified) {
        Loader.hide();
        Fluttertoast.showToast(
          msg: 'Please verify your email before signing in.',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        Loader.hide();
        HiveUtils.set(HiveKeys.loginEmail, userCredential.user!.email);
        log(HiveUtils.get(HiveKeys.loginEmail));
        // Fluttertoast.showToast(
        //   msg: 'User signed in: ${userCredential.user!.email}',
        //   toastLength: Toast.LENGTH_LONG,
        //   gravity: ToastGravity.BOTTOM,
        // );
        return userCredential.user;
      }
    } catch (e) {
      Loader.hide();

      String errorMessage = '';

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'invalid-email':
            errorMessage = 'Invalid email address';
            break;
          case 'invalid-credential':
            errorMessage = 'Invalid email address or password';
            break;
          case 'INVALID_LOGIN_CREDENTIALS':
            errorMessage = 'Invalid email address or password';
            break;
          case 'user-disabled':
            errorMessage = 'User account has been disabled';
            break;
          case 'user-not-found':
            errorMessage = 'User not found';
            break;
          case 'wrong-password':
            errorMessage = 'Invalid password';
            break;
          default:
            errorMessage = 'Something went wrong';
        }
      } else {
        errorMessage = 'Something went wrong';
      }

      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  static Future signUpWithEmail({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Update user profile with the provided name
      await userCredential.user?.updateDisplayName(name);

      // Send email verification
      await userCredential.user?.sendEmailVerification();

      Loader.hide();

      Fluttertoast.showToast(
        msg:
            'Verification email sent. Please check your inbox and verify your email.',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } catch (e) {
      Loader.hide();

      if (e is FirebaseAuthException) {
        String errorMessage = '';

        switch (e.code) {
          case 'email-already-in-use':
            errorMessage = 'The account already exists for that email.';
            break;
          case 'invalid-email':
            errorMessage = 'The email address is not valid.';
            break;

          default:
            errorMessage = 'Something went wrong';
        }

        Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      } else {
        Fluttertoast.showToast(
          msg: 'Somthing went wrong',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
        );
      }
    }
  }

// forgot password
  static Future forgotPassword(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }
}

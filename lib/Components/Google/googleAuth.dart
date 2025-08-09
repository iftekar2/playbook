import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:playbook/Components/Google/googleAuthDatabase.dart';
import 'package:playbook/Pages/homePage.dart';

class GoogleAuth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

      // Fix for google_sign_in ^7.1.0: Use named parameters
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: <String>['email', 'profile'],
      );

      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();

      // Check if user cancelled the sign-in
      if (googleSignInAccount == null) {
        return;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential result = await firebaseAuth.signInWithCredential(
        credential,
      );
      User? userDetail = result.user;

      if (userDetail != null) {
        Map<String, dynamic> userInfoMap = {
          "email": userDetail.email,
          "name": userDetail.displayName,
          "imageUrl": userDetail.photoURL,
          "id": userDetail.uid,
        };

        await Googleauthdatabase().addUser(userDetail.uid, userInfoMap);

        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        }
      }
    } catch (e) {
      print("Error during Google Sign-In: $e");
      // Handle error appropriately
    }
  }
}

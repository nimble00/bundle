import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/controllers/existcheck.dart';
import 'package:flutter_app/buyer/views/loginpage.dart';
import 'package:flutter_app/startpage.dart';
import 'package:flutter_app/globals.dart' as globals;

class AuthService {
  bool check = false;
  //Handles Auth
  handleAuth() {
    Firebase.initializeApp();
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ExistCheck();
          } else {
            if (globals.userType == '') {
              return StartPage();
            } else {
              return LoginPage();
            }
          }
        });
  }

  //Sign out
  signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
  }

  signOutFirebase(BuildContext context) {
    FirebaseFirestore.instance
        .collection(globals.userType)
        .doc(FirebaseAuth.instance.currentUser.phoneNumber)
        .update({'loggedIn': false});
    globals.userType = '';
  }

  //SignIn
  signIn(AuthCredential authCreds) {
    FirebaseAuth.instance.signInWithCredential(authCreds);
  }

  signInWithOTP(smsCode, verId) {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }
}

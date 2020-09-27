import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/controllers/existcheck.dart';
import 'package:flutter_app/buyer/views/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            return LoginPage();
          }
        });
  }

  // Does User Exist?
  doesUserExist(phoneNum) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(phoneNum)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('DOCUMENT EXISTS IN THE DATABASE');
        check = true;
        return true;
      }
      return false;
    });
  }

  //Sign out
  signOut() {
    FirebaseAuth.instance.signOut();
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

  User globalUser;

  getCurrentUser() {
    User user = FirebaseAuth.instance.currentUser;
    globalUser = user;
    return globalUser;
  }
}

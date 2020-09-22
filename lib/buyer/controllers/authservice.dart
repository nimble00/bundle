import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/controllers/existcheck.dart';
// import 'package:flutter_app/controllers/existcheck.dart';
import 'package:flutter_app/buyer/views/adduserinfo.dart';
import 'package:flutter_app/buyer/views/bhome.dart';
import 'package:flutter_app/buyer/views/loginpage.dart';
// import 'package:flutter_app/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  bool check = false;
  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
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
    Firestore.instance
        .collection('users')
        .document(phoneNum)
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
    AuthCredential authCreds = PhoneAuthProvider.getCredential(
        verificationId: verId, smsCode: smsCode);
    signIn(authCreds);
  }

  FirebaseUser globalUser;

  getCurrentUser() async {
    FirebaseUser user = (await FirebaseAuth.instance.currentUser());
    globalUser = user;
    return globalUser;
  }
}

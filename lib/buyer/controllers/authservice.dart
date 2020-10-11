import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/controllers/existcheck.dart';
import 'package:flutter_app/buyer/views/loginpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/partner/views/partner_login.dart';
import 'package:flutter_app/startpage.dart';

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
            if(globals.userType=="buyer")
              return LoginPage();
            else
              return PartnerLoginPage();
          }
        });
  }

  // Does User Exist?
  doesUserExist(phoneNum) {   //partner db krna he
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
  signOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => StartPage(),
      ),
          (route) => false,
    );
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/views/adduserinfo.dart';

class ExistCheck extends StatefulWidget {
  // final String phone;
  // ExistCheck(this.phone);
  @override
  _ExistCheckState createState() => _ExistCheckState();
}

class _ExistCheckState extends State<ExistCheck> {
  Widget _body = CircularProgressIndicator(
    value: 5,
  ); // Default Body
  FirebaseAuth _auth;
  FirebaseUser currentUser;
  bool loading = true;
  String accountStatus;
  String phoneNum;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    print('here outside async');
  }

  _getCurrentUser() async {
    currentUser = await _auth.currentUser();
    print('Hello ' + currentUser.displayName.toString());
    setState(() {
      currentUser != null ? accountStatus = 'Signed In' : 'Not Signed In';
      print("ACCOUNT STATUS: " + accountStatus);
      // user = User.fromFirebaseUser(currentUser);
      print("CURRENT USER: " + currentUser.phoneNumber);
      phoneNum = currentUser.phoneNumber;
      print("PHONE: " + phoneNum);
      _gotoHomeScreen(phoneNum);
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _auth = FirebaseAuth.instance;
  //   _getCurrentUser();
  // }

  // _getCurrentUser() async {
  //   currentUser = await _auth.currentUser();
  //   setState(() {
  //     _gotoHomeScreen(currentUser.phoneNumber);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  _gotoHomeScreen(String phoneN) {
    Firestore.instance
        .collection('users')
        .document(phoneN)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('DOCUMENT EXISTS IN THE DATABASE');
        setState(() => _body = HomePage());
      } else {
        setState(() => _body = AddUser());
      }
      return false;
    });

    // AuthService.getuserPrefEmail().then((email) {
    //   AuthService.email = email;
    //   if (email == null) {
    //     setState(() => _body = LoginScreen());
    //   } else {
    //     AuthService.uid = email;
    //     setState(() => _body = HomeMenuScreen());
    //   }
    // });
  }
}

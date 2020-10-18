import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/views/bhome.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/partner/views/phome.dart';

class ExistCheck extends StatefulWidget {
  @override
  _ExistCheckState createState() => _ExistCheckState();
}

class _ExistCheckState extends State<ExistCheck> {
  // Default Body
  Widget _body = Scaffold(body: Center(child: CircularProgressIndicator()));

  FirebaseAuth _auth;
  User currentUser;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _gotoHomeScreen(_auth.currentUser.phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  _registerUser() {
    // Call the users CollectionReference to add a new user
    if (globals.userType == 'partner') {
      FirebaseFirestore.instance
          .collection('pincodes')
          .doc(globals.pincode)
          .set({
            'userType': globals.userType,
            'pincode': globals.pincode,
            'loggedIn': true
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    return FirebaseFirestore.instance
        .collection(globals.userType)
        .doc(FirebaseAuth.instance.currentUser.phoneNumber)
        .set({
          'userType': globals.userType,
          'pincode': globals.pincode,
          'loggedIn': true
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  _gotoHomeScreen(String phoneN) {
    if (globals.userType != '') {
      print("###################");
      print("###################");
      print("###################");
      print("###################");
      print("USERTYPE IS NOT '' ");
      print("###################");
      print("###################");
      print("###################");
      print("###################");
      FirebaseFirestore.instance
          .collection(globals.userType)
          .doc(phoneN)
          .get()
          .then((value) {
        if (!value.exists) {
          // ##################### REGISTER THE USER #############################
          _registerUser();
          // #####################################################################
        } else {
          FirebaseFirestore.instance
              .collection(globals.userType)
              .doc(phoneN)
              .update({'loggedIn': true});
        }
      });

      if (globals.userType == 'buyer') {
        if (mounted) {
          setState(() => _body = HomePage());
        }
      } else {
        if (mounted) {
          setState(() => _body = PartnerHomepage());
        }
      }
    } else {
      FirebaseFirestore.instance
          .collection('buyer')
          .doc(phoneN)
          .get()
          .then((DocumentSnapshot snapshot) {
        var data = snapshot.data();
        print('phoneN: ' + phoneN + data.toString());
        if (data != null) {
          if (data['loggedIn'] != null && data['loggedIn'] == true) {
            globals.userType = 'buyer';
            setState(() => _body = HomePage());
          } else {
            globals.userType = 'partner';
            setState(() => _body = PartnerHomepage());
          }
        } else {
          globals.userType = 'partner';
          setState(() => _body = PartnerHomepage());
        }
      });
    }
  }
}

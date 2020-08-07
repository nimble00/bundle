import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/views/adduserinfo.dart';

// class ExistCheck extends Widget {
//   handleCheck() {
//     DocumentSnapshot ds;
//     Firestore.instance
//         .collection('users')
//         .document()
//         .get()
//         .then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         print('user exists on the database');
//         ds = documentSnapshot;
//         return HomePage();
//       }
//     });
//     return AddUser();
//   }
// }

class ExistCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DocumentSnapshot ds;
    Firestore.instance
        .collection('users')
        .document()
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('user exists on the database');
        ds = documentSnapshot;
        return HomePage();
      }
    });
    return AddUser();
  }
}

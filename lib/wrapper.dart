import 'package:flutter/material.dart';
import 'package:flutter_app/views/authenticate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/models/user.dart';
// import 'package:flutter_app/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // RETURN EITHER HOME PAGE OR LOGIN PAGE
    // Implement the Check
    return FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            FirebaseUser currUser = snapshot.data; // this is your user instance
            /// is because there is user already logged
            return HomePage(user: currUser);
          }

          /// other way there is no user logged.
          return Authenticate();
        });
  }
}

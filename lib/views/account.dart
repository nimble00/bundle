import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// FirebaseUser globalUser;

class Account extends StatelessWidget {
  final FirebaseUser user;
  Account(this.user);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppBar(title: Text(user.email)),
        Text(user.uid),
        Text('Orders'),
        RaisedButton(
          child: Text('Sign out'),
          onPressed: () => {},
        )
      ],
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/auth.dart';
// import 'package:flutter_app/views/authenticate.dart';
import 'package:flutter_app/views/home.dart';
// import 'package:flutter_app/views/signin.dart';
import 'package:flutter_app/models/user.dart';

// FirebaseUser globalUser;
class Account extends StatefulWidget {
  final FirebaseUser user;
  Account({this.user});
  final AuthService _authService = AuthService();
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  // String username = widget.user.displayName;
  final currUser = User();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppBar(
            // leading: Icon(Icons.account_box, color: Colors.grey),
            title: Text('ID: ' + 'currUser')),
        RaisedButton(
          child: Text('Profile ' + 'username' + " " + 'phone'),
          onPressed: () => {}, // IMPL THE COMPLETE PROFILE PAGE
        ),
        RaisedButton(
          child: Text('Orders'),
          onPressed: () => {}, // IMPL THE COMPLETE ORDERS PAGE
        ),
        RaisedButton(
          child: Text('Payments'),
          onPressed: () => {}, // IMPL THE COMPLETE PAYMENTS PAGE
        ),
        Spacer(flex: 3),
        RaisedButton(
          child: Text('signedIO'),
          onPressed: () async {
            // IMPL THE AUTH SERVICE HERE: DONE!
            dynamic result = await widget._authService.signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            print(result);
            // Navigator.pop(context);
          },
        ),
        Spacer(flex: 1),
      ],
    );
  }
}

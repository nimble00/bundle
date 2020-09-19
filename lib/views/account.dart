import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/controllers/authservice.dart';
// import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/buyer/models/user.dart';

import 'orders.dart';

// FirebaseUser globalUser;
class Account extends StatefulWidget {
  final User user;
  Account({this.user});
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Account',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            color: Colors.white,
            elevation: 10,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text(widget.user.phone),
            onPressed: () => {}, // IMPL THE COMPLETE PROFILE PAGE
          ),
          RaisedButton(
              color: Colors.white,
              elevation: 10,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text('Orders'),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Orders()));
              }),
          // IMPL THE COMPLETE ORDERS PAGE
          RaisedButton(
            color: Colors.white,
            elevation: 10,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text('Payments'),
            onPressed: () => {}, // IMPL THE COMPLETE PAYMENTS PAGE
          ),
          RaisedButton(
            color: Colors.white,
            elevation: 10,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text('Contact Us'),
            onPressed: () => {}, // IMPL THE COMPLETE PAYMENTS PAGE
          ),
          RaisedButton(
            color: Colors.white,
            elevation: 10,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text('Feedback'),
            onPressed: () => {}, // IMPL THE COMPLETE PAYMENTS PAGE
          ),
          Spacer(flex: 4),
          RaisedButton(
            color: Colors.white,
            elevation: 10,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text('Logout'),
            onPressed: () async {
              // IMPL THE AUTH SERVICE HERE: DONE!
              dynamic result = await AuthService().signOut();
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AuthService().handleAuth()));
              // Navigator.pop(context);
              print(result);
              // Navigator.pop(context);
            },
          ),
          // Spacer(flex: 1),
        ],
      ),
    );
  }
}

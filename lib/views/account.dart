import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/authservice.dart';
import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/models/user.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        AppBar(
            // leading: Icon(Icons.account_box, color: Colors.grey),
            title: Text('Account')),
        RaisedButton(
          child: Text(widget.user.phone),
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
          child: Text('Logout'),
          onPressed: () async {
            // IMPL THE AUTH SERVICE HERE: DONE!
            dynamic result = await AuthService().signOut();
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => HomePage()));
            Navigator.pop(context);
            print(result);
            // Navigator.pop(context);
          },
        ),
        Spacer(flex: 1),
      ],
    );
  }
}

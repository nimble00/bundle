import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/controllers/authservice.dart';

class PartnerAccountPage extends StatefulWidget {
  @override
  _PartnerAccountPageState createState() => _PartnerAccountPageState();
}

class _PartnerAccountPageState extends State<PartnerAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            color: Colors.white,
            elevation: 10,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text("widget.user.phone"),
            onPressed: () => {}, // IMPL THE COMPLETE PROFILE PAGE
          ),
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
          RaisedButton(
            color: Colors.white,
            elevation: 10,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text('Testing'),
            onPressed: () => {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => StorageHomePageApp())
//                ),
            }, // IMPL THE COMPLETE PAYMENTS PAGE
          ),
          RaisedButton(
            color: Colors.white,
            elevation: 10,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text('Sign Out'),
            onPressed: () {
              AuthService().signOut(context);
              AuthService().signOutFirebase(context);
            }, // IMPL THE COMPLETE PAYMENTS PAGE
          ),
          Spacer(flex: 4)
          // Spacer(flex: 1),
        ],
      ),
    );
  }
}

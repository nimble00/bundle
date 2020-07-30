import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/auth.dart';
import 'package:flutter_app/views/home.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          // padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Sign-in with Google'),
              onPressed: () async {
                // IMPL THE AUTH SERVICE HERE
                dynamic result = await _authService.handleSignIn();
                if (result == null) {
                  print('error signing in');
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  print("sucessfully signed in");
                  print(result.uid);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
            ),
          ]),
    );
  }
}

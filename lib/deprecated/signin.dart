import 'package:flutter/material.dart';
import 'package:flutter_app/deprecated/auth.dart';
// import 'package:flutter_app/models/user.dart';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Sign-in with Google'),
              onPressed: () async {
                // IMPL THE AUTH SERVICE HERE: DONE!
                dynamic result = await _authService.handleSignIn();
                print('YAHA PE USER HAI ' + result.toString());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(user: result)));
                // if (result == null) {
                //   print('error signing in');
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => HomePage(user: null)));
                // } else {
                //   print("sucessfully signed in");
                //   print(result.uid);
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => HomePage()));
                // }
              },
            ),
          ]),
    );
  }
}

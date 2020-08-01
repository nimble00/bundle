import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/phonelogin.dart';
// import 'package:flutter_app/controllers/auth.dart';
import 'package:flutter_app/views/signin.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'dart:async';
// import 'package:splashscreen/splashscreen.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhoneLogin(),
    );
  }
}

// USEFUL CODE ONLY ABOVE THIS LINE --------------------------------------------

// final GoogleSignIn _googleSignIn = GoogleSignIn();
// final FirebaseAuth _auth = FirebaseAuth.instance;

// Future<FirebaseUser> _handleSignIn() async {
//   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
//   print("signed in " + user.displayName);
//   return user;
// }

// THIS BUTTON BAR WAS TAKEN FORM SHRINE
// ButtonBar(
//               children: <Widget>[
//                 FlatButton(
//                   child: Text('CANCEL'),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(6.0)),
//                   ),
//                   onPressed: () {
//                     _usernameController.clear();
//                     _passwordController.clear();
//                   },
//                 ),
//                 RaisedButton(
//                   child: Text('NEXT'),
//                   elevation: 8.0,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(6.0)),
//                   ),
//                   onPressed: () {
//                     _handleSignIn()
//                         .then((FirebaseUser user) => print(user))
//                         .catchError((e) => print(e));
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             ),
//           ],

// THESE ARE VERY SEXY LOOKING TEXTFIELDS, BUT SADLY, USELESS RIGHT NOW
// TextField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(
//                   labelText: 'Phone',
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                     borderSide: BorderSide(color: Colors.blue, width: 2),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(color: Colors.red[200]),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               TextField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                     borderSide: BorderSide(color: Colors.red, width: 2),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                     borderSide: BorderSide(color: Colors.red),
//                   ),
//                 ),
//                 obscureText: true,
//               ),

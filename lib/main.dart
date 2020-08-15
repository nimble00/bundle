import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/home.dart';
// import 'package:flutter_app/views/home.dart';
// import 'package:flutter_app/views/loginpage.dart';
// import 'package:flutter_app/wrapper.dart';
import 'controllers/authservice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madira',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: Wrapper(),
      // home: LoginPage(),
      home: AuthService().handleAuth(),
//      home: HomePage(),

    );
  }
}

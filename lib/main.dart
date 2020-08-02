import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      // home: Wrapper(),
      home: AuthService().handleAuth(),
    );
  }
}

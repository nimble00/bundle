import 'dart:async';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';
import 'package:flutter_app/startpage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  debugPrint = (String message, {int wrapWidth}) {};
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madira',
      theme: ThemeData(primaryColor: Colors.green, fontFamily: "Google Sans"),
      // home: AuthService().handleAuth(),
      home: StartPage(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_app/wrapper.dart';
=======
import 'package:flutter_app/home.dart';
>>>>>>> ef2fcdf2b3e475b22802ff39b819c5cd1e5aa91a

void main() {
  runApp(MyApp());
}
<<<<<<< HEAD

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madira',
      home: Wrapper(),
    );
  }
}
=======
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Madira',
      home: HomePage(),
    );
  }
}
>>>>>>> ef2fcdf2b3e475b22802ff39b819c5cd1e5aa91a

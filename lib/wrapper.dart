import 'package:flutter/material.dart';
import 'package:flutter_app/views/authenticate.dart';
// import 'package:flutter_app/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // RETURN EITHER HOME PAGE OR LOGIN PAGE
    return Authenticate();
  }
}

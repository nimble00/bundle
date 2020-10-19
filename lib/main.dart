import 'dart:async';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/material.dart';
import 'package:flutter_app/partner/views/phome.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'buyer/controllers/authservice.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();
  _getLocation();
  runApp(MyApp());
}

_getLocation() async {
  // final prefs = await SharedPreferences.getInstance();

  Position position =
      await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

  final coordinates = new Coordinates(position.latitude, position.longitude);

  var addresses =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);

  var first = addresses.first;
  globals.pincode = first.postalCode;
  globals.address = first.addressLine;
  globals.position = position;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Madira',
      theme: ThemeData(primaryColor: Colors.green, fontFamily: "Google Sans"),
      home: AuthService().handleAuth(),
//       home: PartnerHomepage(),
    );
  }
}

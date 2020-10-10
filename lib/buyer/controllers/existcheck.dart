import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/views/bhome.dart';
import 'package:flutter_app/buyer/views/adduserinfo.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ExistCheck extends StatefulWidget {
  @override
  _ExistCheckState createState() => _ExistCheckState();
}

class _ExistCheckState extends State<ExistCheck> {
  String _currentAddress;

  // Default Body
  Widget _body = Scaffold(body: Center(child: CircularProgressIndicator()));

  FirebaseAuth _auth;
  User currentUser;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    _getLocation();
  }

  _getLocation() async {
    // final prefs = await SharedPreferences.getInstance();

    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);

    final coordinates = new Coordinates(position.latitude, position.longitude);

    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    var first = addresses.first;
    _currentAddress = first.addressLine;
    // prefs.setString("pincode", first.postalCode);
    // prefs.setString("address", _currentAddress);
    setState(() {
      globals.pincode = first.postalCode;
      globals.address = _currentAddress;
      globals.position = position;
    });
  }

  _getCurrentUser() {
    currentUser = _auth.currentUser;
    setState(() {
      globals.phoneNumber = currentUser.phoneNumber;
      _gotoHomeScreen(globals.phoneNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  _gotoHomeScreen(String phoneN) {
    globals.user.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() => _body = HomePage());
      } else {
        setState(() => _body = AddUser());
      }
      return false;
    });
  }
}

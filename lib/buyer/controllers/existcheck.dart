import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/views/bhome.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_app/partner/views/phome.dart';

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
    _gotoHomeScreen(_auth.currentUser.phoneNumber);
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
    globals.pincode = first.postalCode;
    globals.address = _currentAddress;
    globals.position = position;
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  _registerUser() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(globals.userType);
    // Call the users CollectionReference to add a new user
    return collectionReference
        .doc(FirebaseAuth.instance.currentUser.phoneNumber)
        .set({'userType': globals.userType, 'pincode': globals.pincode})
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  _gotoHomeScreen(String phoneN) {
    FirebaseFirestore.instance
        .collection(globals.userType)
        .doc(phoneN)
        .get()
        .then((value) {
      if (!value.exists) {
        // ##################### REGISTER THE USER #############################
        _registerUser();
        // #####################################################################
      }
    });
    if (globals.userType == 'buyer') {
      if (mounted) {
        setState(() => _body = HomePage());
      }
    } else {
      if (mounted) {
        setState(() => _body = PartnerHomepage());
      }
    }
  }
}

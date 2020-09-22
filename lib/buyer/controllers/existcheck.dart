import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/views/bhome.dart';
import 'package:flutter_app/buyer/views/adduserinfo.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExistCheck extends StatefulWidget {
  // final String phone;
  // ExistCheck(this.phone);
  @override
  _ExistCheckState createState() => _ExistCheckState();
}

class _ExistCheckState extends State<ExistCheck> {
  String _currentAddress;
  Widget _column;

  Widget _body = Scaffold(
    // appBar: AppBar(
    //   backgroundColor: Colors.white,
    // ),
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
  // Default Body
  FirebaseAuth _auth;
  FirebaseUser currentUser;
  bool loading = true;
  String accountStatus;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    _getLocation();
    print('existcheck.dart :::: here outside async');
  }

  _getLocation() async {
    // bool isLocationEnabled = await isLocationServiceEnabled();
    final prefs = await SharedPreferences.getInstance();
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    debugPrint('location: ${position.latitude}');

    final coordinates = new Coordinates(position.latitude, position.longitude);
    debugPrint('coordinates is: $coordinates');

    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    _currentAddress = first.addressLine;
    prefs.setString("pincode", first.postalCode);
    prefs.setString("address", _currentAddress);
    setState(() {
      globals.pincode = first.postalCode;
      globals.address = _currentAddress;
      globals.position = position;
      _column = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Delivering to:",
            softWrap: true,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            _currentAddress.toString(),
            softWrap: true,
            style: TextStyle(fontSize: 14),
          )
        ],
      );
    });

    // print number of retured addresses
    debugPrint('${addresses.toString()}');
    // print the best address
    debugPrint("${first.featureName} : ${first.addressLine}");
    //print other address names
    debugPrint(
        "Country:${first.countryName} AdminArea:${first.adminArea} SubAdminArea:${first.subAdminArea}");
    //print more address names
    debugPrint("Locality:${first.locality}: Sublocality:${first.subLocality}");
  }

  _getCurrentUser() async {
    currentUser = await _auth.currentUser();
    print('Hello ' + currentUser.displayName.toString());
    setState(() {
      currentUser != null ? accountStatus = 'Signed In' : 'Not Signed In';
      print("ACCOUNT STATUS: " + accountStatus);
      // user = User.fromFirebaseUser(currentUser);
      print("CURRENT USER: " + currentUser.phoneNumber);
      globals.phoneNumber = currentUser.phoneNumber;
      print("PHONE: " + globals.phoneNumber);
      _gotoHomeScreen(globals.phoneNumber);
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _auth = FirebaseAuth.instance;
  //   _getCurrentUser();
  // }

  // _getCurrentUser() async {
  //   currentUser = await _auth.currentUser();
  //   setState(() {
  //     _gotoHomeScreen(currentUser.phoneNumber);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return _body;
  }

  _gotoHomeScreen(String phoneN) {
    globals.user.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('DOCUMENT EXISTS IN THE DATABASE');
        setState(() => _body = HomePage());
      } else {
        setState(() => _body = AddUser());
      }
      return false;
    });

    // AuthService.getuserPrefEmail().then((email) {
    //   AuthService.email = email;
    //   if (email == null) {
    //     setState(() => _body = LoginScreen());
    //   } else {
    //     AuthService.uid = email;
    //     setState(() => _body = HomeMenuScreen());
    //   }
    // });
  }
}

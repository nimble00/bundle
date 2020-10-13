import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/views/bhome.dart';
import 'package:flutter_app/buyer/views/adduserinfo.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_app/partner/views/phome.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:path_provider/path_provider.dart';



import '../../globals.dart';

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
    if(globals.fromStartPage==false){
      //------------------------------------------------------
    }
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

  _getCurrentUser() async {
    currentUser = await _auth.currentUser;
    setState(() {
      globals.phoneNumber = currentUser.phoneNumber;
      String accountStatus = currentUser != null ? 'Signed In' : 'Not Signed In';
      print("ACCOUNT STATUS: " + accountStatus);
      _gotoHomeScreen(globals.phoneNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _body;
  }
  //  -----------------

  Future<void> addCustomer(){

    CollectionReference CustomerCollectionRef;
    if(globals.userType=="buyer") {
      CustomerCollectionRef = FirebaseFirestore.instance.collection('users');
      return CustomerCollectionRef
          .doc(currentUser.phoneNumber)
          .set({
        'orders.no_of_orders': 0,
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    else if(globals.userType=="partner") {
      CustomerCollectionRef = FirebaseFirestore.instance.collection('partner');
      return CustomerCollectionRef
          .doc(currentUser.phoneNumber)
          .set({
        'orders.no_of_orders': 0,
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    return null;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/info.txt');
  }


  Future<String> readData() async {
    try {
      final file = await _localFile;

      String content = await file.readAsString();
      return content;
    } catch (e) {
      return '';
    }
  }

  Future<File> addData(String text) async {
    final file = await _localFile;
    return file.writeAsString('$text');
//    return file.writeAsString('$text\r\n', mode: FileMode.append);
  }

//  -----------------

  _gotoHomeScreen(String phoneN) {

    if(!globals.fromStartPage){
      globals.userType=readData() as String;
    }
    DocumentReference customerRef;
    if(globals.userType=="buyer"){
      customerRef=globals.user;
    }else if(globals.userType=="partner"){
      customerRef=globals.partner;
    }else{
      print("kuch to gadbad he");
    }
    customerRef.get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print(documentSnapshot.data().toString());

        if(documentSnapshot.data()["userType"]=="buyer"){
          globals.userType="buyer";
//          setState(() => _body = HomePage());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }
        else{
          globals.userType="partner";
//          setState(() => _body = PartnerHomepage());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PartnerHomepage(),
            ),
          );
        }
      }
      else {
        debugPrint("addcustomer called");
//        setState(() => _body = AddUser());
        addData(globals.userType);
        addCustomer();
        if(globals.userType=="buyer"){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }else{
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PartnerHomepage()));
        }

      }
      return false;
    });
  }



}
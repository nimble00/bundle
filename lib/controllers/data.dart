// import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:flutter/material.dart';
// Firestore firestore = Firestore.instance;

class AddUser extends StatelessWidget {
  final String name;
  final String pincode;
  final GeoPoint location;
  final int age;

  AddUser({this.name, this.pincode, this.location, this.age});

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = Firestore.instance.collection('users');

    Future<void> addUser() {
      // Call the users CollectionReference to add a new user
      return users
          .add({
            'username': name, // John Doe
            'pincode': pincode, // Stokes and Sons
            'age': age // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return FlatButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}

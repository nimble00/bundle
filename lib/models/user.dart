import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  String uid;
  String email;
  String phone;
  String username;
  String signedIO;
  String pincode;
  String address;
  GeoPoint location;
  User({
    this.uid,
    this.email,
    this.phone,
    this.username,
    this.signedIO,
    this.pincode,
    this.address,
    this.location,
  });
  User.fromFirebaseUser(FirebaseUser user) {
    // this.uid = user.uid;
    this.phone = user.phoneNumber;
  }
}

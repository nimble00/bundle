import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:geolocator/geolocator.dart';

class User {
  String uid;
  String email;
  String phone;
  String username;
  String signedIO;
  String pincode;
  String address;
  GeoPoint location;
  String userType;
  User({
    this.uid,
    this.email,
    this.phone,
    this.username,
    this.signedIO,
    this.pincode,
    this.address,
    this.location,
    this.userType
  });
  User.fromFirebaseUser(User user) {
    // this.uid = user.uid;
    this.phone = user.phone;
  }
}

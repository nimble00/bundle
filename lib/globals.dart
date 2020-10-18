library my_prj.globals;

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_app/buyer/models/item.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_storage/firebase_storage.dart';

//shoping cart list

List<Item> itemList = new List();
List<String> itemName = new List();

Map<String, dynamic> products = new Map();

//user pincode, later work :will update on start of app
String pincode;
Position position;
String address = "";
GeoPoint geopoint = new GeoPoint(48, 60);
String phoneNumber;

// buyer-partner
String userType;

DocumentReference shops =
    FirebaseFirestore.instance.collection('pincodes').doc(pincode);
DocumentReference reference;
DocumentReference user =
    FirebaseFirestore.instance.collection('users').doc(phoneNumber);

DocumentReference partner =
    FirebaseFirestore.instance.collection('partner').doc(phoneNumber);

//list of fav items
List<String> favoriteName = new List();
List<Item> favoritesList;

String category = 'all', filter = 'Distance';
int current = 0;

//---------Storage partner-------
FirebaseStorage storage;

library my_prj.globals;

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_app/buyer/models/item.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_storage/firebase_storage.dart';

//shoping cart list
List<Item> item_list = new List();
List<String> item_name = new List();

Map<String, dynamic> products = new Map();

//user pincode, later work :will update on start of app
String pincode;
Position position;
String address = "";
GeoPoint geopoint = new GeoPoint(48, 60);
String phoneNumber;
DocumentReference shops =
    Firestore.instance.collection('pincodes').document(pincode);
DocumentReference reference;
DocumentReference user =
    Firestore.instance.collection('users').document(phoneNumber);

DocumentReference partner =
Firestore.instance.collection('partner').document(phoneNumber);
//list of fav items
List<String> favorite_name = new List();
List<Item> favorites_list;

String category = 'all', filter = 'Distance';
int current = 0;

//---------Storage partner-------
FirebaseStorage storage;

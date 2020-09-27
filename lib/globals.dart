library my_prj.globals;

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_app/buyer/models/item.dart';
import 'package:geolocator/geolocator.dart';

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
    FirebaseFirestore.instance.collection('pincodes').doc(pincode);
DocumentReference reference;
DocumentReference user =
    FirebaseFirestore.instance.collection('users').doc(phoneNumber);
//list of fav items
List<String> favorite_name = new List();
List<Item> favorites_list;

String category = 'all', filter = 'Distance';
int current = 0;

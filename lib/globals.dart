library my_prj.globals;

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/item.dart';

List<Item> item_list = new List();
Map<String, dynamic> products = new Map();
String pincode = '110016';
DocumentReference reference;
List<String> item_name = new List();
List<String> favorite_name=new List();
GeoPoint geopoint=new GeoPoint(48,60);
String category = 'all', filter = 'Popularity';
int current=0;
String phoneNumber;
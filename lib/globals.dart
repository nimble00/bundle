library my_prj.globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/item.dart';
List<Item>item_list =new List();
Map<String,dynamic>products=new Map();
String pincode='110016';
DocumentReference reference;
List<int>item_index=new List();

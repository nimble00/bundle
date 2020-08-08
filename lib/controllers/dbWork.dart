import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart';

void addItemFromJson(){
  print("start");
  //------------------------Working --------------------------
//
//
//          print("inside");
//          // Call the users CollectionReference to add a new user
//          products
//              .add({
//            'Name': 'Apple', // John Doe
//            'Image': 'assets/Apple.jpg', // Stokes and Sons
//            'Price': 102, // 42
//          });
  //------------------------Working --------------------------
  CollectionReference products = Firestore.instance.collection('products');
  String jsonfile= '{"products":[{"Name":"Mosambi","Price":"149","Image":"assets/Mosambi.jpg"},{"Name":"Apple","Price":"145","Image":"assets/Apple.jpg"},{"Name":"Water","Price":"54","Image":"assets/Water.jpg"},{"Name":"Banana","Price":"20","Image":"assets/Banana.jpg"},{"Name":"Apple","Price":"149","Image":"assets/Apple.jpg"},{"Name":"Pear","Price":"219","Image":"assets/Pear.jpg"},{"Name":"Orange","Price":"99","Image":"assets/Orange.jpg"},{"Name":"Kiwi","Price":"79","Image":"assets/Kiwi.jpg"},{"Name":"Pineapple","Price":"49","Image":"assets/Pineapple.jpg"},{"Name":"Papaya","Price":"34","Image":"assets/Papaya.jpg"},{"Name":"Zespri","Price":"89","Image":"assets/Zespri.jpg"},{"Name":"Apple","Price":"99","Image":"assets/Apple.jpg"},{"Name":"Pomegranate","Price":"99","Image":"assets/Pomegranate.jpg"},{"Name":"Mosambi","Price":"59","Image":"assets/Mosambi.jpg"},{"Name":"Apple","Price":"99","Image":"assets/Apple.jpg"},{"Name":"Plum","Price":"70","Image":"assets/Plum.jpg"},{"Name":"Dates","Price":"189","Image":"assets/Dates.jpg"},{"Name":"Tender","Price":"39","Image":"assets/Tender.jpg"},{"Name":"Pomegranate","Price":"99","Image":"assets/Pomegranate.jpg"},{"Name":"Baby","Price":"119","Image":"assets/Baby.jpg"}]}';
  Map<String, dynamic> jsonData=json.decode(jsonfile);
  print(jsonData['products'].length);
  for(int i=0;i<jsonData['products'].length;i++){
    products
        .add({
            'Name': jsonData['products'][i]['Name'],
            'Image': jsonData['products'][i]['Image'],
            'Price':jsonData['products'][i]['Price'],
        });
  }
  print("end");
}
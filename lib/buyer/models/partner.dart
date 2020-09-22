import 'package:cloud_firestore/cloud_firestore.dart';

class Partner {
  String image;
  String name;
  String phone;
  GeoPoint location;
  String category; //SPIRIT CATEGORY OF THE ITEM
  Partner(
    this.image,
    this.name,
    this.phone,
    this.location,
    this.category,
  );
}

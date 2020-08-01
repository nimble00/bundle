import 'package:flutter/material.dart';

class Product {
  final String Image;
  final String Name;
  int Qun;
  final String Price;
  final String Detail;
//  final double itemPrice;

  Product({this.Image, this.Name, this.Qun, this.Price, this.Detail=""});
  void incrementQuantity() => Qun+=1;
  void decrementQuantity() => Qun-=1;


}
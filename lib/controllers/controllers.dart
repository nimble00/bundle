import 'dart:convert';
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/wrapper.dart';

Future<bool> pincodeController(String pincode) async{
  var response = await http.get('https://pincode.saratchandra.in/api/pincode/${pincode}');
  if(response.statusCode==200){
    Map<String, dynamic> data = jsonDecode(response.body);
    if(data['status']==200){
      return true;
    }else if(data['status']==404){
      return false;
    }else{
      throw Exception('implement it');
    }
  }else{
    throw Exception('Failed to load album');
  }

}

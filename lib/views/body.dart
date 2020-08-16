import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/views/category_list.dart';

import 'favorites_list.dart';

import 'package:flutter_app/views/spirit.dart';


class Stack {}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Widget _body;
  void initState() {
    globals.category='all';
    globals.current=0;
    _initialList();
    _body=Category();
  }
  void _initialList() {
    Firestore.instance
        .collection('users')
        .document(globals.phoneNumber)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      documentSnapshot['favorites'].forEach((k, v) {
        globals.favorite_name.add(k);
      });
    });
  }

 _CategoryView(){
    if(globals.category=='favorites'){
      _body=Favorites();
      return;
    }
    _body=Category();
}

  @override
  Widget build(BuildContext context) {
    _CategoryView();
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(100.0, 139.0),
            child: Column(children: <Widget>[
              Container(
                  height: 75.0,
                  color: Colors.white,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Center(
                              child: RaisedButton(
                            child: Text("All"),
                            color: (globals.current == 0)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                globals.current = 0;
                                globals.category = "all";
                                _body = Category();
                              });
                            },
                          ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Center(
                              child: RaisedButton(
                            child: Text("Favorites"),
                            color: (globals.current == 5)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                globals.current = 5;
                                globals.category = "favorites";
                                _body = Favorites();
                              });
                            },
                          ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Center(
                              child: RaisedButton(
                            child: Text("Beer"),
                            color: (globals.current == 1)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                globals.current = 1;
                                globals.category = 'beer';
                                _body = Category();
                              });
                            },
                          ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Center(
                              child: RaisedButton(
                            child: Text("Rum"),
                            color: (globals.current == 2)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                globals.current = 2;
                                globals.category = "rum";
                                _body = Category();
                              });
                            },
                          ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Center(
                              child: RaisedButton(
                            child: Text("Whiskey"),
                            color: (globals.current == 3)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                globals.current = 3;
                                globals.category = 'whiskey';
                                _body = Category();
                              });
                            },
                          ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Center(
                              child: RaisedButton(
                            child: Text("Vodka"),
                            color: (globals.current == 4)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                globals.current = 4;
                                globals.category = 'vodka';
                                _body = Category();
                              });
                            },
                          )))
                    ],
                  )),
              Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                      title: Text(
                        " Sort By:" + " " + globals.filter,
                        style: TextStyle(color: Colors.teal),
                      ),
                      trailing: DropdownButton<String>(
                        value: globals.filter,
                        icon: Icon(Icons.filter_list),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.teal),
                        underline: Container(
                          height: 2,
                          color: Colors.white,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            globals.filter = newValue;
                          });
                        },
                        items: <String>['Popularity', 'Price', 'x', 'y']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))),
            ])),
        body: _body);
  }
}


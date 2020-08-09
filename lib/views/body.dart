import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/models/item.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
class Stack {}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Item> display_list = new List();
  int current = 0;
  String category = 'all', filter = 'Popularity';
  //FUCTION TO FIND THE CLOSEST PARTNER
  DocumentSnapshot _nearestPartner(AsyncSnapshot<QuerySnapshot> document) {
    //CHECK FOR ALL LOCATIONS AND FIND THE NEAREST PARTNER
    int min=0;
    double minDistance=distance(globals.geopoint,document.data.documents[0].data['location']);
    for(int i=1;i<document.data.documents.length;i++){
      if(distance(globals.geopoint,document.data.documents[i].data['location'])<minDistance){
        min=i;
        minDistance=distance(globals.geopoint,document.data.documents[i].data['location']);
      }
    }
    return document.data.documents[min];
  }

  double distance(GeoPoint user,GeoPoint partner){
    double R = 6371e3; // metres
    double a1 = user.latitude * pi/180; // φ, λ in radians
    double a2 = partner.latitude * pi/180;
    double a3 = (partner.latitude-user.latitude) * pi/180;
    double a4 = (partner.longitude-user.longitude) * pi/180;

    double a = sin(a3/2) * sin(a3/2) +
    cos(a1) * cos(a2) *
    sin(a4/2) * sin(a4/2);
    double c = 2 * atan2(sqrt(a), sqrt(1-a));

     return R * c; // in metres
  }
  //FUNCTION TO MAKE THE DISPLAY LIST FOR A GIVEN CATEGORY
  void _productList(DocumentSnapshot document) {
    display_list = new List();
    if (category == 'all') {
      document['products'].forEach((k, v) {
        for (int i = 0; i < document['products'][k].length; i++) {
          Item item = new Item(
            document['products'][k]['$i']['itemImage'],
            document['products'][k]['$i']['itemName'],
            1,
            document['products'][k]['$i']['itemPrice'],
            false,
            document['products'][k]['$i']['no_of_orders'],
            document['products'][k]['$i']['itemCategory'],
            '$i',
          );
          display_list.add(item);
        }
      });
    } else {
      try {
        for (int i = 0; i < document['products'][category].length; i++) {
          Item item = new Item(
            document['products'][category]['$i']['itemImage'],
            document['products'][category]['$i']['itemName'],
            1,
            document['products'][category]['$i']['itemPrice'],
            false,
            document['products'][category]['$i']['no_of_orders'],
            document['products'][category]['$i']['itemCategory'],
            '$i',
          );
          display_list.add(item);
        }
      } catch (e) {
        print("Category doesn't exist");
        return;
      }
    }
    filterList();
  }

  Widget _buildProducts(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('pincodes').document(globals.pincode).collection('partners').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return GridView.count(
          crossAxisCount: 2,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: _generateCards(_nearestPartner(snapshot)),
        );
      },
    );
  }

  void filterList() {
    if (filter == 'Price') {
      display_list.sort((a, b) => a.itemPrice.compareTo(b.itemPrice));
    } else
      display_list.sort((b, a) => a.no_of_orders.compareTo(b.no_of_orders));
  }

  List<Card> _generateCards(DocumentSnapshot partner) {
    globals.reference = partner.reference;
    _productList(partner);
    List<Card> cards = List.generate(
      display_list.length,
      (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 40.0 / 11.0,
              child: Image.asset(display_list[index].itemImage),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(display_list[index].itemName),
                    ),
                    Center(
                      child: Text((display_list[index].itemPrice).toString()),
                    ),
                    Center(
                        child: IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            onPressed: () {
                              if (display_list[index].selected == false) {
                                if (!globals.item_name
                                    .contains(display_list[index].itemName)) {
                                  display_list[index].selected = true;
                                  globals.item_name
                                      .add(display_list[index].itemName);
                                  globals.reference.updateData({
                                    'products.${display_list[index].itemCategory}.${display_list[index].itemIndex}.no_of_orders':
                                        FieldValue.increment(1)
                                  });
                                  globals.item_list.add(display_list[index]);
                                }
                              }
                            })),
                    Center(
                        child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            color: (globals.favorite_name
                                    .contains(display_list[index].itemName))
                                ? Colors.red
                                : Colors.black,
                            onPressed: () {
                              if (!globals.favorite_name
                                  .contains(display_list[index].itemName)) {
                                globals.favorite_name
                                    .add(display_list[index].itemName);
                              } else {
                                globals.favorite_name
                                    .remove(display_list[index].itemName);
                              }
                              setState(() {});
                            }))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return cards;
  }

  @override
  Widget build(BuildContext context) {
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
                            color: (current == 0)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                current = 0;
                                category = "all";
                              });
                            },
                          ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Center(
                              child: RaisedButton(
                            child: Text("Beer"),
                            color: (current == 1)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                current = 1;
                                category = 'beer';
                              });
                            },
                          ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Center(
                              child: RaisedButton(
                            child: Text("Rum"),
                            color: (current == 2)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                current = 2;
                                category = "rum";
                              });
                            },
                          ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Center(
                              child: RaisedButton(
                            child: Text("Whiskey"),
                            color: (current == 3)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                current = 3;
                                category = 'whiskey';
                              });
                            },
                          ))),
                      Container(
                          width: MediaQuery.of(context).size.width / 4,
                          child: Center(
                              child: RaisedButton(
                            child: Text("Vodka"),
                            color: (current == 4)
                                ? Colors.tealAccent
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              setState(() {
                                current = 4;
                                category = 'vodka';
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
                        " Sort By:" + " " + filter,
                        style: TextStyle(color: Colors.teal),
                      ),
                      trailing: DropdownButton<String>(
                        value: filter,
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
                            filter = newValue;
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
        body: ListView(children: <Widget>[_buildProducts(context)]));
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/models/item.dart';
import 'dart:math';

import 'package:flutter_app/views/spirit.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Item> display_list;
  void _productLists(DocumentSnapshot document) {
    if (globals.category == 'all') {
      document['products'].forEach((k, v) {
        for (int i = 0; i < document['products'][k].length; i++) {
          Item item = new Item(
            document['products'][k]['$i']['itemImage'],
            document['products'][k]['$i']['itemName'],
            1,
            document['products'][k]['$i']['itemPrice'],
            document['products'][k]['$i']['no_of_orders'],
            document['products'][k]['$i']['itemCategory'],
            '$i',
          );
          display_list.add(item);
        }
      });
    } else {
      try {
        for (int i = 0;
            i < document['products'][globals.category].length;
            i++) {
          Item item = new Item(
            document['products'][globals.category]['$i']['itemImage'],
            document['products'][globals.category]['$i']['itemName'],
            1,
            document['products'][globals.category]['$i']['itemPrice'],
            document['products'][globals.category]['$i']['no_of_orders'],
            document['products'][globals.category]['$i']['itemCategory'],
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

  void filterList() {
    if (globals.filter == 'Price') {
      display_list.sort((a, b) => a.itemPrice.compareTo(b.itemPrice));
    } else
      display_list.sort((b, a) => a.no_of_orders.compareTo(b.no_of_orders));
  }

  //FUCTION TO FIND THE CLOSEST PARTNER
  DocumentSnapshot _nearestPartner(AsyncSnapshot<QuerySnapshot> document) {
    //CHECK FOR ALL LOCATIONS AND FIND THE NEAREST PARTNER
    int min = 0;
    double minDistance =
        distance(globals.geopoint, document.data.documents[0].data['location']);
    for (int i = 1; i < document.data.documents.length; i++) {
      if (distance(
              globals.geopoint, document.data.documents[i].data['location']) <
          minDistance) {
        min = i;
        minDistance = distance(
            globals.geopoint, document.data.documents[i].data['location']);
      }
    }
    return document.data.documents[min];
  }

  double distance(GeoPoint user, GeoPoint partner) {
    double R = 6371e3; // metres
    double a1 = user.latitude * pi / 180; // φ, λ in radians
    double a2 = partner.latitude * pi / 180;
    double a3 = (partner.latitude - user.latitude) * pi / 180;
    double a4 = (partner.longitude - user.longitude) * pi / 180;

    double a = sin(a3 / 2) * sin(a3 / 2) +
        cos(a1) * cos(a2) * sin(a4 / 2) * sin(a4 / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c; // in metres
  }

  List<Card> _generateCards(DocumentSnapshot partner) {
    display_list = new List();
    _productLists(partner);
    globals.reference = partner.reference;
    List<Card> cards = List.generate(
      display_list.length,
      (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 40.0 / 11.0,
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SpiritPage(
                            display_list: display_list,
                            index: index))).then((value) {
                  setState(() {});
                }),
                child: Image.asset(display_list[index].itemImage),
              ),
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
                                if (!globals.item_name
                                    .contains(display_list[index].itemName)) {
                                  globals.item_name
                                      .add(display_list[index].itemName);
                                  globals.reference.updateData({
                                    'products.${display_list[index].itemCategory}.${display_list[index].itemIndex}.no_of_orders':
                                        FieldValue.increment(1)
                                  });
                                  globals.item_list.add(display_list[index]);
                                }

                            })),
                    Center(
                      child: IconButton(
                          icon: globals.favorite_name
                                  .contains(display_list[index].itemName)
                              ? Icon(Icons.favorite, color: Colors.red)
                              : Icon(Icons.favorite_border),
                          onPressed: () {
                            if (!globals.favorite_name
                                .contains(display_list[index].itemName)) {
                              globals.favorite_name
                                  .add(display_list[index].itemName);
                              globals.user
                                  .updateData({
                                'favorites.${display_list[index].itemName}.itemCategory':
                                    display_list[index].itemCategory,
                                'favorites.${display_list[index].itemName}.itemIndex':
                                    display_list[index].itemIndex,
                                'favorites.${display_list[index].itemName}.itemImage':
                                    display_list[index].itemImage,
                                'favorites.${display_list[index].itemName}.itemPrice':
                                    display_list[index].itemPrice,
                                'favorites.${display_list[index].itemName}.no_of_orders':
                                    display_list[index].no_of_orders
                              });
                            } else {
                              globals.favorite_name
                                  .remove(display_list[index].itemName);
                            globals.user
                                  .updateData({
                                'favorites.${display_list[index].itemName}':
                                    FieldValue.delete()
                              });
                            }
                            setState(() {});
                          }),
                    )
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
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('pincodes')
          .document(globals.pincode)
          .collection('partners')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return GridView.count(
          crossAxisCount: 2,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children: _generateCards(_nearestPartner(snapshot)),
        );
      },
    );
  }
}

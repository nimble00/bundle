import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/models/item.dart';
import 'dart:math';

import 'package:flutter_app/views/spirit.dart';

class Favorites extends StatefulWidget {
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Item> display_list;
  _productList(AsyncSnapshot snapshot) {
    snapshot.data['favorites'].forEach((k, v) {
      Item item = new Item(
          snapshot.data['favorites'][k]['itemImage'],
          k,
          1,
          snapshot.data['favorites'][k]['itemPrice'],
          snapshot.data['favorites'][k]['no_of_orders'],
          snapshot.data['favorites'][k]['itemCategory'],
          snapshot.data['favorites'][k]['itemIndex']);
      display_list.add(item);
    });
  }

  void filterList() {
    if (globals.filter == 'Price') {
      display_list.sort((a, b) => a.itemPrice.compareTo(b.itemPrice));
    } else
      display_list.sort((b, a) => a.no_of_orders.compareTo(b.no_of_orders));
  }

  List<Card> _generateCards(AsyncSnapshot snapshot) {
    display_list = new List();
    _productList(snapshot);
    filterList();
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
                              display_list: display_list, index: index))),
                  child: Image.asset(display_list[index].itemImage),
                )),
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
    return StreamBuilder<DocumentSnapshot>(
      stream: globals.user
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        return GridView.count(
          crossAxisCount: 2,
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children: _generateCards(snapshot),
        );
      },
    );
  }
}

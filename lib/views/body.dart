import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/models/item.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Item> display_list = new List();
  String category = 'All', filter = 'Popularity';
  //FUCTION TO FIND THE CLOSEST PARTNER
  DocumentSnapshot _nearestPartner(AsyncSnapshot<QuerySnapshot> document) {
    //CHECK FOR ALL LOCATIONS AND FIND THE NEAREST PARTNER
    return document.data.documents[1];
  }

  //FUNCTION TO MAKE THE DISPLAY LIST FOR A GIVEN CATEGORY
  void _productList(DocumentSnapshot document) {
    display_list = new List();
    if (category == 'All') {
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
      stream: Firestore.instance.collection(globals.pincode).snapshots(),
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
      display_list.sort((a, b) => a.no_of_orders.compareTo(b.no_of_orders));
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
              padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
    return ListView(children: [
      Container(
        height: 10.0,
        color: Colors.grey,
      ),
      Container(
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
              ),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                title: Text(" Search for drinks....",
                    style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
      Container(
          height: 30.0,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          )),
      Container(
          height: 75.0,
          color: Colors.grey,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("All"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      setState(() {
                        category = "All";
                      });
                    },
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Beer"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      setState(() {
                        category = 'beer';
                      });
                    },
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Rum"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      setState(() {
                        category = "Rum";
                      });
                    },
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Whiskey"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      setState(() {
                        category = 'Whiskey';
                      });
                    },
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Vodka"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      setState(() {
                        category = 'Vodka';
                      });
                    },
                  )))
            ],
          )),
      SizedBox(
        height: 10.0,
      ),
      Container(
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            title: Text(
              " Sort By:" + filter,
              style: TextStyle(color: Colors.redAccent),
            ),
            trailing: IconButton(
              color: Colors.redAccent,
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
          )),
      _buildProducts(context)
    ]);
  }
}

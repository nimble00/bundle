import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/models/item.dart';
import 'package:flutter_app/globals.dart' as globals;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String category = 'All', filter = 'Popularity';
  List<Item> display_list = new List();
  Item item1 = new Item('assets/beer.jpg', 'Budweiser', 1, 100);
  Item item2 = new Item('assets/beer.jpg', 'Budweiser', 1, 100);
  Item item3 = new Item('assets/beer.jpg', 'Budweiser', 1, 100);
  /*void itemList() {
    if (filter == 'Price') {
      //EXTRACT THE LIST OF CATEGORY PRODUCTS FROM GIVEN DATA
      display_list.sort((a, b) => a.itemPrice.compareTo(b.itemPrice));
    } else
      display_list.sort((a, b) => a.no_of_orders.compareTo(b.no_of_orders));
  }*/

  List<Card> _generateCards() {
    display_list.add(item1);
    display_list.add(item2);
    display_list.add(item3);
    List<Card> cards = List.generate(
      display_list.length,
      (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 26.0 / 11.0,
            child: Image.asset(display_list[index].itemImage),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(display_list[index].itemName),
                  Text(display_list[index].itemPrice.toString()),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      /*display_list[index].no_of_orders += 1;*/
                      globals.item_list.add(display_list[index]);
                    },
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
                    onPressed: () {},
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Beer"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Rum"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Whiskey"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Vodka"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
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
              " Sort By:  Popularity",
              style: TextStyle(color: Colors.redAccent),
            ),
            trailing: IconButton(
              color: Colors.redAccent,
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
          )),
      GridView.count(
        crossAxisCount: 2,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: _generateCards(),
      )
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/models/item.dart';
import 'package:flutter_app/views/body.dart';
import 'package:flutter_app/views/cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/models/item.dart';

class SpiritPage extends StatefulWidget {

  @override
  _SpiritPageState createState() => _SpiritPageState();
}

class _SpiritPageState extends State<SpiritPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Address"),
          actions: [
            IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () =>
                {
                  // IMPLEMENT THE OFFERS PAGE HERE!
                }),
//          IconButton(
//              icon: Icon(Icons.add_shopping_cart),
//              onPressed: () => {
//                // IMPLEMENT THE OFFERS PAGE HERE!
//              })
          ],
        ),
        body: _buildBody(context),

        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Icon(Icons.home, color: Colors.grey),
              // title: Text('Home'),
              // backgroundColor:
              //     isTapped() ? Colors.lightBlueAccent : Colors.blueGrey,
            ),
            Container(
              child: Icon(Icons.add_circle_outline, color: Colors.grey),

              // title: Text('Extras'),
            ),
            Container(
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  semanticLabel: 'cart',
                ),
                onPressed: () =>
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CartPage())),

              ),
            ),
            Container(
              // icon: Icon(Icons.account_box, color: Colors.grey),
              child: FlatButton(
                onPressed: () {},
                child: Text('Account'),
              ),
            ),
          ],
          // currentIndex: _selectedIndex,
          // selectedItemColor: Colors.amber[800],
          // onTap: _onItemTapped,
        ),
      );

  }
  Widget _buildBody(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: Firestore.instance.collection('products').document('3TLHwpIwrTt2UrygHLEs').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        Item p=new Item(snapshot.data['Image'], snapshot.data['Name'], 1, snapshot.data['Price'], 0, 0);
        return _buildView(context, p);
      },
    );
  }
  Widget _buildView(BuildContext context, Item p){
      return Column(
        children: <Widget>[
          Image.asset(
            p.itemImage,
            height: 240,
          ),
          SizedBox(height: 40),
          //NAME AND PRICE
          Row(
            children: <Widget>[
              Spacer(),
              Text(
                p.itemName,
              ),
              Spacer(),
              Text(
                p.itemPrice.toString(),
              ),
              Spacer(),
            ],
          ),
          //QUANTITY AND PRICE
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: <Widget>[
                      new IconButton(
                        icon: Icon(Icons.add_circle),
                        onPressed: () {
                          p.incrementQuantity();
                          print(p.itemQun);
                          setState(() {});
                        },

                      ),
//                    Spacer(),
                      Text(
                        '${(p.itemQun).toString()}',
//                  '${(itemList[ind].itemQun).toString()}',
                      ),
//                    Spacer(),
                      new IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          p.decrementQuantity();
                          print(p.itemQun);
                          setState(() {});
                        },
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                        },

                      ),
                    ],
                  ),
                ),

              ],
            ),

          ),
          //DETAILS OF PRODUCT
          Container(
            padding: const EdgeInsets.all(32),
            child: Text(
              ' good product in this range',
              softWrap: true,
            ),
          ),

        ],
      );

  }

}


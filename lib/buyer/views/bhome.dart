import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/buyer/views/activeorders.dart';
import 'package:flutter_app/buyer/views/addproducts.dart';
import 'package:flutter_app/buyer/views/myproducts.dart';
import 'package:flutter_app/buyer/views/paccount.dart';
import 'package:flutter_app/buyer/views/pastorders.dart';

class BuyerHomepage extends StatefulWidget {
  @override
  _BuyerHomepageState createState() => _BuyerHomepageState();
}

class _BuyerHomepageState extends State<BuyerHomepage> {
  int _index = 0;
  List<Widget> _bodyList = [
    BuyerActiveOrders(),
    BuyerAddProducts(),
    BuyerMyProducts(),
    BuyerPastOrders(),
    BuyerAccountPage()
  ];
  List<Widget> _appBarList = [
    AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.location_on),
          onPressed: () => {
                // IMPLEMENT A FUNCTION THAT FETCHES LOCATION AND REPLACE THIS ARROW FUNCTION WITH IT!
              }),
      title: Column(children: <Widget>[
        Text(
          "Delivering to",
          style: TextStyle(
              fontSize: 10, fontStyle: FontStyle.normal, color: Colors.black),
        ),
        Text(
          "",
          style: TextStyle(
              fontStyle: FontStyle.normal, fontSize: 11, color: Colors.black),
        )
      ]),
      actions: [
        Container(
          child: Center(
            child: Text(
              "Offers",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15.0,
                  color: Colors.black),
            ),
          ),
        ),
        IconButton(
            color: Colors.black,
            icon: Icon(Icons.local_offer),
            onPressed: () => {
                  // IMPLEMENT THE OFFERS PAGE HERE!
                })
      ],
    ),
    AppBar(
      leading: Icon(
        Icons.explore,
        color: Colors.black,
      ),
      title: Text(
        "Explore Products",
        style: TextStyle(color: Colors.black),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
      leading: Icon(
        Icons.store_mall_directory,
        color: Colors.black,
      ),
      title: Text(
        "My Shop",
        style: TextStyle(color: Colors.black),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
      leading: Icon(
        Icons.done_all,
        color: Colors.black,
      ),
      title: Text(
        "Past Orders",
        style: TextStyle(color: Colors.black),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
        backgroundColor: Colors.green,
        leading: Icon(
          Icons.account_box,
          color: Colors.black,
          // size: 12,
        ),
        title: Text(
          'My Account',
          style: TextStyle(color: Colors.black),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarList[_index],
      body: _bodyList[_index],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 8,
          currentIndex: _index,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (newIndex) {
            setState(() {
              _index = newIndex;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    this._index = 0;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Icon(Icons.explore),
                onPressed: () {
                  setState(() {
                    this._index = 1;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Icon(Icons.store_mall_directory),
                onPressed: () {
                  setState(() {
                    this._index = 2;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  setState(() {
                    this._index = 3;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Icon(Icons.account_box),
                onPressed: () {
                  setState(() {
                    this._index = 4;
                  });
                },
              ),
            ),
          ]),
    );
  }
}
